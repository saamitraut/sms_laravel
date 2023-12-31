USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[CatVision_Create_Smartcard_Request_hex]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CatVision_Create_Smartcard_Request_hex] @accountid bigint,@createdBy as bigint
AS
begin
--Open Account Request
insert into SMS_CATVISION_CMDS (SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,Status,Command_Param,ActivationDate,DeactivationDate,Remark,CommandDate,CreatedOn,CreatedBy,Command)
select top 1 a.SmartCardNo,a.SmartCardId,a.STBNo,a.StbId,a.SubscriberId,a.Id as AccountId,'103' as CommandId,'Create_smartcard_request' as CommandName,Status,'103' as Command_Param,ActivationDate,DeactivationDate,Remark,getdate() as CommandDate,CreatedOn,CreatedBy,
dbo.fn_varbintostr_('2',2) --Protocol Version
+dbo.fn_varbintostr_('103',4) --Message Type
+dbo.fn_varbintostr_(Len('0001'+dbo.fn_varbintostr_(Len('101'),4)+'101'
+'0002'+dbo.fn_varbintostr_(len(SMartcardNo),4)+cast(SMartcardNo as varchar)
+'0006'+dbo.fn_varbintostr_(len('1'),4)+'1'),4) --Message Length
--Para Type,para Len,para value
+'0001'+dbo.fn_varbintostr_(Len('101'),4)+'101'
+'0002'+dbo.fn_varbintostr_(len(SMartcardNo),4)+cast(SMartcardNo as varchar)
+'0006'+dbo.fn_varbintostr_(len('1'),4)+'1'
from sms_view_SubscriberAccountList a where a.Id=@accountid and CASTYPEID=2
End
GO
