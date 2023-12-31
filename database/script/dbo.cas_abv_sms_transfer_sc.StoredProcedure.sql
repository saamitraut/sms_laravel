USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_abv_sms_transfer_sc]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cas_abv_sms_transfer_sc]--abv command
	@accountid bigint,@oldscno as varchar(16),@createdBy as bigint
AS
begin

--Select Pairings in temptable
select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,Id as AccountId,@oldscno as oldscno
,GETDATE() as CommandDate,@createdBy as CreatedBy 
into #temp_pairings from sms_view_accounts_pairings b where Id=@accountid

if exists(select * from #temp_pairings)
begin
--Send Bind
		
		---BINDSC 45 6  Smartcard on CAS --precautional
Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
CreatedOn,CreatedBy,CASTYPE)
select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'TRANSC',3,dbo.cas_abv_formatcmd(dbo.cas_abv_TransferSmartcard(oldscno,SmartcardNo))
,'cas_abv_sms_transfer_sc',CommandDate,GETDATE(),CreatedBy,'1' from #temp_pairings	

end
end

GO
