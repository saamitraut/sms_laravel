USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_Telelynx_activate_account]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cas_Telelynx_activate_account] @accountid bigint,@createdBy as bigint,@bindSc as bit=1,@cmt as varchar(20)=''
AS
Begin
	if(OBJECT_ID('tempdb.dbo.#temp_pairingggs6') is not null)    
			drop table #temp_pairingggs6

	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,Id as AccountId,@createdBy as CreatedBy,CASTYPEID
	into #temp_pairingggs6 from sms_view_accounts_pairings b where Id=@accountid

	if exists(select * from #temp_pairingggs6)
	Begin
		insert into TELELYNX_CAS_CMDS(CommandName,Command,SmartCardNo,STBNo,AccountId,SubscriberId,Command_Param,CreatedOn,CreatedBy)
		select 'SendCardBaseInformation','PAIRING_CMD',SmartcardNo,STBNo,AccountId,SubscriberId,'2,1',GETDATE(),@createdBy from #temp_pairingggs6

		insert into TELELYNX_CAS_CMDS (CommandName,Command,SmartCardNo,STBNo,AccountId,SubscriberId,Command_Param,ActivationDate,DeactivationDate,CreatedOn,CreatedBy)
		select 'SendCardStatus','ACTIVATE_CARD',SmartcardNo,STBNo,AccountId,SubscriberId,'2',Getdate(),DATEADD(Y,3,Getdate()),GETDATE(),@createdBy from #temp_pairingggs6

		if(OBJECT_ID('tempdb.dbo.#temp_pairingggs6') is not null)    
			drop table #temp_pairingggs6 
	End

End
GO
