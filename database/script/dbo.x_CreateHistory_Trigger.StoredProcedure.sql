USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[x_CreateHistory_Trigger]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[x_CreateHistory_Trigger] @tableName as sysname,@fpClmn as sysname='FId',@delTrig as bit=0
as
Begin
if(@fpClmn is not null )
	exec x_CreateHistory_Table @tableName,@fpClmn

declare @query as varchar(8000)	
declare @query2 as varchar(8000)	
declare @query3 as varchar(8000)	
declare @listCol as varchar(8000)	
declare @listCase as varchar(8000)	
declare @listWhereCase as varchar(8000)	
declare @instlist as varchar(8000)	
--declare @tableName as sysname 
--set @tableName ='SMS_OPERATOR'

	SELECT  @listCase=STUFF(( SELECT ' + Case isnull(i.[' + ltrim(COLUMN_NAME) +'],'''') when isnull(d.[' + ltrim(COLUMN_NAME) +'],'''') then ''''  else '''+ ltrim(COLUMN_NAME) +','' end ' 
					FROM    INFORMATION_SCHEMA.COLUMNS  
					where 	TABLE_NAME	=@tableName and COLUMN_NAME not in ('Id','Remark','UpdatedBy','UpdatedOn','CreatedBy','CAS_STATUS','CreatedOn','IsLocked','LockedOn','LockedFrom')
					ORDER BY  ORDINAL_POSITION
					FOR XML PATH('')
								), 1, 2, '')
				,
  @listWhereCase =STUFF(( SELECT 'or  i.[' + ltrim(COLUMN_NAME) +']!=d.[' + ltrim(COLUMN_NAME) +'] ' 
					FROM    INFORMATION_SCHEMA.COLUMNS  
					where 	TABLE_NAME	=@tableName and COLUMN_NAME not in ('Id','Remark','UpdatedBy','UpdatedOn','CAS_STATUS','CreatedBy','CreatedOn','IsLocked','LockedOn','LockedFrom')
					ORDER BY  ORDINAL_POSITION
					FOR XML PATH('')
								), 1, 2, '')
				,
	@listCol=' '+STUFF(( SELECT ' ,  i.[' + ltrim(COLUMN_NAME) +']' 
					FROM    INFORMATION_SCHEMA.COLUMNS  
					where 	TABLE_NAME	=@tableName 
					ORDER BY  ORDINAL_POSITION
					FOR XML PATH('')
								), 1, 2, '')+'  '
,@instlist=' '+STUFF(( SELECT ' , [' + ltrim(COLUMN_NAME) +']' 
					FROM    INFORMATION_SCHEMA.COLUMNS  
					where 	TABLE_NAME	=@tableName+'_History' and COLUMN_NAME not in ('Id','InsertedOn')
					ORDER BY  ORDINAL_POSITION
					FOR XML PATH('')
								), 1, 2, '')+' '
--print @listWhereCase
--print @listCase
--print @listCol
--print @instlist 
set @query='IF OBJECT_ID (''[HM_INSERT_'+@tableName+']'', ''TR'') IS NOT NULL
   DROP TRIGGER [HM_insert_'+@tableName+'];'
print '--------------------------------------'
print (@query)
exec (@query)

if(@fpClmn is not null )
Begin
exec('Insert into '+@tableName+'_History ('+@instlist+',InsertedOn)
Select '+@listCol+', CREATEDBY as [InsertedBy],0 as PreviousId,1 as [DMLAction],''Inserted'' as [DMLComments],CreatedOn from '+@tableName+' i ;
Delete from LOG_DMLACTIONS where TableName=''+@tableName+'';
Insert into LOG_DMLACTIONS(DMLAction,TableName,AffectedId,AffectedHisId,InsertedBy,InsertedOn)
select  1,'''+@tableName+''','+@fpClmn+',Id,CREATEDBY,CreatedOn from  '+@tableName+'_History');
end
else
set @fpClmn='FId'
print @tableName
print @listCol
print @listCol

exec('Create trigger [HM_INSERT_'+@tableName+']
ON  [dbo].['+@tableName+']   AFTER Insert
AS 
BEGIN
Insert into '+@tableName+'_History ('+@instlist+')
Select '+@listCol+',i.CREATEDBY as [InsertedBy],0 as PreviousId,1 as [DMLAction],''Inserted'' as [DMLComments] from inserted i 
Insert into LOG_DMLACTIONS(DMLAction,TableName,AffectedId,AffectedHisId,InsertedBy,InsertedOn)
select  1,'''+@tableName+''',Id,isnull((Select max(Id) from '+@tableName+'_History where '+@fpClmn+'=Id),0),CREATEDBY,getdate()  from inserted 
End')

----------
set @query='IF OBJECT_ID (''[HM_UPDATE_'+@tableName+']'', ''TR'') IS NOT NULL
   DROP TRIGGER [HM_UPDATE_'+@tableName+'];'
print '--------------------------------------'
print (@query)
exec (@query)

exec('Create trigger [HM_UPDATE_'+@tableName+']
ON  [dbo].['+@tableName+']   AFTER UPDATE
AS 
BEGIN
Insert into '+@tableName+'_History ('+@instlist+')
Select '+@listCol+', isnull(i.UPDATEDBY,i.CREATEDBY) as [InsertedBy],isnull((Select max(Id) from '+@tableName+'_History where '+@fpClmn+'=i.Id),0) 
as PreviousId,
Case i.Deleted when 1 then 3 else 2 end as [DMLAction],'+@listCase+' as [DMLComments]  from inserted i left outer join deleted d on i.Id=d.Id 
where '+@listWhereCase+';
Insert into LOG_DMLACTIONS(DMLAction,TableName,AffectedId,AffectedHisId,InsertedBy,InsertedOn)
select  Case i.Deleted when 1 then 3 else 2 end ,'''+@tableName+''',i.Id,
isnull((Select max(Id) from '+@tableName+'_History where '+@fpClmn+'=i.Id),0),i.CREATEDBY,getdate()  from inserted i
left outer join deleted d on i.Id=d.Id where '+@listWhereCase+';
Begin TRY
	delete from '+@tableName+' where Id in (Select Id from inserted where Deleted=1)
End Try
Begin Catch
	SELECT
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage			
End Catch
End');
set @query='IF OBJECT_ID (''[HM_DELETE_'+@tableName+']'', ''TR'') IS NOT NULL
   DROP TRIGGER [HM_DELETE_'+@tableName+'];'
print '--------------------------------------'
print (@query)
exec (@query)

if (@delTrig=1)
begin
exec('Create trigger [HM_DELETE_'+@tableName+']
ON  [dbo].['+@tableName+']   AFTER DELETE
AS 
BEGIN
Insert into '+@tableName+'_History ('+@instlist+')
Select '+@listCol+',-4 as [InsertedBy],isnull((Select max(Id) from '+@tableName+'_History where '+@fpClmn+'=i.Id),0) as PreviousId,4 as 
[DMLAction],''Deleted'' as [DMLComments] from deleted i where i.deleted=0

End');
set @query='sp_settriggerorder @triggername= ''HM_DELETE_'+@tableName+''', @order=''LAST'', @stmttype = ''DELETE'';'
end


exec ('sp_settriggerorder @triggername= ''HM_INSERT_'+@tableName+''', @order=''LAST'', @stmttype = ''INSERT'';')
exec ('sp_settriggerorder @triggername= ''HM_UPDATE_'+@tableName+''', @order=''LAST'', @stmttype = ''UPDATE'';')

end
GO
