USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[d_suspend_resume_account]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[d_suspend_resume_account] @accountId as bigint,@actiondate as date,@remark as varchar(250),@CurrentStatus as bit,@UserId as bigint
As
Begin

Declare @CASTYPE as bigint;

Select @CASTYPE=CASTYPEID from sms_view_pairing	where AccountId=@accountId		

if @CurrentStatus=1 --Deactivate Suspend Account

Begin

Update SMS_SUBSCRIBERACCOUNTS set Status=0,DeactivationDate=@actiondate,ActionTaken=3,UpdatedOn=GETDATE(),UpdatedBy=@UserId,Remark=@remark where Id=@accountId
Update PRP_ACCOUNTTRANSACTION set Status=0,CASStatus=7,UpdatedBy=@UserId,UpdatedOn=GETDATE(),Remark='AccountSuspended' where AccountId=@accountId		

-- Send Cas Commands --							

if(@CASTYPE=1)
Begin
	exec [cas_abv_sms_suspend_account] @accountId,@UserId;
	Update PRP_ACCOUNTTRANSACTION set CASStatus=1 where AccountId=@accountId	
end
--if(@CASTYPE=5)
--Begin
--	Insert into SMS_BCAS_CMDS(SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
--	select SmartcardNo,STBNo,SubscriberId,Id as AccountId,'SUSPEND_SMARTCARD','020A'+'01'+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo as Command,
--	'd_suspend_resume_account',GetDate(),GETDATE(),CreatedBy,CASTYPEID from sms_view_SubscriberAccountList where Id=@accountId
--	Update PRP_ACCOUNTTRANSACTION set CASStatus=1 where AccountId=@accountId	
--End

Select SmartcardNo+' Deactivated Sucessfully' as msg,SmartCardId as lastScId  from sms_view_pairing where AccountId=@accountId 

End

else --Resume Account

Begin

Update SMS_SUBSCRIBERACCOUNTS set Status=1,ActionTaken=2,UpdatedOn=GETDATE(),UpdatedBy=@UserId,Remark=@remark where Id=@accountId
Update PRP_ACCOUNTTRANSACTION set Status=1,CASStatus=0,UpdatedBy=@UserId,UpdatedOn=GETDATE(),Remark='AccountResumed' where AccountId=@accountId		

if(@CASTYPE=1)
begin
	exec cas_abv_sms_resume_account @accountId,@UserId--,@remark='d_suspend_resume_account'
	Update PRP_ACCOUNTTRANSACTION set CASStatus=1 where AccountId=@accountId	
end
--if(@CASTYPE=5)
--Begin
--	Insert into SMS_BCAS_CMDS(SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
--	select SmartcardNo,STBNo,SubscriberId,Id as AccountId,'RESUME_SMARTCARD','020B'+'01'+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo as Command,
--	'd_suspend_resume_account',GetDate(),GETDATE(),CreatedBy,CASTYPEID from sms_view_SubscriberAccountList where Id=@accountId
--	Update PRP_ACCOUNTTRANSACTION set CASStatus=1 where AccountId=@accountId
--End

Select SmartcardNo+' Activated Sucessfully' as msg ,SmartCardId as lastScId from sms_view_pairing where AccountId=@accountId 

End

End
GO
