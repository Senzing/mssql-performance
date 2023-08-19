# mssql-performance
This repo contains working notes on MSSQL performance tweaks.

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

## Turn off parallelism, turn on lightweight pooling
```
EXEC sp_configure 'show advanced options', 1;  
GO  
RECONFIGURE WITH OVERRIDE;  
GO  
EXEC sp_configure 'max degree of parallelism', 1;  
GO
EXEC sp_configure 'lightweight pooling', 1;
GO
RECONFIGURE WITH OVERRIDE;  
GO
EXEC sp_configure
GO
```

## What is going on?
```
SELECT sqltext.TEXT,req.status,req.wait_type,count(*) as cnt, sum(req.total_elapsed_time) FROM sys.dm_exec_requests req CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS sqltext where wait_type is not NULL group by sqltext.TEXT,req.status,req.wait_type having count(*)>1 order by cnt asc;
GO
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
