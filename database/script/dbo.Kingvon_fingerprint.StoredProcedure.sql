USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[Kingvon_fingerprint]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc[dbo].[Kingvon_fingerprint]--x01
@AreapairingId as varchar(8000)=Null,
@showType as varchar(2)='1',
@encryptType as varchar(2)='0',
@forceType as varchar(2)='1',
@sparkle as varchar(2)='1',
@startTime as datetime,
@duration as int,    
@repitition as int,
@interval as int,
@f_size as varchar(2),
@fcolor as varchar(6),
@bgcolor as varchar(6),
@transparency as varchar(2)='64',
@displayType as varchar(2),
@OSD_Data as varchar(255),
@UserId as bigint

as 
Begin
	
	----DECLARE @x_pos as int
	----DECLARE @y_pos as int

	--SET @x_pos=150;
	--SET @y_pos=150;

declare @msg as varchar(500)
declare @acc as bigint

	Select a.SmartcardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.Id as PairingId,a.AccountId as AccountId,'' as AreaName,0 as AreaId,
	0 as AreaCasCode,@UserId as CreatedBy into #temp_pairings
	from sms_view_pairing a
	left outer join dbo.Split_coma(@AreapairingId) b on a.Id=CAST(b.items as bigint)
	where b.items is not null and a.CASTYPEID=6

	while exists(select * from #temp_pairings)
	BEGIN

	select top 1 @acc=AccountId from #temp_pairings;

	declare @mId as bigint
	insert into SMS_KINGVON_CASMSG(mType,cmdName,UA_TYPE,InsertedOn,InsertedBy)
	values ('1','FINGERPRINT',2,getdate(),@UserId)
	Select @mId=SCOPE_IDENTITY()
	
	declare @OSD_ID as varchar(8)
	Set @OSD_ID='01'+dbo.fn_varbintostr_((@mId%16777215),6)
	
	insert into SMS_KINGVON_CASMSG_PARAM(Value,Param,MsgId)
	Select @OSD_ID,'FP_ID' ,@mId
	Union	Select @showType,'showType' ,@mId
	Union	Select @encryptType,'encryptType' ,@mId
	Union	Select @forceType,'forceType' ,@mId	
	Union	Select @sparkle,'sparkle' ,@mId	
	Union	Select convert(varchar,@startTime,120)  ,'startTime' ,@mId
	Union Select cast(@duration as varchar),'duration' ,@mId    
	Union Select cast(@repitition as varchar),'repitition' ,@mId    
	Union Select cast(@interval as varchar),'interval' ,@mId    
	Union	Select cast(@f_size as varchar),'f_size' ,@mId		
	Union	Select cast(@fcolor as varchar),'fcolor' ,@mId
	Union	Select cast(@bgcolor as varchar),'bgcolor' ,@mId		
	Union	Select @transparency,'transparency' ,@mId
	Union	Select @displayType,'displayType' ,@mId
	Union	Select @OSD_Data,'FP_Data' ,@mId
	Union	Select convert(varchar,GETDATE(),120),'CurrentTime',@mId 	

	insert into KingvonCommandLog (CommandName,AccountId,SubscriberId,SmartcardNo,STBNo,Request,Description,CreatedOn,CreatedBy,Priority)
	select 'FINGERPRINT',a.AccountId,a.SubscriberId,a.SmartcardNo,a.STBNo,
	dbo.fn_varbintostr_(len('0213'--Command Code
	+dbo.fn_varbintostr_(Len('01'+'01'+'01'+'01'+'01'+'0'+Substring(a.SmartcardNo,8,8)+''),2)--Address Body
	+'01'+'01'+'01'
	+'0'+Substring(a.SmartcardNo,8,8)
	+'0001'--NUMBER H(4)
	+@OSD_ID--random 8 digit number
	+@showType
	+@encryptType
	+@forceType
	+@sparkle
	+convert(varchar(8),@startTime,112)+replace(CONVERT(varchar(8),@startTime,108),':','')
	+dbo.fn_varbintostr_(@duration,4)
	+dbo.fn_varbintostr_(@repitition,4)
	+dbo.fn_varbintostr_(@interval,4)
	+@f_size
	+'0' --layout
	+'0' --frame
	+'FFFF' -- x-size 
	+'FFFF' -- y-size
	+'FFFF' -- x-position --send FFFF for Random
	+'FFFF' -- y-position  --Send FFFF for Random
	+@fcolor
	+@bgcolor
	+@transparency
	+@displayType
	+dbo.fn_varbintostr_(LEN(@OSD_Data),4) --OSD Data Length
	+'00' --content coding
	+@OSD_Data),4)
	+'0213'--Command Code
	+dbo.fn_varbintostr_(Len('01'+'01'+'01'+'01'+'01'+'0'+Substring(a.SmartcardNo,8,8)+''),2)--Address Body
	+'01'+'01'+'01'
	+'0'+Substring(a.SmartcardNo,8,8)
	+'0001'--NUMBER H(4)
	+@OSD_ID--random 8 digit number
	+@showType
	+@encryptType
	+@forceType
	+@sparkle
	+convert(varchar(8),@startTime,112)+replace(CONVERT(varchar(8),@startTime,108),':','')
	+dbo.fn_varbintostr_(@duration,4)
	+dbo.fn_varbintostr_(@repitition,4)
	+dbo.fn_varbintostr_(@interval,4)
	+@f_size
	+'0' --layout
	+'0' --frame
	+'FFFF' -- x-size 
	+'FFFF' -- y-size
	+'FFFF' -- x-position  --send FFFF for random
	+'FFFF' -- y-position  ---send FFFF for random
	+@fcolor
	+@bgcolor
	+@transparency
	+@displayType
	+dbo.fn_varbintostr_(LEN(@OSD_Data),4) --OSD Data Length
	+'00' --content coding
	+@OSD_Data
	,'FINGERPRINT',getdate(),@UserId,6 as Priority from #temp_pairings a where a.AccountId=@acc

	Delete from #temp_pairings where AccountId=@acc;

	END

	--select @msg='Fingerprint Message Sent Succesfully!';

End

GO
