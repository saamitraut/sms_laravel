USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[d_disconnect_account]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[d_disconnect_account] @accountId as bigint,@actiondate as date,@remark as varchar(250),@UserId as bigint,@StbStatus as int,
@SCStatus as int,@doc_ext as varchar(6)=null        
As        
Begin             
	Declare @msg as varchar(200)              
	Declare @pairingId as bigint        
	Declare @ScId as bigint 
	Declare @STbId as bigint 
	Declare @CASTYPE as bigint     
	
	select * into #t_r1 from prp_account_prepaidbouquets_trans_refund b where AccountId=@accountId            

	Select @pairingId=Id,@ScId=SmartcardId,@STbId=StbId,@CASTYPE=CASTYPEID,@msg='SmartcardNo-'+SmartcardNo+' and STB-'+STBNo from sms_view_pairing where AccountId=@accountId

	update PRP_ACCOUNTTRANSACTION set CASStatus=7 where AccountId=@accountId

	if(@CASTYPE=1) --ABV
	begin	

	exec [cas_abv_sms_cancell_entitlement]  @accountId,@UserId

Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,        
    CreatedOn,CreatedBy,CASTYPE)        

    select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,Id,'CANBDSC',7,dbo.cas_abv_formatcmd(dbo.cas_abv_UnBindSmartcard(SmartcardNo))        
    ,'d_disconnect_account',isnull(DeactivationDate,Getdate()),GETDATE(),CreatedBy,'1' from sms_view_accounts_pairings where Id=@accountId         
    and CASTYPEID=@CASTYPE        

    

    Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,        
    CreatedOn,CreatedBy,CASTYPE)        

    select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,Id,'DELSC',2,dbo.cas_abv_formatcmd(dbo.cas_abv_deleteSmartcard(SmartcardNo))        
    ,'d_disconnect_account',dateadd(SECOND,3,getdate()),GETDATE(),CreatedBy,'1' from sms_view_accounts_pairings where Id=@accountId        
	
	end
	if(@CASTYPE=5) --BCAS
	begin	
	exec dbo.cas_BCAS_cancell_entitlement @accountId,@UserId,7,'d_disconnect_account'
	
		if(@SCStatus=4)
	Begin
		Insert into SMS_BCAS_CMDS(SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,STBNo,SubscriberId,Id as AccountId,'BLACKLIST_SMARTCARD','020F'+'01'+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo as Command,
		'd_disconnect_account',GetDate(),GETDATE(),CreatedBy,CASTYPEID from sms_view_SubscriberAccountList where Id=@accountId
	End

	if(@StbStatus=4)
	Begin	
		Insert into SMS_BCAS_CMDS(SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
		select SmartcardNo,STBNo,SubscriberId,Id as AccountId,'BLACKLIST_STB','0210'+'01'+'11'+dbo.fn_varbintostr_(Len(STBNo),4)+dbo.fn_varbintostr_(STBNo,Len(STBNo)) as Command,
		'd_disconnect_account',GetDate(),GETDATE(),CreatedBy,CASTYPEID from sms_view_SubscriberAccountList where Id=@accountId	
	End
	

	Insert into SMS_BCAS_CMDS(SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
	select SmartcardNo,STBNo,SubscriberId,Id as AccountId,'CANCEL_SMARTCARD','0203'+'01'+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo as Command,
	'd_disconnect_account',GetDate(),GETDATE(),CreatedBy,CASTYPEID from sms_view_SubscriberAccountList where Id=@accountId
	end

	--set prorata deductable amount on dmlaction=1
	Update PRP_ACCOUNTTRANSACTION_HISTORY set Amount=case when ActivationDate>CAST(GETDATE() as DATE) then 0
	when ActivationDate=CAST(GETDATE() AS DATE) THEN CASE WHEN DATEDIFF(MINUTE,CreatedOn,GETDATE())<=120 THEN 0 ELSE (ROUND((Rate/30),2)*(DATEDIFF(DAY,ActivationDate,CAST(GETDATE() AS DATE))+1))
	--+dbo.AllTaxAmt((ROUND((Rate/30),2)*(DATEDIFF(DAY,ActivationDate,CAST(GETDATE() AS DATE))+1))) 
	END
	else
	(ROUND((Rate/30),2)*(DATEDIFF(DAY,ActivationDate,CAST(GETDATE() AS DATE))+1))
	--+dbo.AllTaxAmt((ROUND((Rate/30),2)*(DATEDIFF(DAY,ActivationDate,CAST(GETDATE() AS DATE))+1))) 
	end,
	Remark=ISNULL(Remark,'')+' prp_deactivate_prepaid' where Fid in (select Id from #t_r1) and DMLAction=1 and Amount>0;
	
	--set prorata refundable amount on deleted entry
	Update PRP_ACCOUNTTRANSACTION set Deleted=1,UpdatedOn=GETDATE(),UpdatedBy=@UserId,Amount=case when ActivationDate>cast(GETDATE() as date) then Amount
	when ActivationDate=CAST(GETDATE() AS DATE) THEN CASE WHEN DATEDIFF(MINUTE,CreatedOn,GETDATE())<=120 THEN Amount ELSE (ROUND((Rate/30),2)*(DATEDIFF(DAY,CAST(GETDATE() AS DATE),DeactivationDate)-1))
	--+dbo.AllTaxAmt((ROUND((Rate/30),2)*(DATEDIFF(DAY,CAST(GETDATE() AS DATE),DeactivationDate)-1))) 
	END
	else 
	(ROUND((Rate/30),2)*(DATEDIFF(DAY,CAST(GETDATE() AS DATE),DeactivationDate)-1))
	--+dbo.AllTaxAmt((ROUND((Rate/30),2)*(DATEDIFF(DAY,CAST(GETDATE() AS DATE),DeactivationDate)-1))) 
	end,
	Remark='Amount-Refunded by Proc' where id in (select Id from #t_r1) and Amount>0; 
	
	--for such trancations which are of zero amount
	Update PRP_ACCOUNTTRANSACTION set Deleted=1,UpdatedOn=GETDATE(),UpdatedBy=@UserId,Remark='Prepaid Package Deactivated' where id in (select Id from #t_r1) 
	and amount=0; 
	     
	--update PRP_ACCOUNTTRANSACTION set Deleted=1,UpdatedOn=GETDATE(),UpdatedBy=@UserId,Remark='Account Disconnected',Status=3 where AccountId=@accountId
	Update SMS_SUBSCRIBERACCOUNTS set Status=0,DeactivationDate=@actiondate,Deleted=1,UpdatedBy=@UserId,ActionTaken=Case @SCStatus when 4 then 5 else 4 end,UpdatedOn=GETDATE(),
	Remark=@remark where Id=@accountId        

	if @StbStatus>0 or @SCStatus>0 
	Begin 
		update SMS_SMARTCARDS set Status=@SCStatus,DocExtension=isnull(@doc_ext,DocExtension),UpdatedBy=@UserId,UpdatedOn=GETDATE(),Remark='AccountDisconnected' 
		where Id=@ScId and @SCStatus>0  
		update SMS_STBS set Status=@StbStatus,DocExtension=isnull(@doc_ext,DocExtension),UpdatedBy=@UserId,UpdatedOn=GETDATE(),Remark='AccountDisconnected' 
		where Id=@STbId and @StbStatus>0  
		update SMS_PAIRING set Deleted=1,UpdatedBy=@UserId,UpdatedOn=GETDATE(),Remark='AccountDisconnected' where Id=@pairingId;      

		Select @msg='Digital Connection with '+@msg+' Disconnected Sucessfully <br>Smartcard '        
		+Case @SCStatus when 4 then ' is marked Blacklisted 'when 3 then ' is marked Faulty ' else ' Is Send Back to Under QC ' end +' and STB '+ 
		Case @StbStatus  when 4 then ' is marked Blacklisted ' when 3 then ' is marked Faulty  ' else ' Is Send Back to Under QC ' end         
	End 
	Else  
	begin        
		Select @msg='Digital Connection with '+@msg+' Disconnected Successfully <br>Smartcard and STB Pairing is Send back to Pairing Stock'       
	end        
	Select @msg as msg,1 as result,@ScId as lastScId,@STbId as lastStbId                          
End         
GO
