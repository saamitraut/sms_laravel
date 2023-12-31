USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_Gospel_sms_activate_account]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cas_Gospel_sms_activate_account] @accountid bigint,@createdBy as bigint,@bindSc as bit=1,@cmt as varchar(20)=''
AS
Begin
	declare @add as int
	if(@cmt!='')
	set @add=0
	else
	set @add=0
	if(OBJECT_ID('tempdb.dbo.#temp_pairingggs') is not null)    
			drop table #temp_pairingggs 

	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,Id as AccountId,
	dateadd(ss,@add,dbo.returnGreaterdate(isnull(cast(ActivationDate as datetime),GETDATE()),GETDATE())) as CommandDate,@createdBy as CreatedBy,CASTYPEID
	into #temp_pairingggs from sms_view_accounts_pairings b where Id=@accountid

	if exists(select * from #temp_pairingggs)
	Begin
		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,
		Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,@cmt+'ADDinDATATBASE',1,dbo.cas_abv_formatcmd('02'+'0A'+dbo.fn_varbintostr_(LEN(dbo.cas_Gospel_convert_smartcard(SmartcardNo)+'01'+'00000000'+'01'+'00000000'+'00000000'+'0001'+'01'+'00000001'+
		dbo.getNdigit_str(dbo.fn_stringtohexStr('ENTL FROM SMS'),40)+dbo.getNdigit_str(dbo.fn_stringtohexStr('ENTL FROM SMS'),40)+
		dbo.fn_getUTCHexdateTime(DATEADD(DAY,7,GETDATE())))/2,4)+dbo.cas_Gospel_convert_smartcard(SmartcardNo)+'01'+
		'00000000'+'01'+'00000000'+'00000000'+'0001'+'01'+'00000001'+dbo.getNdigit_str(dbo.fn_stringtohexStr('ENTL FROM SMS'),40)+
		dbo.getNdigit_str(dbo.fn_stringtohexStr('ENTL FROM SMS'),40)+dbo.fn_getUTCHexdateTime(DATEADD(Day,7,GETDATE())))
		,'cas_Gospel_sms_addindatabase_account',CommandDate,GETDATE(),CreatedBy,CASTYPEID from #temp_pairingggs

		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
		CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,@cmt+'ADDSC',1,dbo.cas_abv_formatcmd(dbo.cas_Gospel_activateSmartcard(SmartcardNo,DATEADD(d,7,getdate())))
		,'cas_Gospel_sms_activate_account',CommandDate,GETDATE(),CreatedBy,CASTYPEID from #temp_pairingggs

		Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
		CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,@cmt+'BINDSC',6,dbo.cas_abv_formatcmd(dbo.cas_Gospel_PairingSmartcard(SmartcardNo,STBNo,DATEADD(MONTH,6,getdate())))
		,'cas_Gospel_sms_activate_account',dateadd(s,3,CommandDate),GETDATE(),CreatedBy,CASTYPEID from #temp_pairingggs
	End
	if(OBJECT_ID('tempdb.dbo.#temp_pairingggs') is not null)    
			drop table #temp_pairingggs 
End
GO
