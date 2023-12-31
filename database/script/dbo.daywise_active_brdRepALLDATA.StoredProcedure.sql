USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[daywise_active_brdRepALLDATA]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[daywise_active_brdRepALLDATA] @AsOnDate date,@OperatorId as bigint=0
as       
Begin    
	Declare @close_day as date
	Select @close_day=(DateAdd(d,1,@AsOnDate))

	---------------------------------Historical Subscriber,Operator,Branch Monthwise----------------------------------    
	select x.* into #accAll from (select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,FID as AccountId,PairingId,SubscriberId    
	from SMS_SUBSCRIBERACCOUNTS_HISTORY where InsertedOn<@close_day)x where x.RId=1
 
	select x.* into #pairAll from (select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,FID as PairingId,SmartCardId,StbId     
	from SMS_PAIRING_HISTORY where InsertedOn<@close_day)x where x.RId=1
	
	select x.* into #smcAll from (select ROW_NUMBER()over(Partition by SmartcardId order by InsertedOn desc,Id desc) as RID,SmartcardId as FID,SmartcardNo,BrandId   
	from SMS_SMARTCARDS_HISTORY where InsertedOn<@close_day)x where x.RId=1
 
	select x.*,b.CASNAME into #smcbrandAll from (select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,FID,CASTYPEID,BrandTitle
	from SMS_STBSCBRAND_HISTORY where InsertedOn<@close_day) x left join SMS_CAS_TABLE b on x.CASTYPEID=b.ID where x.RId=1     
 
	select x.* into #stbAll from (select ROW_NUMBER()over(Partition by StbId order by InsertedOn desc,Id desc) as RID,StbId as FID,STBNo,BrandId  
	from SMS_STBS_HISTORY where InsertedOn<@close_day)x where x.RId=1     
 
	select x.* into #subAll from (select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,FID as SubscriberId,CustomerId,OperatorId    
	from SMS_SUBSCRIBERS_HISTORY where InsertedOn<@close_day)x where x.RId=1     
 
	select x.* into #operAll from (select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,FID,NAME as OPERNAME,CODE as OPERCODE,ParentId,branch as BranchId 
	from SMS_OPERATOR_HISTORY where InsertedOn<@close_day)x where x.RId=1

	select x.* into #branchAll from (select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,FID,Name    
	from SMS_BRANCH_HISTORY where InsertedOn<@close_day)x where x.RId=1     
 
	select a.AccountId,c.SmartcardNo,d.STBNo,e.CustomerId,g.Name as BranchName,f.OPERCODE,h.CASNAME,h.CASTYPEID,g.FID as BranchId,h.BrandTitle,
	f.FID as OperatorId into #SMS_SEARCHMONTH_HIST_SUBSC_DATA from #accAll a     
	left join #pairAll b on a.PairingId=b.PairingId
	left join #smcAll c on b.SmartCardId=c.FID
	left join #stball d on b.StbId=d.FID
	left join #subAll e on a.SubscriberId=e.SubscriberId
	left join #operAll f on e.OperatorId=f.FID
	left join #branchAll g on f.BranchId=g.FID
	left join #smcbrandAll h on d.BrandId=h.FID
 
	---------------------------------Historical Package Channel---------------------------------- 
	select x.* into #temp_brd_channel from (select ROW_NUMBER()over(PARTITION BY FID order by InsertedOn desc,Id desc) as RID,* from SMS_CHANNEL_HISTORY a     
	where InsertedOn<@close_day)x where x.RID=1 and x.DMLAction!=4

	select x.* into #tempchannelinpack from (select ROW_NUMBER()OVER(PARTITION BY FID order by InsertedOn desc,Id desc) as RID,* from SMS_CHANNELINPACKAGE_HISTORY     
	where InsertedOn<@close_day)x where x.RID=1 and x.DMLAction not in (3,4) 
 
	select x.* into #packhist from (select ROW_NUMBER()OVER(PARTITION BY FID order by InsertedOn desc,Id desc) as RID,* from SMS_PACKAGE_HISTORY    
	where InsertedOn<@close_day)x where x.RID=1 and x.DMLAction not in (3,4)
 
	select a.*,b.ChannelName,b.BroadcasterId,b.ChannelType,b.IsAlacarte into #temp_channel_pack
	from #tempchannelinpack a
	left outer join #temp_brd_channel b on a.ChannelId=b.FID
	where b.FID is not null and a.PackageId in (Select Id from #packhist where Status=1)
 
	----------------------------------Month End Count----------------------------------    
	select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,* into #t_digital_cl 
	from SMS_SUBSCRIBERACCOUNTS_HISTORY where InsertedOn<cast(@close_day as date)

	----------------------PRP Subscriber Count Closing-----------------------
	select * into #t_pack_cl_prp_1 from (select ROW_NUMBER()over(Partition by FID,AccountId,BouqueId,ActivationDate order by Insertedon desc,id desc) as RID,Id,
	Id as HistoryTransId,AccountId,BouqueId,ActivationDate,DeactivationDate,Deleted,DMLAction,'PrePaid' as ConnectionType,Insertedon from PRP_ACCOUNTTRANSACTION_HISTORY
	where AccountId in (select FID from #t_digital_cl where RID=1 and Status=1 and Deleted=0 and DMLAction!=4) and cast(InsertedOn as date)<cast(@close_day as date) 
	and ActivationDate<cast(@close_day as date) and DeactivationDate>=cast(@AsOnDate as Date))x where RID=1

	select a.Id,a.AccountId,a.Deleted,a.DMLAction,b.PackageId,b.ChannelId,a.ConnectionType,HistoryTransId,Insertedon,a.ActivationDate,a.DeactivationDate 
	into #t_pack_cl_prp from #t_pack_cl_prp_1 a left join PRP_BOUQUE_ASSETS b on a.BouqueId=b.BouqueId

	select a.Id,a.AccountId,a.PackageId,c.PackageName as ProductName,c.CasCode as ProductId,0 as isAlacarte,b.CustomerId,b.SmartcardNo,b.STBNo,a.ActivationDate,a.DeactivationDate,
	a.ConnectionType,a.HistoryTransId,a.Insertedon,b.OperatorId,b.OPERCODE,b.BrandTitle,b.CASTYPEID
	into #temp_closing_package_cnts_prp_1
	from #t_pack_cl_prp a     
	left join #SMS_SEARCHMONTH_HIST_SUBSC_DATA b on a.AccountId=b.AccountId    
	left join #packhist c on a.PackageId=c.fid
	where a.Deleted=0 and a.DMLAction!=4 and a.PackageId is not null

	select Id,AccountId,PackageId,ProductName,ProductId,isAlacarte,CustomerId,SmartcardNo,STBNo,ActivationDate,DeactivationDate,ConnectionType,HistoryTransId,Insertedon, 
	OperatorId,OPERCODE,BrandTitle,CASTYPEID into #temp_closing_package_cnts_prp from
	(select ROW_NUMBER()OVER(Partition by SmartcardNo,packageid order by ActivationDate desc) as Rid,* from #temp_closing_package_cnts_prp_1)x where x.Rid=1
	
	select a.Id,a.AccountId,a.ChannelId,c.ChannelName as ProductName,c.CasCode as ProductId,1 as isAlacarte,b.CustomerId,b.SmartcardNo,b.STBNo,a.ActivationDate,a.DeactivationDate,
	a.ConnectionType,a.HistoryTransId,a.Insertedon,b.OperatorId,b.OPERCODE,b.BrandTitle,b.CASTYPEID
	into #temp_closing_alacarte_cnts_prp_1
	from #t_pack_cl_prp a     
	left join #SMS_SEARCHMONTH_HIST_SUBSC_DATA b on a.AccountId=b.AccountId    
	left join #temp_brd_channel c on a.ChannelId=c.FID
	where a.Deleted=0 and a.DMLAction!=4 and a.ChannelId is not null

	select Id,AccountId,ChannelId,ProductName,ProductId,isAlacarte,CustomerId,SmartcardNo,STBNo,ActivationDate,DeactivationDate,ConnectionType,HistoryTransId,Insertedon, 
	OperatorId,OPERCODE,BrandTitle,CASTYPEID into #temp_closing_alacarte_cnts_prp from
	(select ROW_NUMBER()OVER(Partition by SmartcardNo,ChannelId order by ActivationDate desc) as Rid,* from #temp_closing_alacarte_cnts_prp_1)x where x.Rid=1

	select * into #finalData from (    
	select * from #temp_closing_package_cnts_prp
	union     
	select * from #temp_closing_alacarte_cnts_prp
	)a    
 
	If(@OperatorId=0)
		Begin
			Select x.Id,x.AccountId,x.ProductName,ProductId,CASE WHEN x.IsAlacarte=0 THEN 'Package' ELSE 'Alacarte' END as IsAlacarte,x.CustomerId,x.SmartcardNo,x.STBNo,
			x.OPERCODE,x.ActivationDate,x.DeactivationDate,case when x.CASTYPEID=1 then 'ABV' else 'ABV' end as CASTYPE,
			x.BrandTitle from (select * from #finalData)x
		End
	else 
		Begin
			Select x.Id,x.AccountId,x.ProductName,x.ProductId,CASE WHEN x.IsAlacarte=0 THEN 'Package' ELSE 'Alacarte' END as IsAlacarte,x.CustomerId,x.SmartcardNo,x.STBNo,
			x.OPERCODE,x.ActivationDate,x.DeactivationDate ,case when x.CASTYPEID=1 then 'ABV' else 'ABV' end as CASTYPE,
			x.BrandTitle from (select * from #finalData where OperatorId=@OperatorId)x
		End 
End
GO
