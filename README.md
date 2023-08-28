# mssql-performance
This repo contains working notes on MSSQL performance tweaks.  This work was all done on MS SQL 2022 with the docker container.
If you haven't already taken a look at the general performance document, please do: https://github.com/Senzing/performance-general/blob/main/README.md

## UTF-8 DB
```
CREATE DATABASE G2 COLLATE Latin1_General_100_CS_AI_SC_UTF8
```

## Auto-commit enable
```
ALTER DATABASE G2 SET DELAYED_DURABILITY = Forced;
```

## Don’t wait for statistic updates
```
ALTER DATABASE G2 SET AUTO_UPDATE_STATISTICS_ASYNC ON;
ALTER DATABASE G2 SET AUTO_CREATE_STATISTICS ON;
```

## Turn on lightweight pooling
```
EXEC sp_configure 'show advanced options', 1;  
GO  
RECONFIGURE WITH OVERRIDE;  
GO
--- This is the default and seems to work well
--- EXEC sp_configure 'max degree of parallelism', 0;  
--- GO
EXEC sp_configure 'lightweight pooling', 1;
GO
RECONFIGURE WITH OVERRIDE;  
GO
EXEC sp_configure
GO
```

## What is going on?
```
--- Currently waiting 
select sqltext, CAST (STRING_AGG(wait_type, "|") as varchar(50)), sum(cnt) as cnt, sum(elapsed) as elapsed from (SELECT sqltext.TEXT as sqltext,req.wait_type as wait_type,count(*) as cnt, sum(req.total_elapsed_time) elapsed FROM sys.dm_exec_requests req CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS sqltext where wait_type is not NULL group by sqltext.TEXT, req.wait_type having count(*)>1) a group by a.sqltext order by 3 desc;
GO
--- Transactions per minute for the entire repository (doesn't count updates)
--- light dimming, limited to last hour
select CUR_MINUTE as timegroup, count(*) from (select CONVERT(VARCHAR,DATEADD(s,ROUND(DATEDIFF(s,'1970-01-01 00:00:00',FIRST_SEEN_DT)/60,0)*60,'1970-01-01 00:00:00'),20) as CUR_MINUTE from DSRC_RECORD WITH (NOLOCK) where FIRST_SEEN_DT > DATEADD(hh, -1, GETDATE())) a group by CUR_MINUTE order by CUR_MINUTE ASC;
GO
--- Entire historical overall perf (only good for single large batch loads), could add where FIRST_SEEN_DT > ? to limit it to recent
--- light dimming, limited to last hour
select min(FIRST_SEEN_DT) load_start, count(*) / (DATEDIFF(s,min(FIRST_SEEN_DT),max(FIRST_SEEN_DT))/60) erpm, count(*) total, DATEDIFF(mi,min(FIRST_SEEN_DT),max(FIRST_SEEN_DT))/(60.0*24.0) duration from DSRC_RECORD WITH (NOLOCK) where FIRST_SEEN_DT > DATEADD(hh, -1, GETDATE());
```

### LATCH_EX/PAGELATCH_EX?

This is actually very helpful for contention and is the default on Azure SQL.
```
ALTER DATABASE G2 SET ALLOW_SNAPSHOT_ISOLATION ON
GO
ALTER DATABASE G2 SET READ_COMMITTED_SNAPSHOT ON
GO
```

Recreate the LIB_FEAT and RES_FEAT_STAT indexes to optimize for sequential inserts

This is a pretty neat capability.  Rather than have to manually call "REVERSE" to create a functional index and make sure you use it in query (or like DB2 which has patented reverse indexes), MS SQL has this flag you can set to let the system know the index will have contention due to sequential keys (like LIB_FEAT_ID).  When you restart the database, it doesn't use this initially but takes a few minutes of PAGELATCH_EX contention and then it figures it out.  You then get BTREE_INSERT_FLOW_CONTROL and eventually the contention just largely goes away.

Sometimes you will see PAGELATCH_EX come back, perf will drop, then BTREE_INSERT_FLOW_CONTROL... and then the contention is resolved.
```
CREATE unique index LIB_FEAT_PK on LIB_FEAT (LIB_FEAT_ID) WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY=ON, DROP_EXISTING=ON, FILLFACTOR=80);```
CREATE unique index RES_FEAT_STAT_PK on RES_FEAT_STAT (LIB_FEAT_ID) WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY=ON, DROP_EXISTING=ON, FILLFACTOR=80);
```

Drop extra tables and indexes
```
DROP TABLE DSRC_RECORD_HKEY, LIB_FEAT_HKEY, OBS_ENT_SKEY, RES_ENT_RKEY, RES_FEAT_LKEY;
GO
DROP TABLE OBS_FEAT_EKEY; -- ONLY IF THE TABLE IS COMPLETELY EMPTY
GO
DROP INDEX DSRC_RECORD.DSRC_RECORD_HK; -- 3.6 and newer
GO
```

For other schema optimizations take a look at performance_mods.sql in this repository.

