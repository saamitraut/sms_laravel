USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[sub_bulk_upld]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sub_bulk_upld] @ID as bigint,@FilePath as varchar(max),@UserId as bigint as

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
------------------------------------------------------Removing Space---------------------------------------------------------------------------------------------------
UPDATE UPLOADED_DATA_TABLE set FNAME=LTRIM(RTRIM(FNAME)),LNAME=LTRIM(RTRIM(LNAME)),MNAME=LTRIM(RTRIM(MNAME)),ADDRESS=LTRIM(RTRIM(ADDRESS)) WHERE  SESSION_ID=@ID

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
 where OPERATOR not in (Select CODE from SMS_OPERATOR) and SESSION_ID=@ID 

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

---------------------------------------------Insert pairing-----------------------------------
update SMS_PAIRING set sms_id=0;   

insert into SMS_PAIRING (SmartCardId,StbId,AllocatedOperatorId,CreatedOn,CreatedBy,sms_id)
select c.Id,b.Id,o.ID,GETDATE(),@UserId,a.Id
from UPLOADED_DATA_TABLE a inner join SMS_STBS b on a.STB_NO=b.STBno
inner join SMS_SMARTCARDS c on a.SC_NO=c.SmartcardNo 
inner join SMS_OPERATOR o on o.Code=a.OPERATOR
where a.SESSION_ID=@ID and a.Status=0 and c.Id not in (Select Smartcardid from SMS_pairing) 
and b.Id not in (Select STBid from SMS_pairing) 

Update UPLOADED_DATA_TABLE set 
STATUS= case when (Select COUNT(*) as cnt from SMS_SUBSCRIBERACCOUNTS where PairingId=p.Id)=0 then 4 
else 2 end,STATUS_REMARK= case when (Select COUNT(*) as cnt from SMS_SUBSCRIBERACCOUNTS where PairingId=p.Id)=0
 then '' else ISNULL(STATUS_REMARK,'')+'Already Assigned' end
from UPLOADED_DATA_TABLE a inner join sms_view_pairing p on p.SmartcardNo=a.SC_NO and p.STBNo=a.STB_NO where p.sms_id>0 and a.SESSION_ID=@ID


update SMS_SUBSCRIBERS set sms_id=0 where sms_id>0

declare @form bigint;
declare @CustomerId bigint;

--Select @form=max(SUBSTRING(FormNo,5,LEN(FormNo))),
--@CustomerId=isnull(MAX(cast(substring(CustomerId,5,LEN(CustomerId))as varchar)),0)
--from SMS_SUBSCRIBERS_HISTORY

Select @form=max(SUBSTRING(FormNo,5,LEN(FormNo))),
--@CustomerId=isnull(MAX(cast(substring(CustomerId,5,LEN(CustomerId))as varchar)),0)
@CustomerId=isnull(MAX(substring(CustomerId,5,9)),0)
from SMS_SUBSCRIBERS_HISTORY where LEN(CustomerId)=10



	----------------------Insert into SMS_SUBSCRIBER Table------------------------------------
	Insert into SMS_SUBSCRIBERS(FormNo,CustomerId,OperatorId,SocietyId,MobileNo,Status,OpTobeBilled,CreatedOn,CreatedBy,Deleted,Remark,sms_id)
	Select 'FRM'+dbo.getNdigit(ISNULL(cast(@form as bigint),0)+a.ID,8),
	'SMP0'+dbo.getNdigit(@CustomerId+ROW_NUMBER()over(order by a.Id ),8),
	ISNULL(o.ID,1),ISNULL(s.Id,1),ISNULL(a.MOBILE,'9999999999'),1,1,GETDATE(),@UserId,'0','Bulk Sub Upload',a.Id
	from UPLOADED_DATA_TABLE a left join SMS_OPERATOR o on o.CODE=a.OPERATOR
	left join SMS_SOCIETY_MASTER s on s.SocietyCode=a.Society 
	where a.STATUS=4 and a.SESSION_ID=@ID 

	

----------------------Insert into SMS_SUBSCRIBER_DETAILS Table------------------------------------
Insert into SMS_SUBSCRIBERS_DETAILS(SubscriberId,FName,LName,Mname,Address,Gender,Zipcode,CreatedOn,CreatedBy,Deleted,Remark)
Select s.Id,a.FNAME,a.LNAME,a.MNAME,a.ADDRESS,ISNULL(a.GENDER,'F'),ISNULL(a.ZIP_CODE,'600044'),GETDATE(),@UserId,'0','Bulk Sub Upload '
from UPLOADED_DATA_TABLE a left join SMS_SUBSCRIBERS s on a.Id=s.sms_id
where a.STATUS=4 and a.SESSION_ID=@ID

----------------------Insert into SMS_SUBSCRIBER_Accounts Table------------------------------------
update SMS_SUBSCRIBERACCOUNTS set sms_id=0 where sms_id>0

insert into SMS_SUBSCRIBERACCOUNTS (SubscriberId,ConnectionId,IsPrimary,ApplicableRate,PairingId,ActivationDate,
	CreatedOn,CreatedBy,Description,TimeShift,BillingSMonth,ExpiryDate,sms_id)
Select s.Id,ISNULL(c.Id,'3'),1,1,p.Id as Pairing,GETDATE(),GETDATE(),@UserId,'Bulk Subscriber Upload',0,GETDATE(),DATEADD(YEAR,10,GETDATE()),a.Id
from UPLOADED_DATA_TABLE a left join SMS_SUBSCRIBERS s on a.Id=s.sms_id
left join SMS_CONNECTIONSCHEME c on a.CONN_SCH_CODE=c.Code
left join sms_view_pairing p on p.SmartcardNo=a.SC_NO and p.STBNo=a.STB_NO
where a.STATUS=4 and p.Id is not null and s.Id is not null and a.SESSION_ID=@ID

select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,Id as AccountId,
isnull(ActivationDate,GETDATE()) as CommandDate,@UserId as CreatedBy,CASTYPEID 
into #temp_pairings from sms_view_accounts_pairings b where b.SmartcardNo in (select SC_NO from UPLOADED_DATA_TABLE where SESSION_ID=@ID)

	---CASTYPE 2
		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
		CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'FBulk'+'ADDSC',1,dbo.cas_abv_formatcmd(dbo.cas_abv_addSmartcard(SmartcardNo))
		,'cas_abv_sms_activate_account',DATEADD(SECOND,1,GETDATE()),GETDATE(),CreatedBy,'0' from #temp_pairings where CASTYPEID=2

		WAITFOR DELAY '00:00:15';

		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
		CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'FBulk'+'BINDSC',6,dbo.cas_abv_formatcmd(dbo.cas_abv_BindSmartcard(SmartcardNo,STBNo))
		,'cas_abv_sms_activate_account',DATEADD(SECOND,15,GETDATE()),GETDATE(),CreatedBy,'0' from #temp_pairings where CASTYPEID=2
	
	--CAS TYPE 3
	---ADD SMARTCARD NSTV CAS
		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
		CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'SMS_CA_OPEN_ACCOUNT_REQUEST',1,''
		,'SMS_CA_OPEN_ACCOUNT_REQUEST',GETDATE(),GETDATE(),CreatedBy,'3' from #temp_pairings where CASTYPEID=3

		---BIND SMARTCARD NSTV CAS
		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
		CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'SMS_CA_REPAIR_REQUEST',1,''
		,'SMS_CA_REPAIR_REQUEST',GETDATE(),GETDATE(),CreatedBy,'3' from #temp_pairings where CASTYPEID=3
	
	--CASTYPE 1
		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'FBulk'+'ADDinDATATBASE',1,dbo.cas_abv_formatcmd('02'+'0A'+
		dbo.fn_varbintostr_(LEN(dbo.cas_Gospel_convert_smartcard(SmartcardNo)+'01'+'00000000'+'01'+'00000000'+'00000000'+'0001'+'01'+'00000001'+
		dbo.getNdigit_str(dbo.fn_stringtohexStr('ENTL FROM SMS'),40)+dbo.getNdigit_str(dbo.fn_stringtohexStr('ENTL FROM SMS'),40)+
		dbo.fn_getUTCHexdateTime(DATEADD(DAY,7,GETDATE())))/2,4)+dbo.cas_Gospel_convert_smartcard(SmartcardNo)+'01'+
		'00000000'+'01'+'00000000'+'00000000'+'0001'+'01'+'00000001'+dbo.getNdigit_str(dbo.fn_stringtohexStr('ENTL FROM SMS'),40)+
		dbo.getNdigit_str(dbo.fn_stringtohexStr('ENTL FROM SMS'),40)+dbo.fn_getUTCHexdateTime(DATEADD(Day,7,GETDATE())))
		,'cas_Gospel_sms_addindatabase_account',CommandDate,GETDATE(),CreatedBy,1 
		from #temp_pairings where CASTYPEID=1

		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
		CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'FBulk'+'ADDSC',1,
		dbo.cas_abv_formatcmd(dbo.cas_Gospel_activateSmartcard(SmartcardNo,DATEADD(d,7,getdate())))
		,'cas_Gospel_sms_activate_account',CommandDate,GETDATE(),CreatedBy,'1' from #temp_pairings where CASTYPEID=1

		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
		CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'FBulk'+'BINDSC',6,
		dbo.cas_abv_formatcmd(dbo.cas_Gospel_PairingSmartcard(SmartcardNo,STBNo,DATEADD(MONTH,6,getdate())))
		,'cas_Gospel_sms_activate_account',dateadd(SECOND,6,cast(CommandDate as datetime)),GETDATE(),CreatedBy,'1' 
		from #temp_pairings where CASTYPEID=1
	

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
