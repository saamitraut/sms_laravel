USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_sms_get_Gospel_fingerprint]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc[dbo].[cas_sms_get_Gospel_fingerprint] --0 to All global 1- area 2 to SC
@FpTo as tinyint=0 ,@AreapairingId as varchar(8000)=Null,
@expiryTime as datetime,@startTime as datetime,@postype as char(2)='01',@x_axis as int=400,@y_axis as int=300,@duration as int,
@repitition as int,@interval as int,@fcolor as char(8),@bgcolor as char(8),@channelId as varchar(8000),
@UserId as bigint,@IdType as varchar(8)='00000000',@lock as char(2)='00',@show_feq as int=5,@f_size as int=255,@ts_id as int=0
as 
Begin
	if(@FpTo=2)
	begin
		Select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.Id as PairingId,
		a.AccountId as AccountId,'' as AreaName,0 as AreaId,0 as AreaCasCode,@UserId as CreatedBy 
		into #temp_pairings
		from sms_view_pairing a
		left outer join dbo.Split_coma(@AreapairingId) b on a.Id=CAST(b.items as bigint)
		where b.items is not null
	end
	

	declare @listchannels as varchar(8000)
	declare @Channel_Tag as VARCHAR(2)
	declare @Channel_number as INT
	SET @listchannels='';
	SET @Channel_Tag='00';
	SET @Channel_number=0;
	if(@channelId is not null or @channelId!='')
	Begin
			Select dbo.fn_varbintostr_(TSIDGospel,4) as Channel_Ids
			into #temp_channels
			from SMS_CHANNEL a
			left outer join (Select top 10 * from dbo.Split_coma(@channelId)) b on a.Id=CAST(b.items as bigint)
			where b.items is not null
			
			SELECT @Channel_number =COUNT(Channel_Ids) FROM #temp_channels
			IF @Channel_number>0
			BEGIN
			SELECT  @listchannels = ( SELECT 
                                 ltrim(Channel_Ids)
                        FROM    #temp_channels 						
                        ORDER BY  ltrim(Channel_Ids)
                        FOR XML PATH('')
                                    )
			print @listchannels   
			SET @Channel_Tag='01';    
			END                             

	end
	
	declare @mId as bigint
	insert into SMS_CASMSG(mType,cmdName,UA_TYPE,InsertedOn,InsertedBy)
	values ('3','FINGERPRINT',@FpTo,getdate(),@UserId)
	Select @mId=SCOPE_IDENTITY()
	
	declare @FP_ID as varchar(8)
	Set @FP_ID='01'+dbo.fn_varbintostr_((@mId%16777215),6)
	
	insert into SMS_CASMSG_PARAM(Value,Param,MsgId)
	Select cast(@postype as varchar),'@postype' ,@mId 
	union
	Select cast(@show_feq as varchar),'@show_feq' ,@mId 
	union
	Select cast(@IdType as varchar),'@IdType' ,@mId 	
	union
	Select convert(varchar,GETDATE(),120),'CurrentTime',@mId 
	Union	Select convert(varchar,@startTime,120)  ,'startTime' ,@mId
	Union	Select convert(varchar,@expiryTime,120),'expiryTime' ,@mId
	Union	Select cast(@x_axis as varchar),'x_axis' ,@mId
	Union	Select cast(@y_axis as varchar),'y_axis' ,@mId 
	Union	Select cast(@duration as varchar),'duration' ,@mId
	Union	Select cast(@repitition as varchar),'repitition' ,@mId
	Union	Select cast(@interval as varchar),'interval' ,@mId
	Union	Select cast(@fcolor as varchar),'fcolor' ,@mId
	Union	Select cast(@bgcolor as varchar),'bgcolor' ,@mId		
	Union	Select @channelId,'channelId' ,@mId
	Union	Select @listchannels,'listchannels' ,@mId
	Union	Select cast(@Channel_number as varchar) ,'Channel_number' ,@mId
	Union	Select @Channel_Tag,'Channel_Tag' ,@mId
	Union	Select @FP_ID,'@FP_ID' ,@mId
	Union	Select cast(@f_size as varchar),'@f_size' ,@mId
	Union	Select cast(isnull(@ts_id,0) as varchar),'@ts_id' ,@mId
	Union	Select @lock,'@lock' ,@mId
	
	--@IdType as varchar(2)='00',@show_feq as int=5,@f_size as int=255
	

	select @postype as postype,@FpTo as FpTo,
	 dbo.fn_getUTCHexdateTime(GETDATE()) as CurrentTime,dbo.fn_getUTCHexdateTime(@startTime) as startTime, @startTime as StDate,
	 dbo.fn_getUTCHexdateTime(@expiryTime) as expiryTime
	 , dbo.fn_varbintostr_(@f_size,2) as f_size
	 , dbo.fn_varbintostr_(@show_feq,2) as show_feq
	 , @FP_ID as FP_ID
	 , dbo.fn_varbintostr_(@IdType,2) as IdType
	 , @lock as lock	 
	 , dbo.fn_varbintostr_(@x_axis,4) as x_axis
	  ,dbo.fn_varbintostr_(@y_axis,4) as y_axis,dbo.fn_varbintostr_(@duration,4) as duration,dbo.fn_varbintostr_(@repitition,4) as repitition
	  ,dbo.fn_varbintostr_(@interval,4) as interval,@fcolor as fcolor
	  ,'FF' as Reserved
	  ,'01' as IsControl
	  ,@bgcolor as bgcolor,@listchannels AS  Channel_id,
	dbo.fn_varbintostr_(@Channel_number,2) as Channel_number,@Channel_Tag as Channel_Tag
	into #temp_fp_param
	
	select a.*,expiryTime+FP_ID+Reserved+Reserved+Reserved+Reserved+IsControl+'@@'+lock+duration+interval+repitition+IdType+f_size+fcolor+bgcolor+postype+x_axis+y_axis
	+Channel_number+Channel_id+show_feq+Reserved+Reserved+Reserved
	as fpdata into #t from #temp_fp_param a	
	
	
	select (len(fpdata)/2)+3 as fplength,b.VALUE as G_CAS_VER,* into #t_cmd 
		from  	#t a , X_SYSTEM_CONSTANTS b where b.Name='G_CAS_VER'
	 
	 Create table #temp_pairings_area(
	 Rid int not null identity,
	MessageUniqueId   bigint,
	SmartCardId   bigint,
	Condition   varchar(2),
	SmartcardNo   varchar(16),
	STBNo   varchar(30),
	StbId   bigint,
	SubscriberId   bigint,
	PairingId   bigint,
	AccountId   bigint,
	AreaId   bigint,
	AreaCasCode   bigint default (0),
	CreatedBy   bigint
	) 
	
	declare @msg as varchar(200)
	if(@FpTo=2)
	begin
		insert into SMS_CASMESSAGE_TO(Area_CardId,CASmsgId)
		Select SmartCardId,@mId from #temp_pairings		
		insert into #temp_pairings_area(MessageUniqueId,SmartCardId,SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy,AreaCasCode,Condition)
		select a.Id as MessageUniqueId,b.SmartCardId,b.SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy,AreaCasCode,'17'
		from SMS_CASMESSAGE_TO a
		left outer join #temp_pairings b on a.Area_CardId=b.SmartCardId 	
		where a.CASmsgId=@mId and b.SmartcardNo is not null
	
	Select @msg='Finger Print send Sucessfully to '+cast(COUNT(*) as varchar)+ ' Selected Smartcards ' from #temp_pairings
	
	end	
	Else
	if(@FpTo=0)
	begin
		insert into SMS_CASMESSAGE_TO(Area_CardId,CASmsgId)
		Select 0,@mId 				
		insert into #temp_pairings_area(MessageUniqueId,SmartCardId,SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy,Condition)
		select a.Id as MessageUniqueId,-1,'Global FP',-1,-1,-1,-1,-1,-1,@UserId,'15'
		from SMS_CASMESSAGE_TO a where CASmsgId=@mId
		
		Set @msg='Finger Print send Sucessfully to All Smartcards Globally ' 
	end
		
		--select * from #temp_pairings_area
	
	--Conditional addr
	
	select *,
	dbo.cas_abv_formatcmd((G_CAS_VER COLLATE DATABASE_DEFAULT) +dbo.fn_varbintostr_(14,2)+
	Case when isnull(@ts_id,0)>0 then dbo.fn_varbintostr_(fplength+16,4)+dbo.fn_varbintostr_(13,4)+'23'+Condition+
	CASE @FpTo when 2 then dbo.cas_Gospel_convert_smartcard(SmartcardNo) else '00000FA0' end +'1C2617'+dbo.fn_varbintostr_(@ts_id,8)
	else
	dbo.fn_varbintostr_(fplength+9,4)+dbo.fn_varbintostr_(6,4)+'23'+Condition+
		CASE @FpTo when 2 then dbo.cas_Gospel_convert_smartcard(SmartcardNo) else '00000FA0' end end
		+dbo.fn_varbintostr_(30,2)+fpdata  COLLATE DATABASE_DEFAULT) as Command,
		dbo.cas_abv_formatcmd(dbo.fn_getUTCHexdateTime(dateAdd(SECOND,(RID-1)*5,StDate))) as StartDateTime
	into  #t_f from #temp_pairings_area a,#t_cmd b 

		
	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,
	SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,CreatedOn,CreatedBy,MSG_MAP_ID,CASTYPE)
	select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.AccountId,'FNGPMSGGOSPEL',14,
	replace(a.Command,'@@',StartDateTime)
	,'cas_sms_get_Gospel_fingerprint',
	dateAdd(SECOND,(RID-1)*5,GETDATE()),GETDATE(),@UserId,MessageUniqueId,'1' from #t_f a
	
	Select @msg as msg
		
End

GO
