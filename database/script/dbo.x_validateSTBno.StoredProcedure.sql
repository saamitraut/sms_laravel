USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[x_validateSTBno]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[x_validateSTBno] @scno as varchar(20),@sessionId as varchar(250)
as
begin
	
	declare @msg as varchar(250)
	declare @ScId as varchar(250)
	
	update SMS_STBS set IsLocked=0 where LockedFrom=@sessionId and IsLocked=1
	
	Select @msg=
	case when AccountId>0 then 'Already Alloted to SubscriberId '+dbo.getCustomerId(SubscriberId) 
	when PairingId>0 then 'Already Associated with Smartcard '+dbo.getPairingSCNo(PairingId) 
	when (IsLocked=1 and DATEDIFF(MI,LockedOn,GETDATE())<6) then 'STB is not Available at this Movement Please Try Later'
	when Status=3 then 'STB is in Faulty Stock. Please move it to QC for Pairing.' 
	when Status=4 then 'STB is Blacklisted and cannot be paired.'
	else 'Ok' end ,
	 @ScId=case when AccountId=0 and PairingId=0 and (IsLocked=0 or DATEDIFF(MI,LockedOn,GETDATE())>6) and Status=1 then Id  else 0 end
	from sms_view_stb where STBNo=@scno
	if @ScId is not null and @msg is not null
	begin
		Update SMS_STBS set IsLocked=1 ,LockedOn=GETDATE(),LockedFrom=@sessionId where Id=@ScId
		Select @msg as msg,@ScId as StbId 
		
	end
	else
	Begin
		Select 'Enter STbNo Does not Exists' as msg,-1 as StbId 
	end	
end
GO
