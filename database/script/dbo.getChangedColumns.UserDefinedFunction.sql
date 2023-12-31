USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getChangedColumns]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getChangedColumns](@tableName as sysname)
returns varchar(8000)
As
begin
	declare @listCol as varchar(8000)	
	SELECT  @listCol=STUFF(( SELECT ' + Case i.[' + ltrim(COLUMN_NAME) +'] when d.[' + ltrim(COLUMN_NAME) +'] then ''''  else '''+ ltrim(COLUMN_NAME) +','' end ' 
					FROM    INFORMATION_SCHEMA.COLUMNS  
					where 	TABLE_NAME	=@tableName and COLUMN_NAME not in ('Id','Remark','Deleted','UpdatedBy','UpdatedOn','CreatedBy','CreatedOn')
					ORDER BY  ORDINAL_POSITION
					FOR XML PATH('')
								), 1, 2, '')
	return @listCol
End
GO
