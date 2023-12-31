USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[CatVision_Create_Smartcard_Request]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CatVision_Create_Smartcard_Request]--abv command
	@accountid bigint,@createdBy as bigint
AS
begin


--Select Pairings in temptable
select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,b.Id as AccountId,
isnull(ActivationDate,GETDATE()) as CommandDate,@createdBy as CreatedBy,a.BranchId 
into #temp_pairings from sms_view_accounts_pairings b 
LEFT OUTER JOIN sms_view_subscribers a on b.SubscriberId=a.Id
where b.Id=@accountid and CASTYPEID=4

if exists(select * from #temp_pairings)
begin
insert into SMS_CATVISION_CMDS (SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,
Status,Command_Param,Remark,CommandDate,CreatedOn,CreatedBy,Command)
select top 1 SmartcardNo as SmartCardNo,SmartCardId as SmartCardId,STBNo as STBNo,StbId as StbId,a.SubscriberId,a.AccountId as AccountId,
'103' as CommandId,
'Create_smartcard_request' as CommandName,
0 as Status,'103' as Command_Param,'Create_smartcard_request' as Remark,getdate() as CommandDate,getdate() as CreatedOn,
@createdBy as CreatedBy,SmartcardNo as Command
from #temp_pairings a
end
End
GO
