USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[z_reseedTable]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[z_reseedTable] @tableName as sysname
as
Begin	
Declare @qDel as varchar(200)
Declare @qReseed as varchar(200)
set @qDel='delete from '+@tableName
print(@qDel)
exec (@qDel)

set @qReseed='DBCC CHECKIDENT ('+@tableName+', RESEED,0)'
print(@qReseed)
exec (@qReseed)
End
GO
