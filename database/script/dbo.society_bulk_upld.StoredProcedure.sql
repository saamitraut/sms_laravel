USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[society_bulk_upld]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[society_bulk_upld] @ID as bigint,@FilePath as varchar(max),@UserId as bigint as
BEGIN
------------------------------------Upload from excel from EXCEL-------------------------------------------------------------------
declare @var as varchar(max);
set @var ='insert into UPLOADED_SOCIETY_TABLE(SocietyName,SocietyCode,AreaCode,SESSION_ID)
select isNull(cast(SocietyName as varchar),''NA''),isNull(cast(SocietyCode as varchar),''NA''),isNull(cast(AreaCode as varchar),''''),'+cast(@ID as varchar)+'
from OPENROWSET(''Microsoft.ACE.OLEDB.12.0'',''Excel 12.0;Database='+@FilePath+';'',''SELECT SocietyName,SocietyCode,AreaCode FROM [Sheet1$]'')'
print(@var)
exec (@var)

 update UPLOADED_SOCIETY_TABLE set STATUS =1,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+'Duplicate Society Name, ' from UPLOADED_SOCIETY_TABLE 
 where SocietyName in ( Select SocietyName from (Select ROW_NUMBER() over (Partition by SocietyName order by RID desc) as ROWID,x.RID ,x.SocietyName
 from (select ROW_NUMBER() over ( order by SocietyName  ) as RID , SocietyName from UPLOADED_SOCIETY_TABLE where SESSION_ID=@ID ) x) y where ROWID>1)

 update UPLOADED_SOCIETY_TABLE set STATUS =1,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+'Duplicate Society Code, ' from UPLOADED_SOCIETY_TABLE 
 where SocietyCode in ( Select SocietyCode from (Select ROW_NUMBER() over (Partition by SocietyCode order by RID desc) as ROWID,x.RID ,x.SocietyCode
 from (select ROW_NUMBER() over ( order by SocietyCode  ) as RID , SocietyCode from UPLOADED_SOCIETY_TABLE where SESSION_ID=@ID ) x) y where ROWID>1)

 update UPLOADED_SOCIETY_TABLE set STATUS=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+' Society Name is already added in SMS, '  
 where SocietyName in (Select SocietyName from SMS_SOCIETY_MASTER) and SESSION_ID=@ID 

 update UPLOADED_SOCIETY_TABLE set STATUS=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+' Society Code is already added in SMS, '  
 where SocietyCode in (Select SocietyCode from SMS_SOCIETY_MASTER) and SESSION_ID=@ID 

 update UPLOADED_SOCIETY_TABLE set STATUS=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+' Area Code NOT Exist, '  
 where AreaCode not in (Select AREACODE from SMS_AREACODE) and SESSION_ID=@ID 

insert into SMS_SOCIETY_MASTER(SocietyName,SocietyCode,STATUS,AreaId,CREATEDON,CREATEDBY,Deleted,Remark)
select SocietyName,SocietyCode,1,(select id from SMS_AREACODE b where b.AREACODE=a.AreaCode),Getdate(),@UserId,0,'BULK ENTRY'
	from UPLOADED_SOCIETY_TABLE a where status=0 and SESSION_ID=@ID

update UPLOADED_SOCIETY_TABLE set STATUS_REMARK ='Uploaded Successfully' where STATUS =0 and SESSION_ID=@ID
update SESSION_TABLE set EndTime =GETDATE() where Id =@ID

select (select COUNT(Id) from UPLOADED_SOCIETY_TABLE where STATUS =2 and SESSION_ID =@ID ) as Wrong_Entries,(select COUNT(Id) from UPLOADED_SOCIETY_TABLE where STATUS =1 
and SESSION_ID =@ID ) as Duplicate_Entries
,(select COUNT(Id) from UPLOADED_SOCIETY_TABLE where STATUS =0 and SESSION_ID =@ID) as Uploaded_Entries,(select COUNT(Id) from UPLOADED_SOCIETY_TABLE where STATUS =0 
and SESSION_ID =@ID) as Not_UPLOADED,count(Id) as Total
from UPLOADED_SOCIETY_TABLE where SESSION_ID =@ID

select SocietyName,SocietyCode,AreaCode,STATUS_REMARK  from UPLOADED_SOCIETY_TABLE where SESSION_ID =@ID 

END
GO
