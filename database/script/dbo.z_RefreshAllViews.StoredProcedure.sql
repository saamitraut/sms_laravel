USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[z_RefreshAllViews]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  Procedure [dbo].[z_RefreshAllViews]

  AS
DECLARE @ViewName nvarchar(max)

  DECLARE @SQL nvarchar(max) 

   

  DECLARE extensionViews CURSOR FOR

      -- Get all views within the database

      SELECT [name] As ViewName

     FROM sys.views

  

 OPEN extensionViews

  

 FETCH NEXT FROM extensionViews

 INTO @ViewName

  

 -- Check @@FETCH_STATUS to see if there are any more rows to fetch.
print @ViewName
 WHILE @@FETCH_STATUS = 0

 BEGIN

  

 -- Build the dynamic SQL for updating the view on the fetched row

 SET @SQL =

 'IF EXISTS (SELECT * FROM sysobjects WHERE type = ''V'' AND name = ''' + @ViewName +''')

     BEGIN

         exec sp_refreshview N''dbo.'+ @ViewName + '''END'  
 print(@SQL)    
 exec(@SQL)     
 

    -- This is executed as long as the previous fetch succeeds.

    FETCH NEXT FROM extensionViews

    INTO @ViewName

 END

  

 CLOSE extensionViews

 DEALLOCATE extensionViews
GO
