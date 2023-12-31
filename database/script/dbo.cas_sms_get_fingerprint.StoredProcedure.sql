USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_sms_get_fingerprint]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[cas_sms_get_fingerprint] --0 to All global 1- area 2 to SC
@FpTo as tinyint=0 ,@AreapairingId as varchar(8000)=Null,
@IsHide as tinyint=1,@expiryTime as datetime,@startTime as datetime,@x_axis as int=400,@y_axis as int=300,@duration as int,
@repitition as int,@interval as int,@fcolor as char(2),@bgcolor as char(2),@fRGB as char(6),@bgRGB as char(6),@isSpark as tinyint,@content as varchar(1024)='',
@channelId as varchar(8000),@UserId as bigint,@screensize as varchar(3),@display as varchar(3),@transparency as varchar(3),@displaystb as varchar(2),
@forcefp as varchar(2),@location as varchar(2)='E1',@displaysmc as varchar(2)='01',@reserved as varchar(4)='1111',@CODETYPE as varchar(2)='12'
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
	if(@FpTo=1)
	begin	
		Select NAME as SmartcardNo,0 as SmartCardId,0 as STBNo,0 as StbId,0 as SubscriberId,0 as PairingId,0 as AccountId
		,ID as AreaId,AREACASCODE as AreaCasCode
		,@UserId as CreatedBy into #temp_areas
		from SMS_AREACODE a
		left outer join dbo.Split_coma(@AreapairingId) b on a.Id=CAST(b.items as bigint)
		where b.items is not null
	end
	
	
	declare @listchannels as varchar(8000)
	declare @Channel_Tag as VARCHAR(2)
	declare @Channel_number as INT
	SET @listchannels='';
	SET @Channel_Tag='02';
	SET @Channel_number=0;
	if(@channelId is not null or @channelId!='')
	Begin
			Select dbo.fn_varbintostr_(CAST(CasCode as varchar),4) as Channel_Ids
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
			SET @Channel_Tag='04';    
			END                             

	end
	
	declare @mId as bigint
	insert into SMS_CASMSG(mType,cmdName,UA_TYPE,InsertedOn,InsertedBy)
	values ('3','FINGERPRINT',@FpTo,getdate(),@UserId)
	Select @mId=SCOPE_IDENTITY()
	
	insert into SMS_CASMSG_PARAM(Value,Param,MsgId)
	Select cast(@IsHide as varchar),'IsHide' ,cast(@mId as bigint)
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
	Union	Select cast(@isSpark as varchar),'isSpark' ,@mId
	Union	Select @content,'content' ,@mId
	Union	Select @channelId,'channelId' ,@mId
	Union	Select @listchannels,'listchannels' ,@mId
	Union	Select cast(@Channel_number as varchar) ,'Channel_number' ,@mId
	Union	Select @Channel_Tag,'Channel_Tag' ,@mId
	Union	Select @screensize,'@screensize' ,@mId
	Union	Select @location,'@location' ,@mId
	Union	Select @display,'@display' ,@mId
	Union	Select @displaysmc,'@displaysmc' ,@mId
	Union	Select @displaystb,'@displaystb' ,@mId
	Union	Select @forcefp,'@forcefp' ,@mId
	Union	Select @transparency,'@transparency' ,@mId
	Union	Select @reserved,'@reserved' ,@mId
		
	select dbo.fn_varbintostr_(@IsHide,2) as IsHide, dbo.fn_varbintostr_(@FpTo,2) FpTo,
	 dbo.fn_getHexdateTime(GETDATE()) as CurrentTime,dbo.fn_getHexdateTime(@startTime) as startTime, dbo.fn_getHexdateTime(@expiryTime) as expiryTime
	 , dbo.fn_varbintostr_(@x_axis,4) as x_axis
	  ,dbo.fn_varbintostr_(@y_axis,4) as y_axis,dbo.fn_varbintostr_(@duration,4) as duration,dbo.fn_varbintostr_(@repitition,4) as repitition
	  ,dbo.fn_varbintostr_(@interval,4) as interval,@fcolor as fcolor
	  ,@bgcolor as bgcolor,dbo.fn_varbintostr_(@isSpark,2) as isSpark
	,dbo.fn_stringtohexStr(@content) as content,@listchannels AS  Channel_id,
	dbo.fn_varbintostr_(@Channel_number,4) as Channel_number,@Channel_Tag as Channel_Tag,
	dbo.fn_varbintostr_(@screensize,2)+dbo.fn_varbintostr_(@screensize,2) as screensize
	,@fRGB as fRGB
	  ,@bgRGB as bgRGB,
	--dbo.fn_varbintostr_(@location,2) as location,
	@location as location,
	@display as display,
	@displaysmc as displaysmc,
	@displaystb as displaystb,
	@forcefp as forcefp,
	dbo.fn_varbintostr_(@transparency,2) as transparency,
	@reserved as reserved
	into #temp_fp_param
	
	if(@display=1)
	begin 
		set @display='EF'
	end
	else
	begin
		set @display='6F'
	end

	if(@displaystb=1)
	begin 
		set @display='EF'
	end
	else
	begin
		set @display='C0'
	end
	
	
	
	select
	 a.*,CurrentTime+startTime+x_axis+y_axis+duration+repitition+interval+fcolor+bgcolor+isSpark
	+dbo.fn_varbintostr_(((len(content)+len(@CODETYPE))/2),4)+@CODETYPE+content+Channel_Tag+
	Case Channel_Tag when '04' 
	--then Channel_number+Channel_id+'0C'+'0000'+'000000FFFFFF'+location+@display+transparency+'16' 
	then Channel_number+Channel_id+'0C'+'0000'+fRGB+bgRGB+location+@display+transparency+'16' 
	 when '02'
	--then '0C'+'0000'+'000000FFFFFF'+location+@display+transparency+'16' --'0A'+screensize+location+display+displaysmc+displaystb+forcefp+reserved+transparency 
	then '0C'+'0000'+fRGB+bgRGB+location+@display+transparency+'16' --'0A'+screensize+location+display+displaysmc+displaystb+forcefp+reserved+transparency 
	 when '03'
	then Channel_number+Channel_id
	else '' end
	as fpdata into #t from #temp_fp_param a	
	
	--Select * from #t;
	
	select (len(fpdata)/2) as fplength,b.VALUE as PPID,* into #t_cmd 
	from  	#t a , X_SYSTEM_CONSTANTS b where b.Name='PPID'
	 
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
	AreaCasCode   bigint default(0),
	CreatedBy   bigint
	) 
	
	declare @msg as varchar(200)
	if(@FpTo=2)
	begin
		insert into SMS_CASMESSAGE_TO(Area_CardId,CASmsgId)
		Select SmartCardId,@mId from #temp_pairings
		
		insert into #temp_pairings_area(MessageUniqueId,SmartCardId,SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy,AreaCasCode)
		select (a.Id+8192) as MessageUniqueId,b.SmartCardId,b.SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy,AreaCasCode
		from SMS_CASMESSAGE_TO a
		left outer join #temp_pairings b on a.Area_CardId=b.SmartCardId 	
		where a.CASmsgId=@mId and b.SmartcardNo is not null
	
	Select @msg='Finger Print send Sucessfully to '+cast(COUNT(*) as varchar)+ ' Selected Smartcards ' from #temp_pairings
	
	end
	Else
	if(@FpTo=1)
	begin
		insert into SMS_CASMESSAGE_TO(Area_CardId,CASmsgId)
		Select AreaId,@mId from #temp_areas
		
		insert into #temp_pairings_area(MessageUniqueId,SmartCardId,SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy,AreaCasCode)
		select a.Id as MessageUniqueId,b.SmartCardId,b.SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy,AreaCasCode
		from SMS_CASMESSAGE_TO a
		left outer join #temp_areas b on a.Area_CardId=b.AreaId 	
		where a.CASmsgId=@mId and b.SmartcardNo is not null	
		Select @msg='Finger Print send Sucessfully to '+cast(COUNT(*) as varchar)+ ' Selected Area ' from #temp_areas				
	end
	Else
	if(@FpTo=0)
	begin
		insert into SMS_CASMESSAGE_TO(Area_CardId,CASmsgId)
		Select 0,@mId 
				
		insert into #temp_pairings_area(MessageUniqueId,SmartCardId,SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy)
		select a.Id as MessageUniqueId,-1,'Global FP',-1,-1,-1,-1,-1,-1,@UserId
		from SMS_CASMESSAGE_TO a where CASmsgId=@mId
		
		Set @msg='Finger Print send Sucessfully to All Smartcards Globally ' 
	end
		
		--select * from #temp_pairings_area
	
	select *,
	dbo.cas_abv_formatcmd('0160'+dbo.fn_varbintostr_(fplength+17+Case @FpTo when 0 then 0 when 1 then 4 else 5 end,4)+PPID+expiryTime+'03'+FpTo
	+Case @FpTo when 0 then '' when 1 then dbo.fn_varbintostr_(a.AreaCasCode,8) else dbo.cas_abv_convert_smartcard(SmartcardNo) end+Ishide
	+dbo.fn_varbintostr_(fplength+4,4)+dbo.fn_varbintostr_(MessageUniqueId,8)+fpdata) as Command
	into  #t_f from #temp_pairings_area a,#t_cmd b 
	
	
	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
	CreatedOn,CreatedBy,MSG_MAP_ID,CASTYPE)
	select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.AccountId,'FNGPMSG',14,a.Command,'cas_sms_get_fingerprint',
	GETDATE(),GETDATE(),@UserId,MessageUniqueId,'1' from #t_f a
	
	Select @msg as msg
		
End


GO
