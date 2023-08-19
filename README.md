# mssql-performance
This repo contains working notes on MSSQL performance tweaks.

CREATE DATABASE G2 COLLATE Latin1_General_100_CS_AI_SC_UTF8

Auto-commit enhancements
ALTER DATABASE G2 SET DELAYED_DURABILITY = Forced;

Don’t wait for statistic updates
ALTER DATABASE G2 SET AUTO_UPDATE_STATISTICS_ASYNC ON;
ALTER DATABASE G2 SET AUTO_CREATE_STATISTICS ON; 

Turn off parallelism  
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
