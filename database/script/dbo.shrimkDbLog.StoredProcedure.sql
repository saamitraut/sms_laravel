USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[shrimkDbLog]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Danish Qamar>
-- Create date: <22 June 2010>
-- Description: <Shrink Db Log File >
-- =============================================
CREATE procedure [dbo].[shrimkDbLog]
as
begin
-- Declare variables
DECLARE @SqlStatement as nvarchar(max)
DECLARE @LogFileLogicalName as sysname
-- Alter the database to simple recovery
SET @SqlStatement = 'ALTER DATABASE ' + DB_NAME() + ' SET RECOVERY SIMPLE'
EXEC ( @SqlStatement )
-- Make sure it has been altered
SELECT [name], [recovery_model_desc] FROM sys.databases WHERE [name] = DB_NAME()
-- Set the log file name variable
SELECT @LogFileLogicalName = [Name] FROM sys.database_files WHERE type = 1
-- Shrink the logfile
DBCC Shrinkfile(@LogFileLogicalName, 1)
-- Alter the database back to FULL
SET @SqlStatement = 'ALTER DATABASE ' + DB_NAME() + ' SET RECOVERY FULL'
EXEC ( @SqlStatement )
-- Make sure it has been changed back to full
SET @SqlStatement = 'SELECT [name], [recovery_model_desc] FROM ' + DB_NAME() + '.sys.databases WHERE [name] = ''' + DB_NAME() + ''''
EXEC ( @SqlStatement )

End
GO
