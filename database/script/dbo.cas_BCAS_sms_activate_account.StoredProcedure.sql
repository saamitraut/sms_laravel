USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_BCAS_sms_activate_account]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[cas_BCAS_sms_activate_account] @accountid bigint,@createdBy as bigint,@remark as varchar(50)='cas_BCAS_sms_activate_account'
AS
Begin
	
	if(OBJECT_ID('tempdb.dbo.#temp_pairing_bcas') is not null)    
	drop table #temp_pairing_bcas 

	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,Id as AccountId,@createdBy as CreatedBy, CASTYPEID
	into #temp_pairing_bcas from sms_view_accounts_pairings b where Id=@accountid

	if exists(select * from #temp_pairing_bcas)
	Begin
	
		Insert into SMS_BCAS_CMDS(SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,STBNo,SubscriberId,AccountId,'ADD_SMARTCARD','0201'+'03'+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo+'11'+dbo.fn_varbintostr_(Len(STBNo),4)+dbo.fn_varbintostr_(STBNo,Len(STBNo))+'09000800580023',
		@remark,GetDate(),GETDATE(),CreatedBy,CASTYPEID from #temp_pairing_bcas

	End
	if(OBJECT_ID('tempdb.dbo.#temp_pairing_bcas') is not null)    
	drop table #temp_pairing_bcas 
End

GO
