USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[x_validatePairing]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[x_validatePairing] @cNo as varchar(20),@type as bit,@sessionId as varchar(250),@op as bigint    
as
begin
	declare @msg as varchar(250)
	declare @Pid as bigint
	declare @ts as bit
	declare @StbBrandId as bigint
	declare @SCMNO as varchar(20)
	declare @STBNO as varchar(20)
	declare @boxtype as varchar(1)
	declare @opex as bigint  
	declare @flg as bit  
	
	update SMS_PAIRING set IsLocked=0 where LockedFrom=@sessionId and IsLocked=1

	Select @msg=case when AccountId>0 then 'Already Alloted to SubscriberId '+dbo.getCustomerId(SubscriberId) 	
	when (IsLocked=1 and DATEDIFF(MI,LockedOn,GETDATE())<6) then 'Smartcard STB Pair is not Available <br> Please Try Later'
	when Status=0 then 'Not available in Stock'
	else 'Ok' end ,@STBNO=STbNo,@SCMNO=SmartcardNo,@opex=ISNULL(case when AllocatedOperatorId!=0 then AllocatedOperatorId else null end,0),    
	@Pid=case when AccountId=0 and (IsLocked=0 or DATEDIFF(MI,LockedOn,GETDATE())>6) and Status=1  then Id  else 0 end,
	@StbBrandId=StbBrandId,@ts=TimeShift,@boxtype=BoxType from sms_view_pairing where ((@type=1 and SmartcardNo=@cNo)  or (StbNo=@cNo and @type=0)) 

	 if(@op!=@opex)  
 begin   
 set @flg=1  
 set @msg='Not available with this operator'  
 end  

	if(@flg is not null)  
	 begin   
	 select @msg as msg,'' as STBNo,'' as SmartcardNo,0 as StbBrandId,0 as TimeShift,@boxtype as boxtype  
	 end  
	 else if @Pid is not null and @msg is not null
	begin
		Update SMS_PAIRING set IsLocked=1 ,LockedOn=GETDATE(),LockedFrom=@sessionId where Id=@Pid
		Select @msg as msg,@Pid as PairingId, @STBNO as StbNo,@SCMNO as SmartCardNo,@StbBrandId	as StbBrandId,@ts as TimeShift,@boxtype as boxtype
	end
	else
	Begin
		
		Select case @type when 1 then (case when (select Status FROM SMS_SMARTCARDS where SmartcardNo=@cNo)=4 then 'SMC BlackList' else 'Entered SmartcardNo Does not Exist' end) 
		when 0 then (case when (select Status FROM SMS_STBS where STBNo=@cNo)=4 then 'Stb Blacklist' else 'Entered Stb Does not Exist' end)
		else 'Entered STBNO Does not Exist'  end as msg,'' as StbNo,'' as SmartCardNo,
		0 as StbBrandId,0 as TimeShift,0 as boxtype
	end	
end
GO
