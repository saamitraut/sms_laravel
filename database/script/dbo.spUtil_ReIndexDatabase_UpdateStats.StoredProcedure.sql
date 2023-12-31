USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[spUtil_ReIndexDatabase_UpdateStats]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUtil_ReIndexDatabase_UpdateStats]
AS
DECLARE @MyTable VARCHAR(255)
DECLARE myCursor
CURSOR FOR
SELECT table_name
FROM information_schema.tables
WHERE table_type = 'base table'
and TABLE_NAME like 'SMS_%'
OPEN myCursor
FETCH NEXT
FROM myCursor INTO @MyTable
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT 'Reindexing Table:  ' + @MyTable
DBCC DBREINDEX(@MyTable, '', 80)
FETCH NEXT
FROM myCursor INTO @MyTable
END
CLOSE myCursor
DEALLOCATE myCursor
EXEC sp_updatestats
GO
