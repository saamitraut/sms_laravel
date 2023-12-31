USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[sub_bulk_upld_onlyAcc]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sub_bulk_upld_onlyAcc] @ID as bigint,@FilePath as varchar(max),@UserId as bigint as

BEGIN
--------------------------------------Upload from excel from EXCEL-------------------------------------------------------------------
declare @var as varchar(max);

set @var ='insert into UPLOADED_DATA_TABLE(FNAME,MNAME,LNAME,GENDER,MOBILE,OPERATOR,AREA,SOCIETY,ADDRESS,
ZIP_CODE,CONN_SCH_CODE,STB_BRAND,STB_NO,SMC_BRAND,SC_NO,SESSION_ID,BOUQUETCODE)
select isNull(cast(FNAME as varchar),''NA''),isNull(cast(MNAME as varchar),''NA''),isNull(cast(LNAME as varchar),''NA''),isNull(cast(GENDER as varchar),''M''),
isNull(cast(MOBILE as varchar),''''),isNull(cast(OPERATORCODE as varchar),'''') as OPERATOR,isNull(cast(AREACODE as varchar),'''') as AREA,
isNull(cast(SOCIETYCODE as varchar),'''') as SOCIETY,isNull(replace(replace(cast(ADDRESS as varchar),'''''''',''''),''"'',''''),''''),
isNull(cast(ZIP_CODE as varchar),''11111''),isNull(cast(CONN_SCH_CODE as varchar),''''),isNull(cast(STB_BRAND as varchar),''''),isNull(cast(STB_NO as varchar),''''),
isNull(cast(SMC_BRAND as varchar),''''),isNull(cast(SC_NO as varchar),''''),'+cast(@ID as varchar)+',''NA''
from OPENROWSET(''Microsoft.ACE.OLEDB.12.0'',''Excel 12.0;Database='+@FilePath+';'',
''SELECT FNAME,MNAME,LNAME,GENDER,MOBILE,OPERATORCODE,AREACODE,SOCIETYCODE,ADDRESS,ZIP_CODE,CONN_SCH_CODE,STB_BRAND,STB_NO,SMC_BRAND,SC_NO FROM [Sheet1$]'') 
where STB_NO is not null'

print(@var)

exec (@var)

-----------------------------------------------------Check for duplicates------------------------------------------------------------
 update UPLOADED_DATA_TABLE set STATUS =1,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+'Duplicate Smartcard, ' from UPLOADED_DATA_TABLE 
 where SC_NO in ( Select SC_NO from (Select ROW_NUMBER() over (Partition by SC_NO order by RID desc) as ROWID,x.RID ,x.SC_NO
 from (select ROW_NUMBER() over ( order by SC_NO  ) as RID , SC_NO from UPLOADED_DATA_TABLE where SESSION_ID=@ID ) x) y where ROWID>1)

 update UPLOADED_DATA_TABLE set STATUS=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+' Smartcard No is already added in SMS, '  
 where SC_NO in (Select SmartcardNo from SMS_SMARTCARDS) and SESSION_ID=@ID   

 update UPLOADED_DATA_TABLE set STATUS=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+' Smartcard Brand NOT FOUND, '  
 where SMC_BRAND not in (Select  BrandTitle from SMS_STBSCBRAND where FORSMARTCARD=1) and SESSION_ID=@ID 

 update UPLOADED_DATA_TABLE set STATUS=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+' Invalid Length of Smartcard No, '  
 from UPLOADED_DATA_TABLE a inner join SMS_STBSCBRAND b on a.SMC_BRAND=b.BrandTitle where (LEN(a.SC_NO)<>b.Maxlength) and a.SESSION_ID =@ID 

 update UPLOADED_DATA_TABLE set STATUS=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+' Invalid Characters in Smartcard No, '  
 from UPLOADED_DATA_TABLE a inner join SMS_STBSCBRAND b on a.SMC_BRAND=b.BrandTitle  
 where dbo.RegexMatch(Case b.CharAllowed when 1 then '^\d{'+CAST(b.Maxlength as varchar)+'}$' when 2 then '^([a-zA-Z0-9]){'+CAST(b.Maxlength as varchar)+'}$'  
 when 3 then '^([a-fA-F0-9]){'+CAST(b.Maxlength as varchar)+'}$' else '^([a-zA-Z]){'+CAST(b.Maxlength as varchar)+'}$' end ,ltrim(rtrim((a.SC_NO))))=0 and a.SESSION_ID=@ID      

 update UPLOADED_DATA_TABLE set STATUS =2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+'Duplicate STB, ' from UPLOADED_DATA_TABLE 
 where STB_NO in ( Select STB_NO from (Select ROW_NUMBER() over (Partition by STB_NO order by RID desc) as ROWID,x.RID ,x.STB_NO
 from (select ROW_NUMBER() over ( order by STB_NO  ) as RID , STB_NO from UPLOADED_DATA_TABLE where SESSION_ID=@ID ) x) y where ROWID>1)

 update UPLOADED_DATA_TABLE set STATUS=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+' STB No is already added in SMS, '  
 where STB_NO in (Select STBNo from SMS_STBS) and SESSION_ID=@ID  

 update UPLOADED_DATA_TABLE set STATUS=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+' STB Brand NOT FOUND, '  
 where STB_BRAND not in (Select  BrandTitle from SMS_STBSCBRAND where FORSMARTCARD=0) and SESSION_ID=@ID 

 update UPLOADED_DATA_TABLE set STATUS=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+' Invalid Length of STB No, '  
 from UPLOADED_DATA_TABLE a inner join SMS_STBSCBRAND b on a.STB_BRAND=b.BrandTitle where (LEN(a.STB_NO)<>b.Maxlength) and a.SESSION_ID =@ID

 update UPLOADED_DATA_TABLE set STATUS=2,STATUS_REMARK =ISNULL(STATUS_REMARK,' ')+' Invalid Characters in STB No, '  
 from UPLOADED_DATA_TABLE a inner join SMS_STBSCBRAND b on a.STB_BRAND =b.BrandTitle   
 where dbo.RegexMatch(Case b.CharAllowed when 1 then '^\d{'+CAST(b.Maxlength as varchar)+'}$' when 2 then '^([a-zA-Z0-9]){'+CAST(b.Maxlength as varchar)+'}$'  
 when 3 then '^([a-fA-F0-9]){'+CAST(b.Maxlength as varchar)+'}$' else '^([a-zA-Z]){'+CAST(b.Maxlength as varchar)+'}$' end ,ltrim(rtrim((a.STB_NO))))=0  
 and a.SESSION_ID=@ID  

 Update a set a.STATUS=2,a.STATUS_REMARK=ISNULL(a.STATUS_REMARK,' ')+' Smartcard and STB are not from same CAS, '  
 from UPLOADED_DATA_TABLE a left outer join SMS_STBSCBRAND b on b.BrandTitle=a.SMC_BRAND 
 left outer join SMS_STBSCBRAND c on c.BrandTitle=a.STB_BRAND where b.CASTYPEID!=c.CASTYPEID and a.SESSION_ID=@ID 

 update UPLOADED_DATA_TABLE set Status=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+'AREA NOT FOUND, ' 
 where AREA not in (Select AREACODE from SMS_AREACODE) and SESSION_ID=@ID 

 update UPLOADED_DATA_TABLE set Status=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+'Society NOT FOUND, ' 
 where SOCIETY not in (Select SocietyCode from SMS_SOCIETY_MASTER) and SESSION_ID=@ID 

 update UPLOADED_DATA_TABLE set Status=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+'Operator NOT FOUND, '
 where OPERATOR not in (Select CODE from SMS_OPERATOR) or OPERATOR='0' and SESSION_ID=@ID 

 update UPLOADED_DATA_TABLE set Status=2,STATUS_REMARK=ISNULL(STATUS_REMARK,' ')+' Connection Scheme NOT FOUND, '  
 where CONN_SCH_CODE not in (Select CODE from SMS_CONNECTIONSCHEME) and SESSION_ID=@ID   

 update UPLOADED_DATA_TABLE set STATUS=2,STATUS_REMARK =ISNULL(STATUS_REMARK,' ')+' Area not assigned to this Operator, '  
 from UPLOADED_DATA_TABLE a inner join sms_view_area b on a.Area=b.AreaCode where a.Operator!=b.OperatorCode and a.SESSION_ID =@ID

 update UPLOADED_DATA_TABLE set STATUS=2,STATUS_REMARK =ISNULL(STATUS_REMARK,' ')+' Society does not come under this Area, '  
 from UPLOADED_DATA_TABLE a inner join sms_view_society b on a.SOCIETY=b.SocietyCode where a.Area!=b.AreaCode and a.SESSION_ID=@ID

--------------------------Smartcards insert------------------------------------------
Update SMS_SMARTCARDS set sms_id=0

insert into SMS_SMARTCARDS(SmartcardNo,BrandId,CreatedOn,CreatedBy,sms_id)
select upper(a.SC_NO),b.Id,GETDATE(),@UserId,a.Id from UPLOADED_DATA_TABLE a
inner join SMS_STBSCBRAND b on a.SMC_BRAND=b.BrandTitle
where SC_NO Not in (select SmartcardNo from SMS_SMARTCARDS ) and LEN (SC_NO)=b.Maxlength and a.STATUS=0 and a.SESSION_ID =@ID

----------------------------STB insert---------------------------------------------------
Update SMS_STBS set sms_id=0

insert into SMS_STBS(STBNo,BrandId,CreatedOn,CreatedBy,sms_id)
select upper(a.STB_NO),b.Id,GETDATE(),@UserId,a.Id from UPLOADED_DATA_TABLE a
inner join SMS_STBSCBRAND b on a.STB_BRAND=b.BrandTitle
where a.STB_NO Not in (select STBNo from SMS_STBS ) and LEN (a.STB_NO)=b.Maxlength and a.STATUS=0 and a.SESSION_ID =@ID 

if(OBJECT_ID('tempdb.dbo.#Upl_Data_Table') is not null)
	drop table  #Upl_Data_Table

select IDENTITY(Int,1,1) as Id,FNAME,LNAME,MNAME,ADDRESS,GENDER,ZIP_CODE,OPERATOR,SOCIETY,MOBILE,CONN_SCH_CODE,SC_NO,STB_NO,STATUS,SESSION_ID
into #Upl_Data_Table from UPLOADED_DATA_TABLE where SESSION_ID=@ID and STATUS=0

---------------------------------------------Insert pairing-----------------------------------
update SMS_PAIRING set sms_id=0;   --If value is Null or Any number is there then set to 0

insert into SMS_PAIRING (SmartCardId,StbId,AllocatedOperatorId,CreatedOn,CreatedBy,sms_id)
select c.Id,b.Id,o.ID,GETDATE(),@UserId,a.Id
from #Upl_Data_Table a inner join SMS_STBS b on a.STB_NO=b.STBno
inner join SMS_SMARTCARDS c on a.SC_NO=c.SmartcardNo 
inner join SMS_OPERATOR o on o.Code=a.OPERATOR
where a.SESSION_ID=@ID and a.Status=0 and c.Id not in (Select Smartcardid from SMS_pairing) 
and b.Id not in (Select STBid from SMS_pairing) 

Update UPLOADED_DATA_TABLE set 
STATUS= case when (Select COUNT(*) as cnt from SMS_SUBSCRIBERACCOUNTS where PairingId=p.Id)=0 then 4 
else 2 end,STATUS_REMARK= case when (Select COUNT(*) as cnt from SMS_SUBSCRIBERACCOUNTS where PairingId=p.Id)=0
 then '' else ISNULL(STATUS_REMARK,'')+'Already Assigned' end
from UPLOADED_DATA_TABLE a inner join sms_view_pairing p on p.SmartcardNo=a.SC_NO and p.STBNo=a.STB_NO where p.sms_id>0 and a.SESSION_ID=@ID

Update #Upl_Data_Table set 
STATUS= case when (Select COUNT(*) as cnt from SMS_SUBSCRIBERACCOUNTS where PairingId=p.Id)=0 then 4 else 2 end
from #Upl_Data_Table a inner join sms_view_pairing p on p.SmartcardNo=a.SC_NO and p.STBNo=a.STB_NO where p.sms_id>0 and a.SESSION_ID=@ID

if(OBJECT_ID('tempdb.dbo.#Upl_Data_TableF') is not null)
		drop table  #Upl_Data_TableF

select * into #Upl_Data_TableF from #Upl_Data_Table

Update SMS_PAIRING set Status=1 where sms_id>0

update SMS_PAIRING set sms_id=x.Sess from SMS_PAIRING p 
inner join (Select a.Id as Sess,s.Id as SmartcardId,b.Id as STBId from #Upl_Data_Table a 
inner join SMS_SMARTCARDS s on s.SmartcardNo=a.SC_NO inner join SMS_STBS b on b.STBNo=a.STB_NO
where a.SESSION_ID=@ID and a.STATUS=4)x on x.STBId=p.StbId and x.SmartcardId=p.SmartCardId

update SMS_SUBSCRIBERS set sms_id=0 where sms_id>0

declare @CustomerId bigint;
declare @Iddd as bigint 

while exists(select id from #Upl_Data_TableF)
begin 

	select top 1 @Iddd=Id from #Upl_Data_TableF

	Select @CustomerId=isnull(MAX(cast(substring(CustomerId,4,LEN(CustomerId))as varchar)),0) from SMS_SUBSCRIBERS_HISTORY

	----------------------Insert into SMS_SUBSCRIBER Table------------------------------------
	Insert into SMS_SUBSCRIBERS(FormNo,CustomerId,OperatorId,SocietyId,MobileNo,Status,OpTobeBilled,CreatedOn,CreatedBy,Deleted,Remark,sms_id)
	Select 'FRM'+dbo.getNdigit(@CustomerId+ROW_NUMBER()over(order by a.Id ),7),'BCN'+dbo.getNdigit(@CustomerId+ROW_NUMBER()over(order by a.Id ),7),
	ISNULL(o.ID,1),ISNULL(s.Id,1),ISNULL(a.MOBILE,'9999999999'),1,1,GETDATE(),@UserId,'0','Bulk Sub Upload',a.Id
	from #Upl_Data_Table a left join SMS_OPERATOR o on o.CODE=a.OPERATOR
	left join SMS_SOCIETY_MASTER s on s.SocietyCode=a.Society 
	where a.STATUS=4 and a.SESSION_ID=@ID and a.Id=@Iddd

	delete from #Upl_Data_TableF where Id=@Iddd
end

----------------------Insert into SMS_SUBSCRIBER_DETAILS Table------------------------------------
Insert into SMS_SUBSCRIBERS_DETAILS(SubscriberId,FName,LName,Mname,Address,Gender,Zipcode,CreatedOn,CreatedBy,Deleted,Remark)
Select s.Id,a.FNAME,a.LNAME,a.MNAME,a.ADDRESS,ISNULL(a.GENDER,'F'),ISNULL(a.ZIP_CODE,'600044'),GETDATE(),@UserId,'0','Bulk Sub Upload '
from #Upl_Data_Table a left join SMS_SUBSCRIBERS s on a.Id=s.sms_id
where a.STATUS=4 and a.SESSION_ID=@ID

----------------------Insert into SMS_SUBSCRIBER_Accounts Table------------------------------------
update SMS_SUBSCRIBERACCOUNTS set sms_id=0 where sms_id>0

insert into SMS_SUBSCRIBERACCOUNTS (SubscriberId,ConnectionId,IsPrimary,ApplicableRate,PairingId,ActivationDate,
	CreatedOn,CreatedBy,Description,TimeShift,BillingSMonth,ExpiryDate,sms_id)
Select s.Id,ISNULL(c.Id,'3'),1,1,p.Id as Pairing,GETDATE(),GETDATE(),@UserId,'Bulk Subscriber Upload',0,GETDATE(),DATEADD(YEAR,10,GETDATE()),a.Id
from #Upl_Data_Table a left join SMS_SUBSCRIBERS s on a.Id=s.sms_id
left join SMS_CONNECTIONSCHEME c on a.CONN_SCH_CODE=c.Code
left join SMS_PAIRING p on p.sms_id=a.Id
where a.STATUS=4 and p.Id is not null and s.Id is not null and a.SESSION_ID=@ID

select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,Id as AccountId,
isnull(ActivationDate,GETDATE()) as CommandDate,@UserId as CreatedBy,CASTYPEID 
into #temp_pairings from sms_view_accounts_pairings b where b.SmartcardNo in (select SC_NO from #Upl_Data_Table)

declare @AccId bigint;
declare @casTypeId as bigint 

while exists(select AccountId from #temp_pairings)
Begin

select top 1 @AccId=AccountId,@casTypeId=CASTYPEID from #temp_pairings
if(@casTypeId=4)

Begin

insert into SMS_CATVISION_CMDS (SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,
Status,Command_Param,Remark,CommandDate,CreatedOn,CreatedBy,Command)
select SmartcardNo as SmartCardNo,SmartCardId as SmartCardId,STBNo as STBNo,StbId as StbId,SubscriberId,AccountId,'103' as CommandId,
'Create_smartcard_request' as CommandName,0 as Status,'103' as Command_Param,'Create_smartcard_request' as Remark,getdate() as CommandDate,getdate() as CreatedOn
,CreatedBy,SmartcardNo as Command
from #temp_pairings where AccountId=@AccId and CASTYPEID=@casTypeId
End

if(@casTypeId=5)

Begin

		Insert into SMS_BCAS_CMDS(SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,STBNo,SubscriberId,AccountId,'ADD_SMARTCARD','0201'+'03'+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo+'11'+dbo.fn_varbintostr_(Len(STBNo),4)+dbo.fn_varbintostr_(STBNo,Len(STBNo))+'09000800580023',
		'sub_bulk_upld_onlyAcc' as remark,GetDate(),GETDATE(),CreatedBy,CASTYPEID from #temp_pairings
		where AccountId=@AccId and CASTYPEID=@casTypeId
End
	
Delete from #temp_pairings where AccountId=@AccId and CASTYPEID=@casTypeId
End


update UPLOADED_DATA_TABLE set STATUS_REMARK='Uploaded Successfully' where STATUS=4 and SESSION_ID=@ID 

update SESSION_TABLE set EndTime=GETDATE() where Id=@ID

select (select COUNT(Id) from UPLOADED_DATA_TABLE where STATUS=2 and SESSION_ID=@ID) as Wrong_Entries,
(select COUNT(Id) from UPLOADED_DATA_TABLE where STATUS=1 and SESSION_ID=@ID ) as Duplicate_Entries
,(select COUNT(Id) from UPLOADED_DATA_TABLE where STATUS=4 and SESSION_ID=@ID) as Uploaded_Entries,
(select COUNT(Id) from UPLOADED_DATA_TABLE where STATUS=0 and SESSION_ID=@ID) as Not_UPLOADED,count(Id) as Total
from UPLOADED_DATA_TABLE where SESSION_ID=@ID

select FNAME,MNAME,LNAME,GENDER,''''+cast(MOBILE as varchar)as MOBILENo,OPERATOR,AREA,SOCIETY,ADDRESS,ZIP_CODE,CONN_SCH_CODE,STB_BRAND,
''''+cast(STB_NO as varchar) as STB_NO,
SMC_BRAND,''''+cast(SC_NO as varchar) as SCNO,BOUQUETCODE,STATUS_REMARK  from UPLOADED_DATA_TABLE where SESSION_ID=@ID

END
GO
