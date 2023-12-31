USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[x_CreateHistory_Table]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[x_CreateHistory_Table] @tableName as sysname, @fColumn as sysname
as
Begin
	declare @listCol as varchar(8000)
	--declare @tableName as sysname
	--declare  @fColumn as sysname
	--set @tableName='SMS_SUBSCRIBERS'
	--set @fColumn='SubscriberId'
	SELECT  @listCol ='IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].['+@tableName+'_HISTORY]'') AND type in (N''U''))
Begin
DROP TABLE [dbo].['+@tableName+'_HISTORY] end
'+replace( 'CREATE TABLE  dbo.['+@tableName+'_HISTORY] 
					(
					[Id] [bigint] IDENTITY(1,1) NOT NULL,
					['+@fColumn+'] [bigint]  NOT NULL,' +STUFF(( SELECT ' ,
					[' + ltrim(COLUMN_NAME) +'] ['+ltrim(DATA_TYPE)+ '] '+Case isnull(CHARACTER_MAXIMUM_LENGTH,0)  when 0 then '' else '('+cast(CHARACTER_MAXIMUM_LENGTH as varchar)+')' end  
					+Case IS_NULLABLE when 'No' then ' Not Null ' else 'Null 'end 
					FROM    INFORMATION_SCHEMA.COLUMNS  
					where 	TABLE_NAME	=@tableName and COLUMN_NAME!='Id'				
					ORDER BY  ORDINAL_POSITION
					FOR XML PATH('')
								), 1, 2, '') + '','&#x0D;',' ')+',
					InsertedOn [datetime] not null DEFAULT GETDATE()  ,
					InsertedBy [bigint] not null,
					PreviousId [bigint] not null Default(0),
					DMLAction tinyint not null,				
					DMLComments varchar(8000),
				CONSTRAINT [PK_'+@tableName+'_HISTORY] PRIMARY KEY CLUSTERED 
				(
				[Id] ASC
				)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
);'
	print @listCol;
	exec (@listCol);
end
GO
