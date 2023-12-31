USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[d_modify_account]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[d_modify_account] @accountId as bigint,
@actiondate as date,
@remark as varchar(250),
@UserId as bigint,
@StbStatus as int,
@SCStatus as int,
@action as int,
@nid  as bigint,
@doc_ext as varchar(6)=null--@action 1 then PairingId 2 then SmartcardId 3 then StbId
As
Begin					
--Black List Subscribeer
		-- Send Cas Commands --	
		Declare @msg as varchar(8000)		
		--Current Details
			Declare @pairingId as bigint
			Declare @id as bigint
			Declare @ScId as bigint			
			Declare @STbId as bigint
			Declare @OldSCNo as varchar(20)
			Declare @OldSTBNo as varchar(20)
			Declare @Sucess as bit		
			Declare @CASTYPEID as int

			Select @pairingId=Id,@ScId=SmartcardId,@STbId=StbId,@OldSCNo=SmartcardNo,@OldSTBNo=STBNo,@CASTYPEID=CASTYPEID
			from sms_view_pairing	where AccountId=@accountId

			Update PRP_ACCOUNTTRANSACTION set CASStatus=7 where AccountId=@accountId

			if(@CASTYPEID=4)
			begin			
			--Cancel all entitlement on Old Accounts
			exec dbo.cas_catvision_cancell_all_entitlement @accountId,@UserId, null 
			end
			if(@CASTYPEID=5)
			begin
			exec cas_BCAS_cancell_entitlement @accountId,@UserId,7,'d_modify_account'

			Insert into SMS_BCAS_CMDS(SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
			select SmartcardNo,STBNo,SubscriberId,Id as AccountId,'CANCEL_SMARTCARD','0203'+'01'+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo as Command,
			'd_modify_account',GetDate(),GETDATE(),CreatedBy,CASTYPEID from sms_view_SubscriberAccountList where Id=@accountId
			end

			--Unbind Old Smartcard 
			--exec cas_abv_sms_bind_unbind_sc @pairingId,@UserId,0
			
			Select @msg='Digital Connection with SmartcardNo-'+@OldSCNo+' and STBNo-'+@OldSTBNo+' Modified Sucessfully '
		
					
		If @action=1
			Begin				
			if exists(Select Id from sms_view_pairing_stock where Id=@nid)
				Begin
							 
				update SMS_SUBSCRIBERACCOUNTS set PairingId=@nid,UpdatedBy=@UserId,UpdatedOn=GETDATE(),Remark=@remark where Id=@accountId
				
				update SMS_PAIRING set Status=1,updatedBy=@UserId,UpdatedOn=GetDate(),Remark='Pairing Replaced' where Id=@pairingId

				Select @CASTYPEID=CASTYPEID	from sms_view_pairing where AccountId=@accountId
				
				Update PRP_ACCOUNTTRANSACTION set CASStatus=0 where AccountId=@accountId
															
				if(@CASTYPEID=5)--BCAS
				begin
				exec cas_BCAS_sms_activate_account @accountId,@UserId,'d_modify_Replace_pairing'
				End
				
				exec [prp_activate_prepaid] @accountId,@UserId,'d_modify_Replace_pairing'


				Select @msg=@msg+' <br>SC STB Pairing Replaced with New Smartcard-'+SmartcardNo+' and STB-'+Stbno+' Pairing ' ,@Sucess=1
				from sms_view_pairing where AccountId=@accountId
			end
			else
				Begin
					Select @msg='SmartCard-'+SmartcardNo+' and STB-'+STBNo+' Pairing Already Alloted to SubscriberId '+dbo.getCustomerId(SubscriberId),@Sucess=0 
					from sms_view_pairing where Id=@nid
				end			
			End
			
			else If @action=2
			Begin							 
				
			if exists(Select Id from sms_view_smartcard_stock where Id=@nid)
				Begin	
				
				 
				Update SMS_PAIRING set SmartCardId=@nid,UpdatedBy=@UserId,UpdatedOn=GETDATE(),Remark=@remark where Id=@pairingId
											
				--Activate New Smartcard with Products
				Update PRP_ACCOUNTTRANSACTION set CASStatus=0 where AccountId=@accountId
										 
				if(@CASTYPEID=5)--BCAS
				begin
				exec cas_BCAS_sms_activate_account @accountId,@UserId,'d_modify_Replace_SMC'
				End
				
				exec [prp_activate_prepaid] @accountId,@UserId,'d_modify_Replace_SMC'								
				
				
				Select 'Account Refereshed' as msg,1 as result,@ScId as lastScId,@STbId as lastStbId
				 
				 Select @msg=@msg+' <br>SmartCard Replaced with New Smartcard-'+SmartcardNo,@Sucess=1 from sms_view_pairing where AccountId=@accountId
				 end
			else
				Begin
					Select @msg='SmartCardNo-'+SmartcardNo+' Already Paired with '+STBNo+' '+Case AccountId when 0 then '' else ' and Alloted to SubscriberId '+dbo.getCustomerId(SubscriberId) end
					,@Sucess=0 from sms_view_pairing where SmartCardId=@nid
				end	
		End
		
		else If @action=3
			begin	
			if exists(Select Id from sms_view_stb_stock where Id=@nid)
				Begin						 
				 Update SMS_PAIRING set STBid=@nid,UpdatedBy=@UserId,UpdatedOn=GETDATE(),Remark=@remark where Id=@pairingId								
				
				--Activate New Smartcard with Products
				Update PRP_ACCOUNTTRANSACTION set CASStatus=0 where AccountId=@accountId
				
				if(@CASTYPEID=5)--BCAS
				begin
				exec cas_BCAS_sms_activate_account @accountId,@UserId,'d_modify_Replace_STB'
				End
				exec [prp_activate_prepaid] @accountId,@UserId,'d_modify_Replace_STB'				
				 
				 Select @msg=@msg+' <br>STB Replaced with New STBNo-'+STBNo,@Sucess=1  from sms_view_pairing where AccountId=@accountId
				 End
			else
				Begin
					Select @msg='STBNo-'+STBNo+' Already Paired with '+SmartcardNo+' '+Case AccountId when 0 then '' else ' and Alloted to SubscriberId '+dbo.getCustomerId(SubscriberId) end
					,@Sucess=0 from sms_view_pairing where StbId=@nid
				end	
		End				
			

			
			
		if(@Sucess=1)
		Begin
		if @StbStatus>0 or @SCStatus>0
		Begin			
			
			update SMS_SMARTCARDS set Status=@SCStatus,DocExtension=isnull(@doc_ext,DocExtension),UpdatedBy=@UserId,UpdatedOn=GETDATE(),Remark='AccountModified' where Id=@ScId and @SCStatus>0
			
			update SMS_STBS set Status=@StbStatus,UpdatedBy=@UserId,UpdatedOn=GETDATE(),Remark='AccountModified' where Id=@STbId and @StbStatus>0
			
			if @action=1
			begin
				update SMS_PAIRING set Deleted=1,UpdatedBy=@UserId,UpdatedOn=GETDATE(),Remark='AccountModified' where Id=@pairingId
			end--Select @NSCNo=SmartcardNo,@NSTBNo=STBNo	from sms_view_pairing where AccountId=@accountId

			if(@SCStatus>0)
			begin
			Select @msg=@msg+' <br>Smartcard-'+@OldSCNo+Case @SCStatus when 4 then ' is marked Blacklisted ' when 3 then ' is marked Faulty ' 
			else ' Is Send Back to Under QC ' end 
			end
			if(@StbStatus>0)
			begin
			Select @msg=@msg+' <br>STB-'+@OldSTBNo+Case @StbStatus when 4 then ' is marked Blacklisted ' when 3 then ' is marked Faulty ' 
			else ' Is Send Back to Under QC ' end 			
			end		
		end	
		end
		
		Select @msg as msg,isnull(@Sucess,0) as result,@ScId as lastScId
	
End
GO
