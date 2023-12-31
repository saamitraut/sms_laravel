USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[x_validateSCno]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[x_validateSCno] @scno as varchar(20),@sessionId as varchar(250)
as
begin
	
	declare @msg as varchar(250)
	declare @ScId as varchar(250)
	
	update SMS_SMARTCARDS set IsLocked=0 where LockedFrom=@sessionId and IsLocked=1
	
	Select @msg=case 
	when AccountId>0 then 'Already Alloted to SubscriberId '+dbo.getCustomerId(SubscriberId) 
	when PairingId>0 then 'Already Associated with STB '+dbo.getPairingSTBNo(PairingId) 
	when (IsLocked=1 and DATEDIFF(MI,LockedOn,GETDATE())<6) then 'Smartcard is not Available at this Movement Please Try Later'
	when Status=3 then 'Smartcard is in Faulty Stock. Please move it to QC for Pairing.' 
	when Status=4 then 'Smartcard is Blacklisted and cannot be paired.'
	else 'Ok' end ,
	 @ScId=case when AccountId=0 and PairingId=0 and (IsLocked=0 or DATEDIFF(MI,LockedOn,GETDATE())>6) and Status=1 then Id  else 0 end
	from sms_view_smartcard where SmartcardNo=@scno  
	if @ScId is not null and @msg is not null
	begin
		Update SMS_SMARTCARDS set IsLocked=1 ,LockedOn=GETDATE(),LockedFrom=@sessionId where Id=@ScId
		Select @msg as msg,@ScId as SmartcardId 
		
	end
	else
	Begin
		Select 'Enter SmartcardNo Does not Exists' as msg,-1 as SmartcardId 
	end	
end
GO
