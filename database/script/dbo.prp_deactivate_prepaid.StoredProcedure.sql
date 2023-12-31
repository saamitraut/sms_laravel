USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[prp_deactivate_prepaid]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prp_deactivate_prepaid] (@trans_tab_toremove as prp_AcctTransaction readonly,@accountId as bigint,@UserId as bigint,@remark as varchar(250)='')
As
Begin

	select * into #t_r1 from @trans_tab_toremove a 
	left outer join prp_account_prepaidbouquets_trans_refund b on a.TransactionId=b.Id	
	
	Update PRP_ACCOUNTTRANSACTION set Status=0,CASStatus=7 where AccountId=@accountId and id in (Select Id from #t_r1)
	
	Declare @CASTYPE as bigint
	Select @CASTYPE=CASTYPEID from sms_view_pairing	where AccountId=@accountId		
					
	if(@CASTYPE=1) --ABV
	begin	
		exec [cas_abv_sms_cancell_entitlement] @accountId,@UserId,7
	end
	if(@CASTYPE=5) --BCAS
	begin	
		exec cas_BCAS_cancell_entitlement @accountId,@UserId,7,'prp_deactivate_prepaid'
	end

--set prorata deductable amount on dmlaction=1
Update PRP_ACCOUNTTRANSACTION_HISTORY set Amount=case when ActivationDate>CAST(GETDATE() as DATE) then 0
when ActivationDate=CAST(GETDATE() AS DATE) THEN CASE WHEN DATEDIFF(MINUTE,CreatedOn,GETDATE())<=30 THEN 0 
ELSE (ROUND((Rate/30),2)*(DATEDIFF(DAY,ActivationDate,CAST(GETDATE() AS DATE))+1))
--+dbo.AllTaxAmt((ROUND((Rate/30),2)*(DATEDIFF(DAY,ActivationDate,CAST(GETDATE() AS DATE))+1)))
 END
else
(ROUND((Rate/30),2)*(DATEDIFF(DAY,ActivationDate,CAST(GETDATE() AS DATE))+1))
+dbo.AllTaxAmt((ROUND((Rate/30),2)*(DATEDIFF(DAY,ActivationDate,CAST(GETDATE() AS DATE))+1))) end,
Remark=ISNULL(Remark,'')+' prp_deactivate_prepaid' where Fid in (select Id from #t_r1) and DMLAction=1 and Amount>0;
	
--set prorata refundable amount on deleted entry
Update PRP_ACCOUNTTRANSACTION set Deleted=1,UpdatedOn=GETDATE(),UpdatedBy=@UserId,Amount=case when ActivationDate>cast(GETDATE() as date) then Amount
when ActivationDate=CAST(GETDATE() AS DATE) THEN CASE WHEN DATEDIFF(MINUTE,CreatedOn,GETDATE())<=30 
THEN Amount ELSE (ROUND((Rate/30),2)*(DATEDIFF(DAY,CAST(GETDATE() AS DATE),DeactivationDate)-1))
--+dbo.AllTaxAmt((ROUND((Rate/30),2)*(DATEDIFF(DAY,CAST(GETDATE() AS DATE),DeactivationDate)-1)))
 END
else 
(ROUND((Rate/30),2)*(DATEDIFF(DAY,CAST(GETDATE() AS DATE),DeactivationDate)-1))
--+dbo.AllTaxAmt((ROUND((Rate/30),2)*(DATEDIFF(DAY,CAST(GETDATE() AS DATE),DeactivationDate)-1))) 
end,
Remark='Amount-Refunded by Proc' where id in (select Id from #t_r1) and Amount>0; 
	
--for such trancations which are of zero amount
Update PRP_ACCOUNTTRANSACTION set Deleted=1,UpdatedOn=GETDATE(),UpdatedBy=@UserId,Remark='Prepaid Package Deactivated' where id in (select Id from #t_r1) and amount=0;
				
Select cast(COUNT(Id) as varchar)+'	 Bouquets Deactivated and Refund Amount returned to Operator account successfully.' as msg,'false' as error  from #t_r1
End
GO
