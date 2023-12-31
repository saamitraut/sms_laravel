USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_sms_get_Gospel_mailmessage]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc[dbo].[cas_sms_get_Gospel_mailmessage]
@FpTo as tinyint=2,-- 0 for All 1-Area 2 CARD
@pairingId as varchar(8000)=Null
,@expiryTime as datetime,@mailDateTime as datetime,@sName as varchar(16),@mData as varchar(1024),@UserId as bigint
as 
Begin
	
	declare @msg as varchar(1500)
	if(@FpTo=2)
	begin
		Select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.Id as PairingId,a.AccountId as AccountId,'' as AreaName,0 as AreaId,
		0 as AreaCasCode,@UserId as CreatedBy into #temp_pairings
		from sms_view_pairing a
		left outer join dbo.Split_coma(@pairingId) b on a.Id=CAST(b.items as bigint)
		where b.items is not null
	end		
	
		
	declare @mId as bigint
	insert into SMS_CASMSG(mType,cmdName,UA_TYPE,InsertedOn,InsertedBy)
	values ('0','MAILMESSAGE',@FpTo,getdate(),@UserId)
	Select @mId=SCOPE_IDENTITY()
		
	insert into SMS_CASMSG_PARAM(Value,Param,MsgId)
	Select convert(varchar,GETDATE(),120),'CurrentTime',@mId 
	Union	Select convert(varchar,@mailDateTime,120)  ,'@mailDateTime' ,@mId
	Union	Select convert(varchar,@expiryTime,120),'expiryTime' ,@mId	
	Union	Select @sName,'sName' ,@mId
	Union	Select @mData,'mData' ,@mId		
	
	select  
	  dbo.fn_getUTCHexdateTime(@mailDateTime) as mailDateTime,dbo.fn_getUTCHexdateTime(@expiryTime) as expiryTime	 
	,dbo.fn_stringtohexStr(@sName) as sName	
	,dbo.fn_stringtohexStr(@mData) as mData	
	into #temp_fp_param
	
	
	select a.*,mailDateTime+dbo.fn_varbintostr_(LEN(sName)/2,2)+sName+dbo.fn_varbintostr_(LEN(mData)/2,4)+mData
	as fpdata into #t from #temp_fp_param a	
	
	
	 select (len(fpdata)/2) as fplength,b.VALUE as G_CAS_VER,* into #t_cmd 
	from  	#t a , X_SYSTEM_CONSTANTS b where b.Name='G_CAS_VER'
	
	 Create table #temp_pairings_area(
	MessageUniqueId   bigint,
	SmartCardId   bigint,
	SmartcardNo   varchar(16),
	STBNo   varchar(30),
	StbId   bigint,
	SubscriberId   bigint,
	PairingId   bigint,
	AccountId   bigint,
	AreaId   bigint,
	AreaCasCode   bigint,
	CreatedBy   bigint
	) 
	
	if(@FpTo=2)
	begin

		insert into SMS_CASMESSAGE_TO(Area_CardId,CASmsgId)
		Select SmartCardId,@mId from #temp_pairings
		
		insert into #temp_pairings_area(MessageUniqueId,SmartCardId,SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy,AreaCasCode)
		select a.Id as MessageUniqueId,b.SmartCardId,b.SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy,AreaCasCode
		from SMS_CASMESSAGE_TO a
		left outer join #temp_pairings b on a.Area_CardId=b.SmartCardId 	
		where a.CASmsgId=@mId and b.SmartcardNo is not null
	Select @msg='Mail Message send Sucessfully to '+cast(COUNT(*) as varchar)+ ' Selected Smartcards ' from #temp_pairings
	end	
	Else
	if(@FpTo=0)
	begin
		insert into SMS_CASMESSAGE_TO(Area_CardId,CASmsgId)
		Select 0,@mId 
				
		insert into #temp_pairings_area(MessageUniqueId,SmartCardId,SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy)
		select a.Id as MessageUniqueId,-1,'Global MailMsg',-1,-1,-1,-1,-1,-1,@UserId
		from SMS_CASMESSAGE_TO a where CASmsgId=@mId
		Set @msg='Mail Message send Sucessfully to All Smartcards Globally ' 
	end
		
	
	select *,
	dbo.cas_abv_formatcmd(G_CAS_VER+dbo.fn_varbintostr_(13,2)+
	dbo.fn_varbintostr_(fplength,4)+Case @FpTo when 0 then 'ffffffff' else dbo.cas_Gospel_convert_smartcard(SmartcardNo) end+fpdata) as Command
	into  #t_f from #temp_pairings_area a,#t_cmd b 
		
	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
	CreatedOn,CreatedBy,MSG_MAP_ID,CASTYPE)
	select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.AccountId,'MAILMSGGOSPELL',13,a.Command,'cas_sms_get_Mailmsg',
	GETDATE(),GETDATE(),@UserId,MessageUniqueId,'1' from #t_f a
			Select @msg as msg
End

GO
