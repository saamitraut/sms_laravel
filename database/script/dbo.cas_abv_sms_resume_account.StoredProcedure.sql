USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_abv_sms_resume_account]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cas_abv_sms_resume_account]--abv command
	@accountid bigint,@createdBy as bigint
AS
begin

--Select Pairings in temptable
select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,Id as AccountId,
isnull(ActivationDate,GETDATE()) as CommandDate,@createdBy as CreatedBy 
into #temp_pairings from sms_view_accounts_pairings b where Id=@accountid


if exists(select * from #temp_pairings)
begin
---ADDSC Add Smartcard to CAS
Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
CreatedOn,CreatedBy,CASTYPE)
select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'RESSC',5,dbo.cas_abv_formatcmd(dbo.cas_abv_ResumeSmartcard(SmartcardNo))
,'Resume_cas_abv_sms_activate_account',CommandDate,GETDATE(),CreatedBy,'1' from #temp_pairings

end
end

GO
