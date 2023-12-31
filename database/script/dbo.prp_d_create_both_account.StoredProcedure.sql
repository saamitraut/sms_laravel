USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[prp_d_create_both_account]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prp_d_create_both_account] @bou_tab as prp_AcctBouqe readonly,@SubscriberId as bigint,@connectionId as bigint        
,@ActivationDate as datetime,@DeactivationDate as datetime,@pairingId as bigint,@UserId as bigint,@Description as varchar(250),@discountId as bigint,
@Package as varchar(8000),@Alacarte as varchar(8000),@BillingSMonth as date=null,@ratetype as bit=1,@subop_op as bit=1,@remark as varchar(250)=''        
As        
Begin        
declare @AccountId as bigint        
declare @msg as varchar(250)  
declare @castypeId as bigint        
declare @commandsent as bit=0        
  
Select @castypeId=CASTYPEID from sms_view_pairing_stock where Id=@pairingId        
  
if exists(Select Id from sms_view_pairing_stock where Id=@pairingId)        
Begin        

  insert into SMS_SUBSCRIBERACCOUNTS (SubscriberId,ConnectionId,IsPrimary,ApplicableRate,PairingId,ActivationDate,CreatedOn,CreatedBy,Description,
  TimeShift,BillingSMonth,ExpiryDate,Acct_Type)        
  Select @SubscriberId,@connectionId,dbo.getDigitalAccountType(@SubscriberId),dbo.getDigitalAccountType(@SubscriberId)|@ratetype,Id,
  @ActivationDate,GETDATE(),@UserId,@Description,TimeShift,isnull(@BillingSMonth,GETDATE()),@DeactivationDate,1        
  from sms_view_pairing_stock where Id= @pairingId;            
  
  Select @msg='Account Added Successfully',@AccountId=SCOPE_IDENTITY();          
  
 -- if(@AccountId>0)        
 -- Begin                         
 
 --  declare @OperatorId as bigint
     
 --  Select @operatorId=OperatorId from SMS_SUBSCRIBERS where Id = @SubscriberId   
         
	--if(@castypeId=1)        
 --    begin         
 --     begin try         
 --      exec cas_abv_sms_activate_account @AccountId,@UserId   
 --     end try        
 --     begin catch        
 --      print 'error'        
 --     end catch        
 --    end        
 --    else if(@castypeId=6)       
 --    Begin
	--	begin try	
	--		exec cas_nstv_sms_activate_account @AccountId,@UserId	
	--	end try
	--	begin catch
	--		print 'error'
	--	end catch
	-- end 
	-- else if(@castypeId=4)       
 --    Begin
	--	begin try	
	--		exec CatVision_Create_Smartcard_Request @AccountId,@UserId	
	--	end try
	--	begin catch
	--		print 'error'
	--	end catch
	-- End   
	-- else if(@castypeId=5)--BCAS       
 --    Begin
	--	begin try	
	--		exec cas_BCAS_sms_activate_account @AccountId,@UserId	
	--	end try
	--	begin catch
	--		print 'error'
	--	end catch
	-- End          
 -- End     
          
  if(exists(Select * from SMS_SUBSCRIBERACCOUNTS where Id=@accountId and Status=1))        
  Begin        
  Begin Try
	---------------------------------------------NCF Calculation Start------------------------------------------------------
	declare @NCFAmount as float;
	declare @bouStrNew Varchar(8000);
	SELECT top 1 @bouStrNew=STUFF((SELECT ',' + cast(BouqueId as varchar) FROM @bou_tab EE FOR XML PATH('')),1,1,'') FROM @bou_tab Erpr;

	select @NCFAmount=dbo.[NCFChannelAmount](@bouStrNew,@AccountId);
    ---------------------------------------------NCF Calculation Stop------------------------------------------------------
	select *,round(Rate*noMonths,2) as Amt,round(LCOSharing*noMonths,2) as LCOSharingAmt,cast(0 as float) as NCFAmount,cast(0 as float) as NCF_LCOSharing,@accountId as accountId
	into #temp_trans_1 from(select x.* ,(DATEDIFF(D,activationdate,ExpiryDate)/30) as noMonths,z.Days as noDays from (
	Select a.id as BouqueId,a.BouqueName,a.Rate,a.LCOSharing,b.s_date as  activationdate,b.e_date as ExpiryDate
	from PRP_BOUQUE a left outer join @bou_tab b on a.Id=b.bouqueId
	where b.bouqueId is not null)x
	cross apply dbo.[fn_getYMDbtwndates](x.activationdate,x.ExpiryDate)z) y
    
	Update #temp_trans_1 set NCFAmount=0,NCF_LCOSharing=0 from #temp_trans_1 
	where BouqueId in (select top 1 BouqueId from #temp_trans_1 order by rate asc)
	
	declare @opId as bigint          
        
	select @subscriberId=subscriberId from SMS_SUBSCRIBERACCOUNTS where Id=@accountId           
	Select @opId=Case @subop_op when 1 then OperatorId else ParentOperatorId end from sms_view_subscribers where id=@subscriberId        
        
	select a.* into #temp_trans_2 from #temp_trans_1 a        
	left outer join PRP_ACCOUNTTRANSACTION b on a.accountId=b.AccountId and a.activationdate=b.ActivationDate        
	and a.ExpiryDate=b.DeactivationDate and a.BouqueId=b.BouqueId and b.Status=1 
	where b.Id is null             
        
	if(exists(Select * from #temp_trans_2)) 
	Begin 
		if(exists(select * from prp_view_operator_ledger_balance where operatorId=@opId and Balance>=(select SUM(Amt+NCFAmount) from #temp_trans_2)))			 
		Begin              
		insert into PRP_ACCOUNTTRANSACTION(AccountId,BouqueId,Rate,Amount,LCOSharing,NCFAmount,NCF_LCOSharing,Status,ActivationDate,DeactivationDate,CreatedOn,CreatedBy,Remark,SessionFlag,OperatorId)  
		Select accountId,BouqueId,Rate,Amt,0 as LCOSharingAmt,0 as NCFAmount,0 as NCF_LCOSharing,1,activationdate,ExpiryDate,GETDATE(),@UserId,'prp_d_create_both_account',1,@opId from #temp_trans_2 order by BouqueId	
		End         
	Else        
		Begin 
		Select 'NcfAmount: '+@NCFAmount+ ' is added please check your balance.Afer adding NCF balance is less than Total Amount' as msg,'true' as error;
		return        
		End 
	End          

	if(OBJECT_ID('tempdb.dbo.#temp_trans_1') is not null)    
		drop table #temp_trans_1  
	
	if(OBJECT_ID('tempdb.dbo.#temp_trans_2') is not null)    
		drop table #temp_trans_2  
    if(@castypeId=1)       
     Begin
		exec cas_abv_sms_activate_account @accountId,@UserId--,@remark='prp_d_create_both_account'
		update PRP_ACCOUNTTRANSACTION set CASStatus=1 where CASStatus=0 and AccountId=@accountId 
	end

  end Try         
  Begin Catch        
        
  select 'Error in PRP_CREATE_ACC '+cast(ERROR_PROCEDURE() as varchar)+' at  line '+ cast(ERROR_LINE() as varchar)+'         
  <br> ' +ERROR_MESSAGE()  as msg,'true' as error;        
  end Catch        
  End        
  else        
  Begin        
   select 'Prepaid Bouquets cannot be assigned as The Selected Account is Inactive<br>Please Activate the Account first'  as msg,'false' as error;        
  End           
 end          
 else        
 Begin        
  Select @msg='SC STB Pairing Already Alloted to SubscriberId '+dbo.getCustomerId(SubscriberId),@AccountId=0         
  from sms_view_pairing where Id=@pairingId        
 end        
 Select @msg as msg,@AccountId as AccountId, 1 as commandset        
End 
GO
