USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_abv_sms_bind_unbind_sc]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cas_abv_sms_bind_unbind_sc]--abv command
	@pairingId bigint,@createdBy as bigint,@bindSc as bit=1
AS
begin

--Select Pairings in temptable
select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,AccountId as AccountId,
isnull(GETDATE(),GETDATE()) as CommandDate,@createdBy as CreatedBy 
into #temp_pairings from sms_view_pairing b where Id=@pairingId

if exists(select * from #temp_pairings)
begin
--Send Bind
if @bindSc=1
	begin		
		---BINDSC 45 6  Smartcard on CAS --precautional
Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
CreatedOn,CreatedBy,CASTYPE)
select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'BINDSC',6,dbo.cas_abv_formatcmd(dbo.cas_abv_BindSmartcard(SmartcardNo,STBNo))
,'cas_abv_sms_bind_unbind_sc',CommandDate,GETDATE(),CreatedBy,'1' from #temp_pairings	
	End
	else
	begin		
		---CANBDSC 45 6  Smartcard on CAS --precautional
Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
CreatedOn,CreatedBy,CASTYPE)
select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'CANBDSC',7,dbo.cas_abv_formatcmd(dbo.cas_abv_UnBindSmartcard(SmartcardNo))
,'cas_abv_sms_bind_unbind_sc',CommandDate,GETDATE(),CreatedBy,'1' from #temp_pairings	
	End

end
end
GO
