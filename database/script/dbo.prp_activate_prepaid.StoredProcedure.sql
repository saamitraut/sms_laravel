USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[prp_activate_prepaid]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[prp_activate_prepaid] @accountId as bigint,@UserId as Bigint,@remark as varchar(50)='AccountRefreshed'
As
Begin
	if(OBJECT_ID('tempdb.dbo.#temp_bouq') is not null)    
		drop table #temp_bouq 
	if(OBJECT_ID('tempdb.dbo.#t_assets') is not null)    
		drop table #t_assets  
	if(OBJECT_ID('tempdb.dbo.#temp_trans') is not null)    
		drop table #temp_trans

	Declare @bouquetlist as varchar(8000)
	Declare @bouquetCount as int
	Declare @sessionflag as bigint
	Select @sessionflag=MAX(SessionFlag) from PRP_ACCOUNTTRANSACTION where AccountId=@accountId and CASStatus=0 and Status=1 and DeactivationDate>cast(GETDATE() as date) 

	select AccountId,BouqueId,ActivationDate as ActivationDate,DeactivationDate as DeactivationDate into #temp_bouq from PRP_ACCOUNTTRANSACTION where AccountId=@accountId 
	and CASStatus=0 and Status=1 
	and DeactivationDate>cast(GETDATE() as date) and SessionFlag=@sessionflag

	if(@remark='d_refresh_entitlement')
	begin 
		Delete from #temp_bouq

		insert into #temp_bouq (AccountId,BouqueId,ActivationDate,DeactivationDate)
		select a.AccountId,a.BouqueId,a.ActivationDate,a.DeactivationDate as DeactivationDate
		from (select ROW_NUMBER()OVER(PARTITION BY BouqueId order by DeactivationDate desc) as Rid,* from PRP_ACCOUNTTRANSACTION where AccountId=@accountId)a where 
		a.AccountId=@accountId and a.CASStatus=0 and a.Status=1 and a.DeactivationDate>=cast(GETDATE() as date) and a.Rid=1
	end

	select * into #t_assets from prp_view_Bou_pack_channel_cascode a where a.BouqueId in (Select BouqueId from #temp_bouq)

	begin try
	select a.AccountId,cast(GETDATE() as date) as ActivationDate,a.DeactivationDate,b.* into #temp_trans from #temp_bouq a left outer join #t_assets b on a.BouqueId=b.BouqueId

	declare @castypeId as bigint
	Select @castypeId=CASTYPEID from sms_view_accounts_pairings where Id=@accountId
	if(@castypeId=4) --catvision
	Begin
		begin try	
		insert into SMS_CATVISION_CMDS (SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandId,CommandName,
		Status,Command_Param,Remark,CommandDate,CreatedOn,CreatedBy,Command,ActivationDate,DeactivationDate,PackageIds,AlacarteIds)
		select b.SmartcardNo as SmartCardNo,b.SmartCardId as SmartCardId,b.STBNo as STBNo,StbId as StbId,b.SubscriberId,b.Id as AccountId,
		'101' as CommandId,
		'Subscriber_entitle_request' as CommandName,
		0 as Status,'101' as Command_Param,'Subscriber_entitle_request' as Remark,getdate() as CommandDate,getdate() as CreatedOn,@UserId as CreatedBy,
		SmartcardNo,getdate() as ActivationDate,c.DeactivationDate as DeactivationDate,
		case when IsAlacarte=0 then c.CasCodeCatVision else 0 end as PackageIds,
		case when IsAlacarte=1 then c.CasCodeCatVision else  0 end AS AlacarteIds
		from sms_view_SubscriberAccountList b left outer join #temp_trans c on b.id=c.AccountId where b.SubscriberId is not null and c.AccountId is not null
		

			update PRP_ACCOUNTTRANSACTION set CASStatus=1 where CASStatus=0 and AccountId=@accountId 
		end try
		begin catch
			print 'error'
		end catch
	End	
	if(@castypeId=5) --BCAS
	Begin
	begin try	

	Select @bouquetCount=count(*)+1 from #temp_trans

	Select @bouquetlist=''
	select @bouquetlist=@bouquetlist+'100021'+dbo.fn_varbintostr_(CasCodeBCAS,4)+'0'+REPLACE(REPLACE(REPLACE(convert(varchar(19),Getdate(),120), '-', ''), ':', ''),' ','')+REPLACE(c.DeactivationDate, '-', '')+'235959'
	from #temp_trans c

	select @bouquetlist as BouquetCmd,
	(select distinct (cast(substring   
                          ((SELECT     (',' + cast(CasCodeBCAS as varchar))  
                              FROM         #temp_trans t2  
                              WHERE     t2.AccountId = a.AccountId  and t2.IsAlacarte=0
                              ORDER BY CasCodeBCAS FOR XML PATH('')),2,8000) as varchar(8000))  ) from #temp_trans a where IsAlacarte=0) as PackageIds,
	(select distinct (cast(substring   
                          ((SELECT     (',' + cast(CasCodeBCAS as varchar))  
                              FROM         #temp_trans t2  
                              WHERE     t2.AccountId = a.AccountId  and t2.IsAlacarte=1
                              ORDER BY CasCodeBCAS FOR XML PATH('')),2,8000) as varchar(8000))  ) from #temp_trans a where IsAlacarte=1) as AlacarteIds,
	CAST(getdate() as date) as ActivationDate,(select max(DeactivationDate) from #temp_trans) as DeactivationDate into #temp_cmd
	
	if(@remark='d_refresh_entitlement')
	begin 
	insert into SMS_BCAS_CMDS (SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Status, Remark, CommandDate, CreatedOn, CreatedBy, Command, ActivationDate,DeactivationDate, PackageIds, AlacarteIds, CASTYPE)
	select b.SmartcardNo as SmartCardNo,b.STBNo as STBNo,b.SubscriberId,b.Id as AccountId,'REFRESH_SMARTCARD' as CommandName,
	0 as Status,@remark as Remark, getdate() as CommandDate, getdate() as CreatedOn,@UserId as CreatedBy,
	'0204'+dbo.fn_varbintostr_(@bouquetCount,2)+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo+BouquetCmd as Command, c.ActivationDate,c.DeactivationDate as DeactivationDate,PackageIds,AlacarteIds,b.CASTYPEID	
	from sms_view_SubscriberAccountList b,#temp_cmd c where b.SubscriberId is not null and b.ID=@accountId
	end
	else
	begin
	insert into SMS_BCAS_CMDS (SmartCardNo, STBNo, SubscriberId, AccountId, CommandName, Status, Remark, CommandDate, CreatedOn, CreatedBy, Command, ActivationDate,DeactivationDate, PackageIds, AlacarteIds, CASTYPE)
	select b.SmartcardNo as SmartCardNo,b.STBNo as STBNo,b.SubscriberId,b.Id as AccountId,'ADD_ENTITLEMENT' as CommandName,
	0 as Status,@remark as Remark, getdate() as CommandDate, getdate() as CreatedOn,@UserId as CreatedBy,
	'020D'+dbo.fn_varbintostr_(@bouquetCount,2)+'07'+dbo.fn_varbintostr_(Len(SmartcardNo),4)+SmartcardNo+BouquetCmd as Command, c.ActivationDate,c.DeactivationDate as DeactivationDate,PackageIds,AlacarteIds,b.CASTYPEID	
	from sms_view_SubscriberAccountList b,#temp_cmd c where b.SubscriberId is not null and b.ID=@accountId
	end
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
