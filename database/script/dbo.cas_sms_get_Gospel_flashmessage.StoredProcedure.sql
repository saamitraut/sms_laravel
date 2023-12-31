USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_sms_get_Gospel_flashmessage]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc[dbo].[cas_sms_get_Gospel_flashmessage]--x01
@FpTo as tinyint=0 ,@AreapairingId as varchar(8000)=Null
,@expiryTime as datetime,
@startTime as datetime,
@OSD_Duration int ,
@OSD_Repitition int ,
@fcolor as char(8),
@bgcolor as char(8),
@f_size as int=255,
@lock as char(2)='00',
@OSD_Data as varchar(255),
@channelId as varchar(8000)=null,
@UserId as bigint,
@style  as varchar(2)='01',
@stylevalue as varchar(2)='00',
@showfrequency as varchar(4)='0000',
@priority as varchar(2)='00'

as 
Begin
	
	if(@FpTo=2)
	begin	
		Select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.Id as PairingId,a.AccountId as AccountId,'' as AreaName,0 as AreaId,
		0 as AreaCasCode,@UserId as CreatedBy into #temp_pairings
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
			Select dbo.fn_varbintostr_(CasCode,4) as Channel_Ids
			into #temp_channels
			from SMS_CHANNEL a
			left outer join dbo.Split_coma(@channelId) b on a.Id=CAST(b.items as bigint)
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
	values ('1','FLASHMESSAGE',@FpTo,getdate(),@UserId)
	Select @mId=SCOPE_IDENTITY()
	
	declare @OSD_ID as varchar(8)
	Set @OSD_ID='01'+dbo.fn_varbintostr_((@mId%16777215),6)
	
	insert into SMS_CASMSG_PARAM(Value,Param,MsgId)
	
	Select convert(varchar,GETDATE(),120),'CurrentTime',@mId 	
	Union	Select convert(varchar,@startTime,120)  ,'startTime' ,@mId
	Union	Select convert(varchar,@expiryTime,120),'expiryTime' ,@mId
	Union	Select @OSD_Data,'OSD_Data' ,@mId		
	Union	Select cast(@OSD_Duration as varchar),'duration' ,@mId
	Union	Select cast(@OSD_Repitition as varchar),'repitition' ,@mId
	Union	Select cast(@fcolor as varchar),'fcolor' ,@mId
	Union	Select cast(@bgcolor as varchar),'bgcolor' ,@mId		
	Union	Select @channelId,'channelId' ,@mId
	Union	Select @listchannels,'listchannels' ,@mId
	Union	Select cast(@Channel_number as varchar) ,'Channel_number' ,@mId
	Union	Select @Channel_Tag,'Channel_Tag' ,@mId
	Union	Select @OSD_ID,'@OSD_ID' ,@mId
	Union	Select cast(@f_size as varchar),'@f_size' ,@mId
	Union	Select @lock,'@lock' ,@mId
	Union	Select @style,'@style' ,@mId
	Union	Select @stylevalue,'@stylevalue' ,@mId
	Union	Select @showfrequency,'@showfrequency' ,@mId
	union	select @priority ,'@priority' ,@mId
	
	
	select @FpTo as FpTo,
	 dbo.fn_getUTCHexdateTime(GETDATE()) as CurrentTime,@startTime as startTime, 
	 dbo.fn_getUTCHexdateTime(@expiryTime) as expiryTime
	 , dbo.fn_varbintostr_(@f_size,2) as f_size,dbo.fn_stringtohexStr(@OSD_Data) as OSD_Data	
	 , @OSD_ID as OSD_ID
	 , @style as style
	 , @stylevalue as stylevalue
	 , @showfrequency as showfrequency
	 , @priority as priority
	 , @lock as lock	 
	 , dbo.fn_varbintostr_(@OSD_Duration,4) as duration,dbo.fn_varbintostr_(@OSD_Repitition,2) as repitition
	  ,@fcolor as fcolor
	  ,'FF' as Reserved
	  ,'01' as IsControl
	  ,@bgcolor as bgcolor,@listchannels AS  Channel_id,
	dbo.fn_varbintostr_(@Channel_number,2) as Channel_number,@Channel_Tag as Channel_Tag
	into #temp_fp_param
	
	/*
	select a.*,expiryTime+OSD_ID+Reserved+Reserved+Reserved+Reserved+IsControl+startTime+lock+duration+repitition+showfrequency+priority+style+stylevalue+f_size+
	fcolor+bgcolor+Reserved+Reserved+Reserved+Reserved+dbo.fn_varbintostr_(LEN(OSD_Data)/2,4)+OSD_Data
	as fpdata into #t from #temp_fp_param a	
		
	select (len(fpdata)/2) as fplength,b.VALUE as G_CAS_VER,* into #t_cmd 
		from  	#t a , X_SYSTEM_CONSTANTS b where b.Name='G_CAS_VER'
	*/
	select a.*,expiryTime+OSD_ID+Reserved+Reserved+Reserved+Reserved+IsControl+'[@START]'+lock+duration+repitition+showfrequency+priority+style+stylevalue+f_size+
	fcolor+bgcolor+Reserved+Reserved+Reserved+Reserved+dbo.fn_varbintostr_(LEN(OSD_Data)/2,4)+OSD_Data
	 COLLATE DATABASE_DEFAULT  as fpdata into #t from #temp_fp_param a	
	
	
	select (len(fpdata)/2) as fplength,b.VALUE  COLLATE DATABASE_DEFAULT as G_CAS_VER,* into #t_cmd 
		from  	#t a , X_SYSTEM_CONSTANTS b where b.Name='G_CAS_VER'
	
	
	
	 Create table #temp_pairings_area(
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
	AreaCasCode   bigint null,
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
	
	Select @msg='OSD Message send Sucessfully to '+cast(COUNT(*) as varchar)+ 	' Selected Smartcards ' from #temp_pairings
	
	end
	Else
	if(@FpTo=0)
	begin
	Begin try 
		insert into SMS_CASMESSAGE_TO(Area_CardId,CASmsgId)
		Select 0,@mId 
	End Try
	Begin Catch
				SELECT 'L1' as Place, ERROR_NUMBER() AS ErrorNumber    ,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;
				Select 0,@mId 
	End Catch	
	
	Begin try 	
		insert into #temp_pairings_area(MessageUniqueId,SmartCardId,SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy,Condition)
		select a.Id as MessageUniqueId,-1,'Global FlashMsg',-1,-1,-1,-1,-1,-1,@UserId,'15'
		from SMS_CASMESSAGE_TO a where CASmsgId=@mId
	End Try
	Begin Catch
				SELECT 'L1' as Place, ERROR_NUMBER() AS ErrorNumber    ,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;
				--select a.Id as MessageUniqueId,-1,'Global FlashMsg',-1,-1,-1,-1,-1,-1,@UserId,'15' from SMS_CASMESSAGE_TO a where CASmsgId=@mId
	End Catch
		Set @msg='OSD Message send Sucessfully to All Smartcards Globally '
		 
	end
		
	
	select *,
	dbo.cas_abv_formatcmd((G_CAS_VER COLLATE DATABASE_DEFAULT )+dbo.fn_varbintostr_(14,2)+dbo.fn_varbintostr_(fplength+8,4)+dbo.fn_varbintostr_(6,4)+'23'+Condition+
	+Case @FpTo when 2 then dbo.cas_Gospel_convert_smartcard(SmartcardNo)
	 else '00000FA0' end+dbo.fn_varbintostr_(29,2)+REPLACE(fpdata  COLLATE DATABASE_DEFAULT,'[@START]',
		dbo.fn_getUTCHexdateTime(DATEADD(second,ID-1,startTime)))) as Command
	into  #t_f from #temp_pairings_area a,#t_cmd b 
	
	/*
		select *,
	dbo.cas_abv_formatcmd(G_CAS_VER+dbo.fn_varbintostr_(14,2)+dbo.fn_varbintostr_(fplength+8,4)+dbo.fn_varbintostr_(6,4)+'23'+Condition+
	+Case @FpTo when 2 then dbo.cas_Gospel_convert_smartcard(SmartcardNo) else '00000FA0' end+dbo.fn_varbintostr_(29,2)+fpdata) as Command
	into  #t_f from #temp_pairings_area a,#t_cmd b 
	
	*/
	
	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,
	CommandId,Command,Remark,CommandDate,
	CreatedOn,CreatedBy,MSG_MAP_ID,CASTYPE)
	select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.AccountId,'FLASHMSG',12,a.Command,'cas_sms_get_flashmessage',
	GETDATE(),GETDATE(),@UserId,MessageUniqueId,1 from #t_f a
		
	Select @msg as msg
End

GO
