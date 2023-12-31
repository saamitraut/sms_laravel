USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_Gospel_sms_bind_unbind_sc]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cas_Gospel_sms_bind_unbind_sc] @pairingId bigint,@createdBy as bigint
AS
begin
	if(OBJECT_ID('tempdb.dbo.#temp_pairingggs1') is not null)    
			drop table #temp_pairingggs1

	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,AccountId as AccountId,isnull(GETDATE(),GETDATE()) as CommandDate,@createdBy as CreatedBy,CASTYPEID
	into #temp_pairingggs1 from sms_view_pairing b where Id=@pairingId

	if exists(select * from #temp_pairingggs1)
	Begin
	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
	select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'CANBDSC',7,dbo.cas_abv_formatcmd(dbo.cas_abv_Gospel_UnBindSmartcard(SmartcardNo,STBNo,GETDATE()))
	,'cas_Gospel_sms_bind_unbind_sc',CommandDate,GETDATE(),CreatedBy,CASTYPEID from #temp_pairingggs1	
	End

	if(OBJECT_ID('tempdb.dbo.#temp_pairingggs1') is not null)    
			drop table #temp_pairingggs1

End
GO
