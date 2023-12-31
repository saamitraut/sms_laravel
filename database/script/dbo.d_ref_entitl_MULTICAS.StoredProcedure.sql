USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[d_ref_entitl_MULTICAS]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[d_ref_entitl_MULTICAS] @accountId as bigint,@UserId as bigint As
Begin

update PRP_ACCOUNTTRANSACTION set CASStatus=0 where AccountId=@accountId 

declare @castypeId as bigint;
select @castypeId=CASTYPEID from sms_view_SubscriberAccountList where id=@accountId;

if (@castypeId=4) --catvision activate Command for refresh
begin

insert into SMS_CATVISION_CMDS (SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,
Status,Command_Param,Remark,CommandDate,CreatedOn,CreatedBy,Command)
select top 1 SmartcardNo as SmartCardNo,SmartCardId as SmartCardId,STBNo as STBNo,StbId as StbId,SubscriberId,Id,'103' as CommandId,
'Create_smartcard_request' as CommandName,0 as Status,'103' as Command_Param,'Create_smartcard_request' as Remark,getdate() as CommandDate,getdate() as CreatedOn,
@UserId as CreatedBy,SmartcardNo as Command from sms_view_SubscriberAccountList where id=@accountId;

exec prp_activate_prepaid_refresh @accountId,@UserId,@remark='d_refresh_entitlement'
end

if (@castypeId=5) --BCAS
begin

exec prp_activate_prepaid @accountId,@UserId,@remark='d_refresh_entitlement'

end

end
GO
