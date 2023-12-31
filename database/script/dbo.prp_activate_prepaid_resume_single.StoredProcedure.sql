USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[prp_activate_prepaid_resume_single]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[prp_activate_prepaid_resume_single] @accountId as bigint,@UserId as Bigint,@remark as varchar(50)='AccountRefreshed'
As
Begin
	if(OBJECT_ID('tempdb.dbo.#temp_bouq') is not null)    
		drop table #temp_bouq 
	if(OBJECT_ID('tempdb.dbo.#t_assets') is not null)    
		drop table #t_assets  
	if(OBJECT_ID('tempdb.dbo.#temp_trans') is not null)    
		drop table #temp_trans
	
select AccountId,BouqueId,ActivationDate as ActivationDate,DeactivationDate as DeactivationDate into #temp_bouq 
from PRP_ACCOUNTTRANSACTION where AccountId=@accountId 
and CASStatus=0 and Status=1 and DeactivationDate>cast(GETDATE() as date) 

	if(@remark='d_refresh_entitlement')
	begin 
		Delete from #temp_bouq

		insert into #temp_bouq (AccountId,BouqueId,ActivationDate,DeactivationDate)
		select a.AccountId,a.BouqueId,a.ActivationDate as ActivationDate,a.DeactivationDate as DeactivationDate
		from (select ROW_NUMBER()OVER(PARTITION BY BouqueId order by DeactivationDate desc) as Rid,* from PRP_ACCOUNTTRANSACTION where AccountId=@accountId)a where 
		a.AccountId=@accountId and a.CASStatus=0 and a.Status=1 and a.DeactivationDate>cast(GETDATE() as date) and a.Rid=1
	end

	select * into #t_assets from prp_view_Bou_pack_channel_cascode a where a.BouqueId in (Select BouqueId from #temp_bouq)

	begin try
	select a.AccountId,cast(GETDATE() as date) as ActivationDate,a.DeactivationDate,b.* into #temp_trans from #temp_bouq a left outer join #t_assets b on a.BouqueId=b.BouqueId

	declare @castypeId as bigint
	Select @castypeId=CASTYPEID from sms_view_accounts_pairings where Id=@accountId
	
	if(@castypeId=1)
	begin 
		begin try
			insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,Command,Status,Attempts,Command_Param,ActivationDate,
			DeactivationDate,PackageIds,AlacarteIds,Remark,CommandDate,SendedOn,CreatedOn,CreatedBy,FLAG,MSG_MAP_ID,Status_msg,CASTYPE)
			Select  b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,b.Id as AccountId,9 as CommandId,'GOSPELENTUPD' as CommandName,
			dbo.cas_abv_formatcmd(dbo.[cas_Gospel_UpdateEntitlement_multi](b.SmartcardNo,1,'0101'+right(dbo.[fn_varbintostr](c.CasCodeGospel),4)+
			dbo.fn_getUTCHexdateTime(c.ActivationDate)+dbo.fn_getUTCHexdateTime(c.DeactivationDate)+dbo.fn_varbintostr_(LEN(dbo.fn_stringtohexStr('ENTL FROM SMS'))/2,2)
			+dbo.fn_stringtohexStr('ENTL FROM SMS'))) as Command ,0 as Status,0 as Attempts,@remark as CommandParam,c.ActivationDate,c.DeactivationDate,
			case c.IsAlacarte when 0 then cast(c.ProductId as varchar) else '0' end as PackageIds,
			case c.IsAlacarte when 1 then cast(c.ProductId as varchar) else '0' end as ChannelIds,@remark as Remark,GETDATE() as CommandDate,
			GETDATE() as SendedOn,GETDATE() as CreatedOn,@UserId as CreatedBy,0 as FLAG,0 as MSG_MAP_ID,0 as Status_msg,@castypeId as CASTYPE
			from sms_view_SubscriberAccountList b left outer join #temp_trans c on c.AccountId=b.Id
			where b.id=@accountId and c.AccountId is not null
			
			update PRP_ACCOUNTTRANSACTION set CASStatus=1 where CASStatus=0 and AccountId=@accountId  
		end try
		begin catch
			print 'error'
		end catch
	end	
	else if(@castypeId=3)
	begin 
		begin try
			insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,Command,Status,Attempts,Command_Param,ActivationDate,
			DeactivationDate,PackageIds,AlacarteIds,Remark,CommandDate,SendedOn,CreatedOn,CreatedBy,FLAG,MSG_MAP_ID,Status_msg,CASTYPE)
			Select  b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,b.Id as AccountId,9 as CommandId,'GOSPELENTUPD' as CommandName,
			dbo.cas_abv_formatcmd(dbo.[cas_Gospel_UpdateEntitlement_multi](b.SmartcardNo,1,'0101'+right(dbo.[fn_varbintostr](c.CasCodeGospel),4)+
			dbo.fn_getUTCHexdateTime(c.ActivationDate)+dbo.fn_getUTCHexdateTime(c.DeactivationDate)+dbo.fn_varbintostr_(LEN(dbo.fn_stringtohexStr('ENTL FROM SMS'))/2,2)
			+dbo.fn_stringtohexStr('ENTL FROM SMS'))) as Command ,0 as Status,0 as Attempts,@remark as CommandParam,c.ActivationDate,c.DeactivationDate,
			case c.IsAlacarte when 0 then cast(c.ProductId as varchar) else '0' end as PackageIds,
			case c.IsAlacarte when 1 then cast(c.ProductId as varchar) else '0' end as ChannelIds,@remark as Remark,GETDATE() as CommandDate,
			GETDATE() as SendedOn,GETDATE() as CreatedOn,@UserId as CreatedBy,0 as FLAG,0 as MSG_MAP_ID,0 as Status_msg,@castypeId as CASTYPE
			from sms_view_SubscriberAccountList b left outer join #temp_trans c on c.AccountId=b.Id
			where b.id=@accountId and c.AccountId is not null
			
			update PRP_ACCOUNTTRANSACTION set CASStatus=1 where CASStatus=0 and AccountId=@accountId  
		end try
		begin catch
			print 'error'
		end catch
	end	 
	else if(@castypeId=6)
	Begin
		begin try	
			Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,CreatedOn,CreatedBy,
			ActivationDate,DeactivationDate,PackageIds,AlacarteIds,CASTYPE,LinkIds,LinkCount)  
			select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,b.Id,'SMS_CA_ENTITLE_REQUEST',9,'',@remark,GETDATE(),GETDATE(),@UserId,
			cast(GETDATE() as date),c.DeactivationDate,case c.IsAlacarte when 0 then cast(c.ProductId as varchar) else '0' end as PackageIds,
			case c.IsAlacarte when 1 then cast(c.ProductId as varchar) else '0' end as ChannelIds,@castypeId,c.CasCodeNSTV,1 
			from sms_view_SubscriberAccountList b left outer join #temp_trans c on b.id=c.AccountId where b.SubscriberId is not null and c.AccountId is not null
			
			update PRP_ACCOUNTTRANSACTION set CASStatus=1 where CASStatus=0 and AccountId=@accountId 
		end try
		begin catch
			print 'error'
		end catch
	End	
	else if(@castypeId=0)
	Begin
		begin try	
			--Commpand Param (0):PO TYpe 0-To order, 1-To cancel order
			--Command Param (1): CUID CAS Code of Product
			insert into TELELYNX_CAS_CMDS (CommandName,Command,SmartCardNo,STBNo,AccountId,SubscriberId,Command_Param,ActivationDate,DeactivationDate,
			PackageIds,AlacarteIds,LinkIds,LinkCount,CreatedOn,CreatedBy,Remark)
			select 'SendCardCUOrder','ADD_ENTITLEMENT',b.SmartcardNo,b.STBNo,b.Id,b.SubscriberId,'0,'+c.CasCodeTelelynx,
			convert(varchar(19),cast(c.ActivationDate as datetime),120),convert(varchar(19),DATEADD(d,0,cast(c.DeactivationDate as datetime)),120),
			case when c.IsAlacarte=0 then c.ProductId else 0 end,case when c.IsAlacarte=1 then c.ProductId else 0 end,c.CascodeTelelynx,1,GETDATE(),@UserId,@remark
			from sms_view_SubscriberAccountList b left outer join #temp_trans c on b.id=c.AccountId where b.SubscriberId is not null and c.AccountId is not null

			update PRP_ACCOUNTTRANSACTION set CASStatus=1 where CASStatus=0 and AccountId=@accountId 
		end try
		begin catch
			print 'error'
		end catch
	End	
	
	else if(@castypeId=4)
	Begin
		begin try	
		insert into SMS_CATVISION_CMDS (SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,
		Status,Command_Param,Remark,CommandDate,CreatedOn,CreatedBy,Command,ActivationDate,DeactivationDate,PackageIds,AlacarteIds)
		select b.SmartcardNo as SmartCardNo,b.SmartCardId as SmartCardId,b.STBNo as STBNo,StbId as StbId,b.SubscriberId,b.Id as AccountId,
		'101' as CommandId,
		'Subscriber_entitle_request' as CommandName,
		0 as Status,'101' as Command_Param,'Subscriber_entitle_request' as Remark,getdate() as CommandDate,getdate() as CreatedOn,@UserId as CreatedBy,
		SmartcardNo,getdate() as ActivationDate,c.DeactivationDate as DeactivationDate,c.CasCodeCatVision as PackageIds,0 AS AlacarteIds
		from sms_view_SubscriberAccountList b left outer join #temp_trans c on b.id=c.AccountId where b.SubscriberId is not null and c.AccountId is not null
		

			update PRP_ACCOUNTTRANSACTION set CASStatus=1 where CASStatus=0 and AccountId=@accountId 
		end try
		begin catch
			print 'error'
		end catch
	End	
	 

	if(OBJECT_ID('tempdb.dbo.#temp_bouq') is not null)    
		drop table #temp_bouq
	if(OBJECT_ID('tempdb.dbo.#t_assets') is not null)    
		drop table #t_assets  
	if(OBJECT_ID('tempdb.dbo.#temp_trans') is not null)    
		drop table #temp_trans
	End Try 
	Begin Catch
	select 'Error in '+cast(ERROR_PROCEDURE() as varchar)+' at  line '+ cast(ERROR_LINE() as varchar)+' <br> ' +ERROR_MESSAGE()  as msg,'true' as error;
	End Catch
End

GO
