USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_sms_get_flashmessage]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[cas_sms_get_flashmessage]--x01
@FpTo as tinyint=0 ,@AreapairingId as varchar(8000)=Null
,@expiryTime as datetime,
@startTime as datetime,
@OSD_Duration int ,
@OSD_Repitition int ,
@OSD_Interval int ,@OSD_Data as varchar(1024),@channelId as varchar(8000)=null,@UserId as bigint,@Sendtime as datetime,
@displaybg as char(1),@displaytype as char(3),@Transperancy as char(2),@fcolor as char(2),@bgcolor as char(2),@Fsize as char(2)='30',
@reserved as char(4)='1111',@CODETYPE as varchar(2)='12'
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
  ,ID as AreaId,2 as AreaCasCode
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
 
 insert into SMS_CASMSG_PARAM(Value,Param,MsgId)
 Select convert(varchar,GETDATE(),120),'CurrentTime',@mId  
 Union Select convert(varchar,@expiryTime,120),'expiryTime' ,@mId 
 Union Select cast(@OSD_Duration as varchar),'OSD_Duration' ,@mId
 Union Select cast(@OSD_Repitition as varchar),'OSD_Repitition' ,@mId
 Union Select cast(@OSD_Interval as varchar),'OSD_Interval' ,@mId
 Union Select @OSD_Data,'OSD_Data' ,@mId  
 Union Select isnull(@channelId,''),'channelId' ,@mId
 Union Select isnull(@listchannels,'')_,'listchannels' ,@mId
 Union Select isnull(cast(@Channel_number as varchar),'') ,'Channel_number' ,@mId
 Union Select @Channel_Tag,'Channel_Tag' ,@mId
 Union Select convert(varchar,@startTime,120),'Sendtime' ,@mId
 Union Select cast(@displaybg as varchar),'displaybg' ,@mId
 Union Select cast(@displaytype as varchar),'displaytype' ,@mId
 Union Select cast(@Transperancy as varchar),'Transperancy' ,@mId
 Union Select cast(@fcolor as varchar),'fcolor' ,@mId
 Union Select cast(@bgcolor as varchar),'bgcolor' ,@mId
 Union Select cast(@Fsize as varchar),'Fsize' ,@mId
 Union Select cast(@reserved as varchar),'reserved' ,@mId
 
 
 select 
     dbo.fn_varbintostr_(@FpTo,2) FpTo, dbo.fn_getHexdateTime(@expiryTime) as expiryTime ,
   dbo.fn_varbintostr_(@OSD_Duration,4) as OSD_Duration, 
 dbo.fn_varbintostr_(@OSD_Repitition,4) as OSD_Repitition, 
 dbo.fn_varbintostr_(@OSD_Interval,4) as OSD_Interval
 ,dbo.fn_stringtohexStr(@OSD_Data) as OSD_Data 
 ,@listchannels AS  Channel_id,
 dbo.fn_varbintostr_(@Channel_number,4) as Channel_number,@Channel_Tag as Channel_Tag, dbo.fn_getHexdateTime(@startTime) as Sendtime,
 dbo.fn_varbintostr_(dbo.ConvertFromBase((@displaybg+@displaytype+@reserved),2),2) as onebyte,dbo.fn_varbintostr_(cast(@Transperancy as varchar),2) as Transperancy,
 @fcolor as fcolor,@bgcolor as bgcolor
 ,dbo.fn_varbintostr_(cast(@Fsize as varchar),2) as Fsize 
 into #temp_fp_param
 
 --@CODETYPE
 select a.*,OSD_Duration+OSD_Repitition+OSD_Interval+dbo.fn_varbintostr_(LEN(OSD_Data)/2+1,4)+@CODETYPE+OSD_Data+Channel_Tag+
 Case Channel_Tag when '01' then Channel_number+Channel_id when '02' then '10'+Sendtime+'000000FFFFFF'+onebyte+Transperancy+fcolor+bgcolor+Fsize else '' end 
 as fpdata into #t from #temp_fp_param a 
 
  select (len(fpdata)/2) as fplength,b.VALUE as PPID,* into #t_cmd 
 from   #t a , X_SYSTEM_CONSTANTS b where b.Name='PPID'
 
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
  select a.Id as MessageUniqueId,b.SmartCardId,b.SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy,AreaCasCode
  from SMS_CASMESSAGE_TO a
  left outer join #temp_pairings b on a.Area_CardId=b.SmartCardId  
  where a.CASmsgId=@mId and b.SmartcardNo is not null
 Select @msg='Flash Message send Sucessfully to '+cast(COUNT(*) as varchar)+ ' Selected Smartcards ' from #temp_pairings
 
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
  
  Select @msg='Flash Message send Sucessfully to '+cast(COUNT(*) as varchar)+ ' Selected Area ' from #temp_areas     
 end
 Else
 if(@FpTo=0)
 begin
  insert into SMS_CASMESSAGE_TO(Area_CardId,CASmsgId)
  Select 0,@mId 
    
  insert into #temp_pairings_area(MessageUniqueId,SmartCardId,SmartcardNo,STBNo,StbId,SubscriberId,PairingId,AccountId,AreaId,CreatedBy)
  select a.Id as MessageUniqueId,-1,'Global FlashMsg',-1,-1,-1,-1,-1,-1,@UserId
  from SMS_CASMESSAGE_TO a where CASmsgId=@mId
  Set @msg='Flash Message send Sucessfully to All Smartcards Globally ' 
 end
  
 
 select *,
 dbo.cas_abv_formatcmd('0160'+dbo.fn_varbintostr_(fplength+16+Case @FpTo when 0 then 0 when 1 then 4 else 5 end,4)+PPID+expiryTime+'01'+FpTo
 +Case @FpTo when 0 then '' when 1 then dbo.fn_varbintostr_(a.AreaCasCode,8) else dbo.cas_abv_convert_smartcard(SmartcardNo) end+dbo.fn_varbintostr_(fplength+4,4)+dbo.fn_varbintostr_(MessageUniqueId,8)+fpdata) as Command
 into  #t_f from #temp_pairings_area a,#t_cmd b 
 
 
 
 Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
 CreatedOn,CreatedBy,MSG_MAP_ID,CASTYPE)
 select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.AccountId,'FLASHMSG',12,a.Command,'cas_sms_get_flashmessage',
 dateAdd(minute,1,getdate()),GETDATE(),@UserId,MessageUniqueId,'1' from #t_f a
  
 Select @msg as msg
End
GO
