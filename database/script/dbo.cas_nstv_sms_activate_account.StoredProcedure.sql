USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_nstv_sms_activate_account]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[cas_nstv_sms_activate_account] @accountid bigint,@createdBy as bigint,@bindSc as bit=1,@cmt as varchar(20)=''
AS
Begin
	if(OBJECT_ID('tempdb.dbo.#temp_pairingsss4') is not null)    
		drop table #temp_pairingsss4

	declare @add as int
	set @add=0

	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,Id as AccountId,
	dateadd(ss,@add,dbo.returnGreaterdate(isnull(cast(ActivationDate as datetime),GETDATE()),GETDATE())) as CommandDate,@createdBy as CreatedBy,CASTYPEID
	into #temp_pairingsss4 from sms_view_accounts_pairings b where Id=@accountid 

	if exists(select * from #temp_pairingsss4)
	begin
		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
		CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'SMS_CA_OPEN_ACCOUNT_REQUEST',1,''
		,'SMS_CA_OPEN_ACCOUNT_REQUEST',GETDATE(),GETDATE(),@createdBy,CASTYPEID from #temp_pairingsss4

		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
		CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'SMS_CA_REPAIR_REQUEST',1,''
		,'SMS_CA_REPAIR_REQUEST',GETDATE(),GETDATE(),@createdBy,CASTYPEID from #temp_pairingsss4
	End
	if(OBJECT_ID('tempdb.dbo.#temp_pairingsss4') is not null)    
		drop table #temp_pairingsss4 
End
GO
