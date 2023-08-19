# mssql-performance
This repo contains working notes on MSSQL performance tweaks.

UTF-8 DB
```
CREATE DATABASE G2 COLLATE Latin1_General_100_CS_AI_SC_UTF8
```

Auto-commit enable
```
ALTER DATABASE G2 SET DELAYED_DURABILITY = Forced;
```

Don’t wait for statistic updates
```
ALTER DATABASE G2 SET AUTO_UPDATE_STATISTICS_ASYNC ON;
ALTER DATABASE G2 SET AUTO_CREATE_STATISTICS ON;
```

Turn off parallelism
```
EXEC sp_configure 'show advanced options', 1;  
GO  
RECONFIGURE WITH OVERRIDE;  
GO  
EXEC sp_configure 'max degree of parallelism', 1;  
GO  
RECONFIGURE WITH OVERRIDE;  
GO
EXEC sp_configure
GO
```

What is going on?
```
SELECT sqltext.TEXT,req.status,req.wait_type,count(*) as cnt, sum(req.total_elapsed_time) FROM sys.dm_exec_requests req CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS sqltext group by sqltext.TEXT,req.status,req.wait_type order by cnt asc;
GO
```

LATCH_EX/PAGELATCH_EX?

This is actually very helpful for contention and is the default on Azure SQL.
```
ALTER DATABASE G2 SET ALLOW_SNAPSHOT_ISOLATION ON
GO
ALTER DATABASE G2 SET READ_COMMITTED_SNAPSHOT ON
GO
```

Recreate the LIB_FEAT and RES_FEAT_STAT indexes to optimize for sequential inserts
```
create unique index LIB_FEAT_PK on LIB_FEAT (LIB_FEAT_ID) WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY=ON, DROP_EXISTING=ON, FILLFACTOR=80);```
create unique index RES_FEAT_STAT_PK on RES_FEAT_STAT (LIB_FEAT_ID) WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY=ON, DROP_EXISTING=ON, FILLFACTOR=80);
```
