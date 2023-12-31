USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[sms_brd_gen_brd_report]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sms_brd_gen_brd_report] @repMonthYear as Date,@BroadcasterId as bigint
as
	Begin
	Declare @repMonth as date
	Select @repMonth=dbo.[getFirstDate](@repMonthYear)

	Declare @close_month as date
	Select @close_month=dbo.[getFirstDate](DateAdd(m,1,@repMonth))

	delete from SMS_BROADCASTER_REPORT where BroadcasterId=@BroadcasterId and repMonth=@repMonth

	select x.* into #accAll from (select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,FID as AccountId,PairingId,SubscriberId    
	from SMS_SUBSCRIBERACCOUNTS_HISTORY where InsertedOn<@close_month)x where x.RId=1
 
	select x.* into #pairAll from (select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,FID as PairingId,SmartCardId,StbId     
	from SMS_PAIRING_HISTORY where InsertedOn<@close_month)x where x.RId=1
	
	select x.* into #smcAll from (select ROW_NUMBER()over(Partition by SmartcardId order by InsertedOn desc,Id desc) as RID,SmartcardId as FID,SmartcardNo,BrandId   
	from SMS_SMARTCARDS_HISTORY where InsertedOn<@close_month)x where x.RId=1
 
	select x.*,b.CASNAME into #smcbrandAll from (select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,FID,CASTYPEID,BrandTitle
	from SMS_STBSCBRAND_HISTORY where InsertedOn<@close_month) x left join SMS_CAS_TABLE b on x.CASTYPEID=b.ID where x.RId=1     
 
	select x.* into #stbAll from (select ROW_NUMBER()over(Partition by StbId order by InsertedOn desc,Id desc) as RID,StbId as FID,STBNo,BrandId  
	from SMS_STBS_HISTORY where InsertedOn<@close_month)x where x.RId=1     
 
	select x.* into #subAll from (select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,FID as SubscriberId,CustomerId,OperatorId    
	from SMS_SUBSCRIBERS_HISTORY where InsertedOn<@close_month)x where x.RId=1     
 
	select x.* into #operAll from (select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,FID,NAME as OPERNAME,CODE as OPERCODE,ParentId,branch as BranchId 
	from SMS_OPERATOR_HISTORY where InsertedOn<@close_month)x where x.RId=1

	select x.* into #branchAll from (select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,FID,Name    
	from SMS_BRANCH_HISTORY where InsertedOn<@close_month)x where x.RId=1     
 
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
	where InsertedOn<@close_month)x where x.RID=1 and x.DMLAction!=4 and BroadcasterId=@BroadcasterId

	select x.* into #tempchannelinpack from (select ROW_NUMBER()OVER(PARTITION BY FID order by InsertedOn desc,Id desc) as RID,* from SMS_CHANNELINPACKAGE_HISTORY     
	where InsertedOn<@close_month)x where x.RID=1 and x.DMLAction not in (3,4) 

	select x.* into #packhist from (select ROW_NUMBER()OVER(PARTITION BY FID order by InsertedOn desc,Id desc) as RID,* from SMS_PACKAGE_HISTORY    
	where InsertedOn<@close_month)x where x.RID=1 and x.DMLAction not in (3,4)
 
	select a.*,b.ChannelName,b.BroadcasterId,b.ChannelType,b.IsAlacarte into #temp_channel_pack
	from #tempchannelinpack a
	left outer join #temp_brd_channel b on a.ChannelId=b.FID
	where b.FID is not null and a.PackageId in (Select FID from #packhist where Status=1)

	----------------------------------closing------------------------------------------------
	select ROW_NUMBER()over(Partition by FID order by InsertedOn desc,Id desc) as RID,* into #t_digital_cl 
	from SMS_SUBSCRIBERACCOUNTS_HISTORY where InsertedOn<cast(@close_month as date)

	----------------------PRP Subscriber Count Closing-----------------------
	select * into #t_pack_cl_prp_1 from (select ROW_NUMBER()over(Partition by FID,AccountId,BouqueId,ActivationDate order by Insertedon desc,id desc) as RID,Id,
	Id as HistoryTransId,AccountId,BouqueId,ActivationDate,DeactivationDate,Deleted,DMLAction,'PrePaid' as ConnectionType,Insertedon from PRP_ACCOUNTTRANSACTION_HISTORY
	where AccountId in (select FID from #t_digital_cl where RID=1 and Status=1 and Deleted=0 and DMLAction!=4) and cast(InsertedOn as date)<cast(@close_month as date) 
	and ActivationDate<cast(@close_month as date) and DeactivationDate>cast(DATEADD(d,-2,@close_month)as Date))x where RID=1

	select a.Id,a.AccountId,a.Deleted,a.DMLAction,b.PackageId,b.ChannelId,a.ConnectionType,HistoryTransId,Insertedon,a.ActivationDate,a.DeactivationDate 
	into #t_pack_cl_prp from #t_pack_cl_prp_1 a left join PRP_BOUQUE_ASSETS b on a.BouqueId=b.BouqueId

	select a.Id,a.AccountId,a.PackageId,c.PackageName as ProductName,0 as isAlacarte,a.ActivationDate,a.DeactivationDate,b.SmartcardNo,
	a.ConnectionType,a.HistoryTransId,a.Insertedon into #temp_closing_package_cnts_prp_1
	from #t_pack_cl_prp a   
	left join #SMS_SEARCHMONTH_HIST_SUBSC_DATA b on a.AccountId=b.AccountId
	left join #packhist c on a.PackageId=c.FID
	where a.Deleted=0 and a.DMLAction!=4 and a.PackageId is not null

	select Id,AccountId,PackageId,ProductName,isAlacarte,ActivationDate,DeactivationDate,ConnectionType,HistoryTransId,Insertedon into #temp_closing_package_cnts_prp from
	(select ROW_NUMBER()OVER(Partition by SmartcardNo,packageid order by ActivationDate desc) as Rid,* from #temp_closing_package_cnts_prp_1)x where x.Rid=1
	
	select a.Id,a.AccountId,a.ChannelId,c.ChannelName as ProductName,1 as isAlacarte,a.ActivationDate,a.DeactivationDate,b.SmartcardNo,
	a.ConnectionType,a.HistoryTransId,a.Insertedon into #temp_closing_alacarte_cnts_prp_1
	from #t_pack_cl_prp a 
	left join #SMS_SEARCHMONTH_HIST_SUBSC_DATA b on a.AccountId=b.AccountId    
	left join #temp_brd_channel c on a.ChannelId=c.FID
	where a.Deleted=0 and a.DMLAction!=4 and a.ChannelId is not null

	select Id,AccountId,ChannelId,ProductName,isAlacarte,ActivationDate,DeactivationDate,ConnectionType,HistoryTransId,Insertedon into #temp_closing_alacarte_cnts_prp from
	(select ROW_NUMBER()OVER(Partition by SmartcardNo,ChannelId order by ActivationDate desc) as Rid,* from #temp_closing_alacarte_cnts_prp_1)x where x.Rid=1

	select PackageId as ProductId,COUNT(Distinct AccountId) as NofAcc 
	into #temp_closing_package_cnts from #temp_closing_package_cnts_prp group by PackageId

	select ChannelId as ProductId,COUNT(Distinct AccountId) as NofAcc 
	into #temp_closing_alacarte_cnts from #temp_closing_alacarte_cnts_prp group by ChannelId

	select * into #t_closing from (
	select *,0 as isAlacarte,1 as isClosing from #temp_closing_package_cnts 
	union
	select * ,1 as isAlacarte,1 as isClosing from #temp_closing_alacarte_cnts) a

	select a.PackageId,b.PackageName,b.PackageType,b.Price,b.Price2,b.EndDate,b.StartDate 
	into #t_pack from (select Distinct PackageId from #temp_channel_pack)a
	left outer join #packhist b on a.PackageId=b.FId

	select * ,isnull((Select count(ChannelId) from #temp_channel_pack x where x.PackageId= a.packageId and IsALacarte=0),0) as ChannelCount,
	isnull((Select count(ChannelId) from #temp_channel_pack x where x.PackageId= a.packageId and IsALacarte=1),0) as PayChannelCnt,
	isnull((Select SUM(BroadcasterPrice) from #temp_channel_pack x where x.PackageId= a.packageId),0) as Brate
	,Channels=ltrim(rtrim(cast(substring((SELECT (','+replace(t.ChannelName,',',' ')+SPACE(1)) FROM #temp_channel_pack t
	WHERE t.PackageId= a.packageId and t.IsALacarte=0 ORDER BY Id FOR XML PATH('')),2,8000) as varchar(8000))))                              
	,PayChannels=ltrim(rtrim(cast(substring ((SELECT (','+replace(t.ChannelName,',',' ')+SPACE(1)) FROM #temp_channel_pack t
	WHERE t.PackageId= a.packageId and t.IsALacarte=1 ORDER BY Id FOR XML PATH('')),2,8000) as varchar(8000)))) into #t_pack_details                              
	from #t_pack a

	select Id as PackageId,ChannelName as PackageName,ChannelType as PackageType,Price,Price2,DATEADD(Y,10,CreatedOn)as EndDate
	,CreatedOn as StartDate,0 as ChannelCount,1 as PayChannelCnt,BRate,'' as Channels,ChannelName as PayChannels into #t_alacarte
	from #temp_brd_channel where IsAlacarte=1

	select * into #t_brp_rep from(
	select 0 as Opening,isnull(c.NofAcc,0) as Closing,0 as IsAlacarte, a.* from #t_pack_details a
	left outer join #temp_closing_package_cnts c on a.PackageId=c.productId
	union
	select 0 as Opening,isnull(c.NofAcc,0) as Closing,1 as IsAlacarte, a.*  from #t_alacarte a
	left outer join #temp_closing_alacarte_cnts c on a.PackageId=c.productId
	)x

	insert into SMS_BROADCASTER_REPORT
	(BroadcasterId,BroadcasterName,RepMonth,Package_Channel_Id,Package_Channel_Name,ChannelCount,PayChannelCnt,Opening,Closing,
	Average,Amount
	,Price1,Price2,BRate,IsAlacarte,IsHD,StartDate,EndDate,Channels,PayChannels,CREATEDON,CREATEDBY,Remark)
	Select b.ID,b.BROADCASTERNAME,@repMonth as RepMonth,PackageId,PackageName,ChannelCount,PayChannelCnt,Opening,Closing,
	(Closing+Opening)/2,(Closing+Opening)/2*isnull(Brate,0),
	Price,Price2
	,Brate,IsAlacarte,PackageType,StartDate,EndDate,Channels,PayChannels,GETDATE(),-1,'AUTO GEN' from #t_brp_rep a,SMS_BROADCASTER b 
	where b.Id=@BroadcasterId

	update a set a.Opening=isnull(b.Closing,0) ,a.Average=(isnull(b.Closing,0)+a.Closing)/2 from SMS_BROADCASTER_REPORT a
	left join SMS_BROADCASTER_REPORT b on a.BroadcasterId=b.BroadcasterId and a.Package_Channel_Id=b.Package_Channel_Id and a.IsAlacarte=b.IsAlacarte
	where a.RepMonth=@repMonth and b.RepMonth=DATEADD(MONTH,-1,@repMonth)
End
GO
