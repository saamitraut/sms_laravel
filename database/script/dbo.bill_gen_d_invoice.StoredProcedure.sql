USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[bill_gen_d_invoice]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  procedure [dbo].[bill_gen_d_invoice] @bgLogId as bigint
as
begin
print 'start digital bills'
	--delete from SMS_B_A_INVOICE_BGLOG_ENTRIES where BgLogId=@bgLogId
	update SMS_B_D_INVOICE_GEN_LOG set 	StartedOn=GETDATE() where ID=@bgLogId	
	--select * from SMS_B_D_INVOICE_GEN_LOG where ID=@bgLogId	 
	
	-----Insert temp Invoice
	
	declare @BillGenSession as int
	select  @BillGenSession=isnull(max(BillGenSession),0)+1 from SMS_B_D_INVOICE where BillgenLogId=@bgLogId
	print @BillGenSession
	Select @BillGenSession as BillGenSession,@bgLogId as bgLogId

	declare @BillStartDate as date
	declare @BillEndDate as date

	Select @BillStartDate=dbo.getFirstDate(BillMonthYear),@BillEndDate=dbo.getLastDate(BillMonthYear)
	from SMS_B_D_INVOICE_GEN_LOG where ID=@bgLogId	

	
	while (exists( Select a.Id from 	
				[sms_b_d_view_nextinvoicemonth_togen] a	
			left outer join SMS_B_d_INVOICE_BGLOG_ENTRIES b	on  a.Id=b.AccountId
			left outer join SMS_B_d_INVOICE_GEN_LOG c on c.Id=b.BgLogId
			where month(a.NextInvoiceMonth)=MONTH(c.BillMonthYear) and Year(a.NextInvoiceMonth)=Year(c.BillMonthYear) 
			and b.Id is not null and b.BgLogId=@bgLogId 
			and c.Status=0 and c.Id is not null))
			---------------------------------and a.Status=1 removed for deleted bill--------------------------------
	Begin	
	print '--------------------------@BillGenSession------------------'
	print @BillGenSession
	if(OBJECT_ID('tempdb.dbo.#temp_invoice') is not null)
		drop table  #temp_invoice
	if(OBJECT_ID('tempdb.dbo.#temp_activecounts') is not null)
		drop table  #temp_activecounts
	if(OBJECT_ID('tempdb.dbo.#temp_invoice_2') is not null)
		drop table  #temp_invoice_2
	if(OBJECT_ID('tempdb.dbo.#temp_invoice_3') is not null)
		drop table  #temp_invoice_3
	if(OBJECT_ID('tempdb.dbo.#temp_invoice_4') is not null)
		drop table  #temp_invoice_4
	if(OBJECT_ID('tempdb.dbo.#tempAdv') is not null)
		drop table  #tempAdv
		
		
		Select top 1000 a.NextInvoiceMonth as BillMonthYear,a.LastInvoiceId,a.Id as AccountId,a.HId as HAccountId,a.SubscriberId,
		a.NextInvoiceMonth as FromDate,
		DateAdd(DAy,-1,DateAdd(mm,1,a.NextInvoiceMonth)) as ToDate,a.IsPrimary,(a.IsPrimary|a.ApplicableRate) as ApplicableRate,
		(Select MAX(Id) from SMS_SUBSCRIBERS_HISTORY where FID=a.SubscriberId) as HSubscriberId,
		(Select MAX(Id) from SMS_SUBSCRIBERS_DETAILS_HISTORY where SubscriberId=a.SubscriberId) as HSubscriberDetailId,
		(Select MAX(Id) from SMS_PAIRING_HISTORY where FID=a.PairingId) as HpairingId,
		b.BgLogId as BgLogId,c.BillDate,c.BillDueDate,c.CreatedBy,a.Status,ISNULL((Select max(ConnectionId)  from SMS_SUBSCRIBERACCOUNTS_HISTORY where SubscriberId=a.SubscriberId and 
		Month(InsertedOn)<Month(c.BillMonthYear) and Year(InsertedOn)=Year(c.BillMonthYear) ),a.ConnectionId)  as ConnectionId
		into #temp_invoice
		from 	
		[sms_b_d_view_nextinvoicemonth_togen] a	
		left outer join SMS_B_d_INVOICE_BGLOG_ENTRIES b	on  a.Id=b.AccountId
		left outer join SMS_B_d_INVOICE_GEN_LOG c on c.Id=b.BgLogId
		where month(a.NextInvoiceMonth)=MONTH(c.BillMonthYear) and Year(a.NextInvoiceMonth)=Year(c.BillMonthYear) 
		and b.Id is not null and b.BgLogId=@bgLogId 
		and c.Status=0 and c.Id is not null
		
		--select * from #temp_invoice
		print '---------------1--------------------'	
		select SUM(NoOfDays) as DaysCnt,MIN(SD) as StartDate,MAX(ED) as EndDate,IsActive,AccountId,SubscriberId 
		into #temp_activecounts from(
		Select Top 100 percent *,
			datediff(dd,FromDate,ToDate) as mdays,datediff(dd,SD,ED) as NoOfDays 		
			from
			(
		select dbo.returnGreaterdate(a.DateTime,b.FromDate) as SD,b.FromDate,b.ToDate,dbo.returnSmallerdate(a.NxtActionDate,DateAdd(d,1,b.ToDate)) 
		as ED,a.NoDays,a.IsActive,a.AccountId,a.SubscriberId  from sms_view_log_d_accountactiveinactive_count a
		left outer join #temp_invoice b on a.AccountId=b.AccountId
		where  b.AccountId is not null
		and (a.DateTime between b.FromDate and b.ToDate or  a.NxtActionDate between b.FromDate and b.ToDate)
		) x
		)z group by AccountId,SubscriberId,Isactive order by  AccountId,SubscriberId,Isactive	

		print '---------------2--------------------'	
		--select * from #temp_activecounts
		print 'Active counts subsquery'
		select *,isnull((select ISNULL(SUM(DaysCnt),0) from #temp_activecounts where AccountId=a.AccountId and IsActive=0),0) as InactiveCnt
		,isnull((select ISNULL(SUM(DaysCnt),0) from #temp_activecounts where AccountId=a.AccountId and IsActive=1),0) as ActiveCnt  
		into #temp_invoice_2  from #temp_invoice a
		
		print '---------------3--------------------'	
		
		Select a.*,case when a.ApplicableRate=0 then b.MonthlyCharge2 else b.MonthlyCharge end as MonthlyCharge
		into #temp_invoice_3  from #temp_invoice_2 a
		left outer join SMS_CONNECTIONSCHEME b on a.ConnectionId=b.Id
		----------------------where InactiveCnt<day(a.ToDate)----Inactive Counts for to be Billed or not
		
		print '---------------4--------------------'	
		select a.*,OperatorId,AreaId,Area,SocietyId,SocietyName,b.SocietyCode,FlatNo,FloorNo,Wing,Building 
		into #temp_invoice_4
		from #temp_invoice_3 a
		left outer join [sms_view_subscribers] b on a.SubscriberId=b.Id
		
		print '---------------5--------------------'	
		
		print '---------------6--------------------'
		begin try		
				insert into SMS_B_D_INVOICE(BillGenSession,SubscriberId,HSubscriberId,HpairingId,SchemeId,
				ApplicableRate,HSubscriberDetailId,AccountId,HAccountId,BillNo,
				BillMonthYear,
				BillDate,BillDueDate
				,BasicCharge,LastBillId,
				BillgenLogId,CreatedOn,CreatedBy)
				select @BillGenSession,SubscriberId,ISNULL(HSubscriberId,0),ISNULL(HpairingId,0),ConnectionId,ApplicableRate,
				ISNULL(HSubscriberDetailId,0),AccountId,HAccountId,
				'TBN_'+CAST(AccountId as varchar) as BillNo,
				BillMonthYear,BillDate as BillDate,BillDueDate,MonthlyCharge,LastInvoiceId,BgLogId as BillgenLogId,GETDATE() as CreatedOn,CreatedBy as CreatedBy
				from #temp_invoice_4 
				order by ConnectionId,AreaId,case ltrim(rtrim(isnull(SocietyCode,''))) 
				when '' then 'zZZZZZZZZZZZZZZ' else SocietyCode end,SocietyName,Wing,Building,FloorNo,FlatNo,SubscriberId
		end try
		Begin Catch
				SELECT 'L1' as Place, ERROR_NUMBER() AS ErrorNumber    ,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;
				select @BillGenSession,SubscriberId,HSubscriberId,HpairingId,ConnectionId,ApplicableRate,HSubscriberDetailId,AccountId,HAccountId,
				'TBN_'+CAST(AccountId as varchar) as BillNo,
				BillMonthYear,BillDate as BillDate,BillDueDate,MonthlyCharge,LastInvoiceId,BgLogId as BillgenLogId,GETDATE() as CreatedOn,CreatedBy as CreatedBy
				from #temp_invoice_4  order by ConnectionId,AreaId,case ltrim(rtrim(isnull(SocietyCode,''))) 
				when '' then 'zZZZZZZZZZZZZZZ' else SocietyCode end,SocietyName,Wing,Building,FloorNo,FlatNo,SubscriberId
		End Catch
		
		
		--SMS_A_ADDTIONALCHARGES 
		print '---------------10--------------------'
		Begin try
				insert into SMS_B_D_INVOICE_ADDTIONALCHARGES(InvoiceId,AdtionalChargeId,Title,Amount)
				select b.Id as InvoiceId,a.Id,a.ReasonTitle,a.Amount from 
				sms_view_d_addtionalcharges a
				left outer join SMS_B_D_INVOICE b on a.AccountId=b.AccountId 
				where b.Id is not null and a.IsAdjusted=0 and b.BillgenLogId=@bgLogId  and b.BillGenSession=@BillGenSession
		End try
			Begin Catch
				SELECT   'L5' as Place, ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;				
				select b.Id as InvoiceId,a.Id,a.ReasonTitle,a.Amount from 
				sms_view_d_addtionalcharges a
				left outer join SMS_B_D_INVOICE b on a.AccountId=b.AccountId 
				where b.Id is not null and a.IsAdjusted=0 and b.BillgenLogId=@bgLogId  and b.BillGenSession=@BillGenSession
			End Catch
			
	print '---------------11--------------------'				
		begin try
		
			if(exists(Select Id from SMS_B_D_INVOICE_ADDTIONALCHARGES ))
			begin
				if(OBJECT_ID('tempdb.dbo.#AddtionalCharges') is not null)
				drop table  #AddtionalCharges
				
			select Sum(Amount) as AddtionalCharges,a.InvoiceId into #AddtionalCharges
			from SMS_B_D_INVOICE_ADDTIONALCHARGES a 
				left outer join SMS_B_D_INVOICE b on a.InvoiceId=b.Id 
				where b.BillgenLogId=@bgLogId  and  b.BillGenSession=@BillGenSession
				group by a.InvoiceId
				
				
				Update SMS_B_D_INVOICE set AddtionalCharges=x.AddtionalCharges
				from #AddtionalCharges x where x.InvoiceId=SMS_B_D_INVOICE.Id				
			end			
		End try
		Begin Catch
				SELECT 'L6' as Place,   ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;				
				
		End Catch
			
		
		--	SMS_B_A_INVOICE_PAYMENTCREDITS -- Credits Adjustments
		print '---------------14--------------------'
			Begin try
				insert into SMS_B_D_INVOICE_PAYMENTCREDITS(InvoiceId,CreditEntryId,Title,Amount,IsAdvance)
				select b.Id as InvoiceId,a.Id,a.ReasonTitle,a.Amount,0 from 
				[sms_view_d_credit_entries] a
				left outer join SMS_B_D_INVOICE b on a.AccountId=b.AccountId 
				where b.Id is not null and a.IsAdjusted=0 and b.BillgenLogId=@bgLogId  and b.BillGenSession=@BillGenSession
					and dbo.getFirstDate(b.BillMonthYear)>=dbo.getFirstDate(a.MonthYear)
			End try
			Begin Catch
				SELECT  'L9' as Place,   ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;				
				select b.Id as InvoiceId,a.Id,a.ReasonTitle,a.Amount,0 from 
				[sms_view_d_credit_entries] a
				left outer join SMS_B_D_INVOICE b on a.AccountId=b.AccountId 
				where b.Id is not null and a.IsAdjusted=0 and b.BillgenLogId=@bgLogId  and b.BillGenSession=@BillGenSession
					and dbo.getFirstDate(b.BillMonthYear)>=dbo.getFirstDate(a.MonthYear)
				
			End Catch		
				
				print '---------------15--------------------'
			Begin try
					if(exists(Select Id from SMS_B_D_INVOICE_PAYMENTCREDITS))
					begin
						if(OBJECT_ID('tempdb.dbo.#CreditCharges') is not null)
						drop table  #CreditCharges
					
							select Sum(Amount) as CreditCharges,a.InvoiceId 
							into #CreditCharges from SMS_B_D_INVOICE_PAYMENTCREDITS a 
						left outer join SMS_B_D_INVOICE b on a.InvoiceId=b.Id 
						where b.BillgenLogId=@bgLogId  and b.BillGenSession=@BillGenSession and a.IsAdvance=0
						group by a.InvoiceId			
						Update SMS_B_D_INVOICE set CreditCharges=x.CreditCharges
						from #CreditCharges x where x.InvoiceId=SMS_B_D_INVOICE.Id and SMS_B_D_INVOICE.BillgenLogId=@bgLogId 
					End
			End try	
			Begin Catch
				SELECT  'L10' as Place,  ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;				
				select Sum(Amount) as CreditCharges,a.InvoiceId from SMS_B_D_INVOICE_PAYMENTCREDITS a 
				left outer join SMS_B_D_INVOICE b on a.InvoiceId=b.Id 
				where b.BillgenLogId=@bgLogId  and b.BillGenSession=@BillGenSession and a.IsAdvance=0
				group by a.InvoiceId
				
			End Catch	
		--- 

		--------------------Per Day Basis Amount Calculations------------------

		
		if(OBJECT_ID('tempdb.dbo.#ACCT1') is not null)
		drop table #ACCT1
	
		Select case when a.ActivationDate<@BillStartDate then @BillStartDate else ActivationDate end as AcctDate,
		case when DeactivationDate>@BillEndDate or DeactivationDate is null or DeactivationDate<@BillStartDate
		then @BillEndDate else DeactivationDate end as DacctDate,
		a.* into #ACCT1 from SMS_TRANSACTIONS_TRACK a left join SMS_B_d_INVOICE_BGLOG_ENTRIES b on a.AccountId=b.AccountId
		where  b.BgLogId=@bgLogId  and b.AccountId IS NOT NULL and  
		ActivationDate<=@BillEndDate  and ActivationDate<ISNULL(DeactivationDate,@BillEndDate) 
		and (DeactivationDate>=@BillStartDate or DeactivationDate is null)
		
		
		if(OBJECT_ID('tempdb.dbo.#ACCT2') is not null)
		drop table #ACCT2
				
		Select x.* into #ACCT2 
		from (Select ROW_NUMBER() over (partition by AcctDate,ConnectionId,AccountId,ProductId,isAlacarte,Ratetype order by AccountId) as RId,
		AcctDate,DacctDate,ConnectionId,AccountId,ProductId,isAlacarte,Ratetype from #ACCT1 ) x
		where  x.RId=1
		
	if(OBJECT_ID('tempdb.dbo.#ACCT3') is not null)
		drop table #ACCT3
		
		Select  case when DATEDIFF(DAY,x.AcctDate,x.DacctDate)=0 then 0 else cast(DATEDIFF(DAY,x.AcctDate,x.DacctDate) as int)+1 end as ActiveDay 
		,x.ConnectionId,x.AccountId,x.ProductId,x.IsAlacarte,x.AcctDate,x.DacctDate,x.RateType into #ACCT3
		from  #ACCT2 x
			

	if(OBJECT_ID('tempdb.dbo.#ActiveCount') is not null)
		drop table #ActiveCount
		
		 Select SUM(y.ActiveDay) as TotalActive,y.ConnectionId,y.AccountId,y.ProductId,y.IsAlacarte,
		 case when y.IsAlacarte=1 then case when y.RateType=1 then ISNULL(c.Price,0) else ISNULL(c.Price2,0) end else
		 case when y.RateType=1 then ISNULL(p.Price,0)
		 else ISNULL(p.Price2,0) end end as Price,cast(DATEDIFF(DAY,@BillStartDate,@BillEndDate)as int)+1 as BillMonthDays,
		 y.RateType,ISNULL(p.PackageName,c.ChannelName) as ProductName  into #ActiveCount
		from #ACCT3 y left join SMS_PACKAGE p on p.Id=y.ProductId and y.IsAlacarte=0
		left join SMS_CHANNEL c on c.Id=y.ProductId and y.IsAlacarte=1
		group by y.ConnectionId,y.AccountId,y.ProductId,y.IsAlacarte,y.RateType,c.Price,c.Price2,p.Price,p.Price2,p.PackageName,c.ChannelName
		order by y.AccountId
		
						
	if(OBJECT_ID('tempdb.dbo.#PerDayCal') is not null)
		drop table #PerDayCal
			
		Select *, cast(round(((Price/BillMonthDays)* case when TotalActive>BillMonthDays or DATEDIFF(DAY,@BillStartDate,@BillEndDate)=TotalActive
		  then BillMonthDays else TotalActive end),2) as decimal(18,2))	as PerBayBasis  into #PerDayCal
		from (Select  TotalActive,ConnectionId,AccountId,ProductId,IsAlacarte,Price,BillMonthDays,ProductName from #ActiveCount where ConnectionId=0
		union
		Select  TotalActive,ConnectionId,AccountId,0 as ProductId,0 as IsAlacarte,c.MonthlyCharge,a.BillMonthDays,c.Name as ProductName
		from #ActiveCount a left join SMS_CONNECTIONSCHEME c on c.Id=a.ConnectionId	where a.ConnectionId>0
		)  x
			
			
---Connection Charges Mapping
		print '---------------7--------------------'
		Begin try
				insert into SMS_B_D_INVOICE_CONNCHARGES(InvoiceId,Chargeid,Title,Amount)
				select b.Id as InvoiceId,a.ChargeId,a.ChargeTitle,PerBayBasis from 
				sms_view_schemecharges a left outer join #PerDayCal c on  
				a.SchemeId=c.ConnectionId
				left outer join SMS_B_D_INVOICE b on c.AccountId=b.AccountId
				where b.Id is not null and b.BillgenLogId=@bgLogId and b.BillGenSession=@BillGenSession
				and c.ConnectionId>0
		end try
		Begin Catch
				SELECT   'L2' as Place, ERROR_NUMBER() AS ErrorNumber    ,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;
						select b.Id as InvoiceId,a.ChargeId,a.ChargeTitle,case b.ApplicableRate when 0 then a.Amount2 else a.Amount end from 
						sms_view_schemecharges a left outer join #PerDayCal c on  
				a.SchemeId=c.ConnectionId
				left outer join SMS_B_D_INVOICE b on a.SchemeId=b.SchemeId
				where b.Id is not null and b.BillgenLogId=@bgLogId and b.BillGenSession=@BillGenSession and c.AccountId is not null and c.ConnectionId>0
		End Catch
		-------
			--SMS_A_ADDTIONALCHARGES SMS_B_D_INVOICE_ADDONCHARGES
			--select * from SMS_SUBSCRIBERTRANSACTIONS
			--select * from SMS_B_D_INVOICE_ADDONCHARGES
			print '---------------8--------------------'
			begin try
				insert into SMS_B_D_INVOICE_ADDONCHARGES(InvoiceId,TagName,Amount)
				select b.Id as InvoiceId,a.ProductName,Price from 				
				#PerDayCal a
				left outer join SMS_B_D_INVOICE b on a.AccountId=b.AccountId 
				where b.Id is not null and b.BillgenLogId=@bgLogId and b.BillGenSession=@BillGenSession and a.ConnectionId=0
				and a.ProductName is not null
			end try
			Begin Catch
				SELECT 'L3' as Place,   ERROR_NUMBER() AS ErrorNumber    ,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;
				select b.Id as InvoiceId,ProductName,Price from 
				#PerDayCal a
				left outer join SMS_B_D_INVOICE b on a.AccountId=b.AccountId 
				where b.Id is not null and b.BillgenLogId=@bgLogId and b.BillGenSession=@BillGenSession and a.ConnectionId=0
			End Catch
			print '---------------9--------------------'
			Begin try
				if exists(select Id from SMS_B_D_INVOICE_ADDONCHARGES)
				begin	
					if(OBJECT_ID('tempdb.dbo.#temp_packages') is not null)
					drop table  #temp_packages
					
					select Sum(Amount) as PayPackageCharge,a.InvoiceId 
					into #temp_packages from SMS_B_D_INVOICE_ADDONCHARGES a 
						left outer join SMS_B_D_INVOICE b on a.InvoiceId=b.Id 
						where b.BillgenLogId=@bgLogId  and b.BillGenSession=@BillGenSession
						group by a.InvoiceId			
					
					Update SMS_B_D_INVOICE set PayPackageCharge=x.PayPackageCharge
					from #temp_packages x 
					where x.InvoiceId=SMS_B_D_INVOICE.Id and SMS_B_D_INVOICE.BillGenSession=@BillGenSession
				end				
			End try
			Begin Catch
				SELECT   'L4' as Place, ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;				
			End Catch
			
		
		--SMS_A_ADDTIONALCHARGES 			
			
	
		print 'Perday cal sub query'
		Update SMS_B_D_INVOICE
		set BasicCharge=ISNULL((Select SUM(PerBayBasis) from #PerDayCal where AccountId=SMS_B_D_INVOICE.AccountId and ConnectionId>0),0),
		    PayPackageCharge=ISNULL((Select SUM(PerBayBasis) from #PerDayCal where AccountId=SMS_B_D_INVOICE.AccountId and ConnectionId=0),0)
		where  BillgenLogId=@bgLogId 

		Insert into SMS_B_D_PERDAYCAL(InvoiceId,AccountId,ProductId,IsAlacarte,TotalActive,ConnectionId,BillMonthDays,Price,
		PerdayBasis,CreatedOn,CreatedBy,ProductName)
		Select b.Id as InvoiceId,a.AccountId,a.ProductId,a.IsAlacarte,a.TotalActive,a.ConnectionId,a.BillMonthDays,
		a.Price,a.PerBayBasis,b.CreatedOn,b.CreatedBy,a.ProductName
		from #PerDayCal a left join SMS_B_D_INVOICE b on a.AccountId=b.AccountId
		where   BillgenLogId=@bgLogId 

				
		--------------Calculate current Charges---
		print '---------------16--------------------'
				Update SMS_B_D_INVOICE set CurrentCharges=AddtionalCharges+PayPackageCharge+BasicCharge where  BillgenLogId=@bgLogId 
				and BillGenSession=@BillGenSession
		---------------Taxes--------------------------
		print '---------------17--------------------'
			Begin try
				insert into SMS_B_D_INVOICETAXES(Invoiceid,TaxId,TaxTitle,TaxCode,TaxValue,IsInAmount,TaxAmount,TaxDescription)
				Select a.Id as INVOICEID,b.Id as TAXID ,b.TaxTitle,b.TaxCode,b.TaxValue,b.IsInAmount,
				isnull(dbo.getTaxAmount(a.CURRENTCHARGES,b.Id),0) as TaxAmount,dbo.getTaxDescp(b.Id) as TaxDescription
				from SMS_B_D_INVOICE a,SMS_TAX_MASTER b where  a.BillgenLogId=@bgLogId and a.BillGenSession=@BillGenSession and b.STATUS=1
			End try	
			Begin Catch
				SELECT   'L11' as Place, ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;				
				Select a.Id as INVOICEID,b.Id as TAXID ,b.TaxTitle,b.TaxCode,b.TaxValue,b.IsInAmount,
				isnull(dbo.getTaxAmount(a.CURRENTCHARGES,b.Id),0) as TaxAmount,dbo.getTaxDescp(b.Id) as TaxDescription
				from SMS_B_D_INVOICE a,SMS_TAX_MASTER b where  a.BillgenLogId=@bgLogId and a.BillGenSession=@BillGenSession and b.STATUS=1
			End Catch	
					
		print '---------------18--------------------'
		begin try
		
			if(exists(Select Id from SMS_B_D_INVOICETAXES))
				begin
					if(OBJECT_ID('tempdb.dbo.#TaxAmount') is not null)
					drop table  #TaxAmount
					
					select Sum(a.TaxAmount) as TaxAmount,a.InvoiceId into #TaxAmount from SMS_B_D_INVOICETAXES a 
					left outer join SMS_B_D_INVOICE b on a.InvoiceId=b.Id 
					where b.BillgenLogId=@bgLogId   and b.BillGenSession=@BillGenSession
					group by a.InvoiceId
					
					Update SMS_B_D_INVOICE set TaxAmount=x.TaxAmount
					from #TaxAmount
					 x where x.InvoiceId=SMS_B_D_INVOICE.Id  and SMS_B_D_INVOICE.BillgenLogId=@bgLogId 
					 and SMS_B_D_INVOICE.BillGenSession=@BillGenSession
				end	
			End try	
			Begin Catch
				SELECT  'L12' as Place,  ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;				
				select Sum(a.TaxAmount) as TaxAmount,a.InvoiceId from SMS_B_D_INVOICETAXES a 
				left outer join SMS_B_D_INVOICE b on a.InvoiceId=b.Id 
				where b.BillgenLogId=@bgLogId   and b.BillGenSession=@BillGenSession
				group by a.InvoiceId
			End Catch
		print '---------------19--------------------'			
		Update SMS_B_D_INVOICE set CurrentAmount=CurrentCharges+TaxAmount where  BillgenLogId=@bgLogId and BillGenSession=@BillGenSession
		---Discounts----
		----Later
		--------------------------------------------------
		--Last Bill Details--
		print '---------------20--------------------'
		begin try	
			update SMS_B_D_INVOICE set NextBillId=a.InvoiceId		
			from 
			(select Id as InvoiceId,LastBillId from SMS_B_D_INVOICE  where LastBillId>0 and BillgenLogId=@bgLogId 
			and BillGenSession=@BillGenSession	) a
			 where a.LastBillId=SMS_B_D_INVOICE.Id 
			 
			 
			 
			 
		End try	
		Begin Catch
				SELECT   'L13' as Place, ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;								
		End Catch

			print '---------------21--------------------'
				
			/* Payment*/
			begin try
			if(OBJECT_ID('tempdb.dbo.#temp_payment') is not null)
			drop table  #temp_payment				
			
			if(exists(Select Id from SMS_PAYMENT where IsAdjusted=0 and ServiceType=1 ))
			begin
			select a.Id,isnull(SUM(b.Amount),0) as PaymentAmount,	
			isnull(MAX(b.Id),0) as PaymentId,a.AccountId
			into #temp_payment 
			from SMS_B_D_INVOICE a		
			left outer join SMS_PAYMENT b on  a.AccountId=b.AccountId 	
			and cast(b.CreatedOn	as Date)<BillDate 
			where a.BillgenLogId=@bgLogId and a.BillGenSession=@BillGenSession and b.IsAdjusted=0 
			group by a.Id,a.AccountId  
						
			Update SMS_B_D_INVOICE set SMS_B_D_INVOICE.LastPayments=x.PaymentAmount,SMS_B_D_INVOICE.LastPaymentId=x.PaymentId
			from #temp_payment x 
			where SMS_B_D_INVOICE.Id=x.Id and SMS_B_D_INVOICE.BillgenLogId=@bgLogId and
			SMS_B_D_INVOICE.BillGenSession=@BillGenSession
			
			update SMS_PAYMENT set IsAdjusted=1,InvoiceId=x.Id
			from #temp_payment x where x.AccountId=SMS_PAYMENT.AccountId and
			SMS_PAYMENT.IsAdjusted=0 and SMS_PAYMENT.Id<=x.PaymentId	 			 
			end		 
			 
			End try	
			Begin Catch
				SELECT    'L14' as Place,ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;								
			End Catch
			
			--------------------------------Credit----------------------------------------------------
			begin try
			if(OBJECT_ID('tempdb.dbo.#temp_payment_credit') is not null)
			drop table  #temp_payment_credit			
			
			if(exists(Select Id from SMS_PAYMENT_CREDIT where IsAdjusted=0 and InvoiceId=0 ))
			begin
			select a.Id,isnull(SUM(b.Amount),0) as PaymentAmount,	
			isnull(MAX(b.Id),0) as PaymentId,a.AccountId
			into #temp_payment_credit
			from SMS_B_D_INVOICE a		
			left outer join SMS_PAYMENT_CREDIT b on  a.AccountId=b.AccountId 			
			group by a.Id,a.AccountId
						
			Update SMS_B_D_INVOICE set SMS_B_D_INVOICE.creditAmount=x.PaymentAmount,SMS_B_D_INVOICE.creditId=x.PaymentId
			from #temp_payment_credit x 
			where SMS_B_D_INVOICE.Id=x.Id and SMS_B_D_INVOICE.BillgenLogId=@bgLogId and
			SMS_B_D_INVOICE.BillGenSession=@BillGenSession
			
			update SMS_PAYMENT_CREDIT set IsAdjusted=1,InvoiceId=x.Id
			from #temp_payment_credit x where x.AccountId=SMS_PAYMENT_CREDIT.AccountId and
			SMS_PAYMENT_CREDIT.IsAdjusted=0 and SMS_PAYMENT_CREDIT.Id<=x.PaymentId	 			 
			end		 
			 
			End try	
			Begin Catch
				SELECT    'L14' as Place,ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;								
			End Catch
			----------------------------------credit end-----------------------------------------------------
			
			begin try
			if(OBJECT_ID('tempdb.dbo.#temp_collection') is not null)
			drop table  #temp_collection				
			
			if(exists(Select Id from SMS_BILLCOLLECTION where SettleInvoice=0 and SettleStatus='0'))
			begin
			select a.Id,isnull(b.Amt,0) as PaymentAmount,	
			isnull(b.PID,0) as PaymentId,a.AccountId
			into #temp_collection 
			from SMS_B_D_INVOICE a		
			left outer join
			(Select MAX(Id) as PID,sum(Amount) as Amt,InvoiceId,AccountId,SubscriberId 			
				from SMS_BILLCOLLECTION where SettleInvoice=0 and SettleStatus=0
				group by InvoiceId,AccountId,SubscriberId 
			) b on  a.AccountId=b.AccountId 	
			 		 						
			Update SMS_B_D_INVOICE set SMS_B_D_INVOICE.LastCollectionAmount=x.PaymentAmount,SMS_B_D_INVOICE.LastCollectionId=x.PaymentId
			from #temp_collection x 
			where SMS_B_D_INVOICE.Id=x.Id and SMS_B_D_INVOICE.BillgenLogId=@bgLogId and
			SMS_B_D_INVOICE.BillGenSession=@BillGenSession
			
						
			update SMS_BILLCOLLECTION set SettleStatus=1,SettleInvoice=x.Id
			from #temp_collection x,SMS_BILLCOLLECTION where x.AccountId=SMS_BILLCOLLECTION.AccountId and
			SMS_BILLCOLLECTION.SettleStatus=0 and SMS_BILLCOLLECTION.Id<=x.PaymentId	 			 
			end		 
			 
			End try	
			Begin Catch
				SELECT    'L14' as Place,ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;								
			End Catch
					
			
			update SMS_B_D_INVOICE Set SMS_B_D_INVOICE.LastBillAmount=x.LbAmt,
			SMS_B_D_INVOICE.LastBillDue=x.LbAmt
					from 
			(Select BillAmount as LbAmt,Id as Bid,NextBillId as nxtBId from SMS_B_D_INVOICE  where NextBillId>0) x
			where x.Bid=LastBillId and x.nxtBId=Id
			 and SMS_B_D_INVOICE.BillgenLogId=@bgLogId and		SMS_B_D_INVOICE.BillGenSession=@BillGenSession
			
		--select * from SMS_B_A_INVOICE
		print '---------------22--------------------'
		if(OBJECT_ID('tempdb.dbo.#temp_billno_1') is not null)
		 drop table  #temp_billno_1
		if(OBJECT_ID('tempdb.dbo.#temp_billno') is not null)
		drop table  #temp_billno
		begin try
		begin tran	
		select BillMonthYear,ROW_NUMBER() over(Order By Id)as RID,dbo.[getFinancialYear](BillMonthYear) as FnYr,
		Id as InvoiceId into #temp_billno_1  from SMS_B_D_INVOICE where  BillgenLogId=@bgLogId and BillGenSession=@BillGenSession		
		
		Declare @MaxCustId as int
		Declare @FnYr as varchar(4)
		select top 1 @FnYr=FnYr  from #temp_billno_1
		
		Select @MaxCustId =cast(max(right(BILLNO,6)) as int) from  SMS_B_D_INVOICE where
		dbo.[getFinancialYear](BillMonthYear)=@FnYr and BillNo not like 'TBN_%'		
		Select 'JPR-'+@FnYr+'-'+dbo.getNdigit((isnull(@MaxCustId,0)+RID),6) as Billnos ,InvoiceId into #temp_billno
		from #temp_billno_1		
		
			Update SMS_B_D_INVOICE set BillAmount=round(CurrentAmount+CreditCharges-DiscountCharges-ExtraPayments-LastPayments,0),
			BillNo=x.Billnos
			from  #temp_billno x where BillgenLogId=@bgLogId and id=x.InvoiceId 			 
		commit
		End try	
			Begin Catch
				SELECT   'L15' as Place, ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;								
			End Catch
		--Select * from SMS_B_A_INVOICE
		--begin transaction	
		--rollback
		
				if(OBJECT_ID('tempdb.dbo.#tempAdv') is not null)
			drop table  #tempAdv
			
			select Row_number()over(order by a.AccountId,a.IsAdjusted Desc,a.StartingMonth,b.Id) as Rid,
			0 as Flag,0 as AdjustedAmt,b.Id as InvoiceId,a.AccountId,b.BillAmount,b.BillAmount as BillBalance,a.balance as Balance,
			a.balance as AdvanceAmount,a.Id as AdvanceId,b.BillMonthYear,a.SubscriberId,a.Amount,a.StartingMonth,ReasonTitle
			into #tempAdv 
			from 	sms_view_d_advancepayments a
			left outer join SMS_B_D_INVOICE b on a.AccountId=b.AccountId 
			where a.Balance>0 and 
			 b.Id is not null and b.BillgenLogId=@bgLogId  and b.BillGenSession=@BillGenSession
			and dbo.getFirstDate(b.BillMonthYear)>=dbo.getFirstDate(a.StartingMonth)
			order by a.AccountId,a.IsAdjusted Desc,a.StartingMonth,b.Id
			
			declare @rid as bigint			
			set @rid=0
			while (exists(select * from #tempAdv where BillBalance>0 and Balance>0 and Rid>@rid and Flag=0))
			Begin
				Select @rid=min(Rid) from #tempAdv where BillBalance>0 and Balance>0 and Rid>@rid and Flag=0
				
				Update #tempAdv set 
				AdjustedAmt=Case when BillBalance>Balance then Balance else BillBalance end ,
				Balance=Case when BillBalance<Balance then Balance-BillBalance else 0 end,
				BillBalance=BillBalance-Case when BillBalance>Balance then Balance else BillBalance end,Flag=1
				where Rid=@rid
				
				UPDATE #tempAdv set BillBalance=x.BillBalance,Flag=x.xFlag
				from (
				Select a.Rid,b.BillBalance,b.Balance,Case when b.BillBalance>0 then 0 else -1 end as xFlag from #tempAdv a
				left outer join #tempAdv b on a.AccountId=b.AccountId 
				where a.Flag=0 and b.Rid=@rid and a.Rid!=b.Rid) x where #tempAdv.Rid=x.Rid
				
			End
					
			
			Insert into SMS_ADVANCEPAYMENT_TRANSACTIONS
			 (AdvanceId,BAmount,AmountAdjusted,AdjustmentType,ReferenceId,CreatedOn,CreatedBy,Remark)
			 Select AdvanceId,AdvanceAmount,AdjustedAmt,1,InvoiceId,GETDATE(),-1,'Adjusted in Bill' from #tempAdv  where Flag=1 order by Rid
			 
			insert into SMS_B_D_INVOICE_PAYMENTCREDITS(InvoiceId,CreditEntryId,Title,Amount,IsAdvance)			
			Select InvoiceId,Id,ReasonTitle,AdvanceAmount,1 
			from SMS_ADVANCEPAYMENT_TRANSACTIONS a
			left outer join #tempAdv b on a.AdvanceId=b.AdvanceId and a.ReferenceId=b.InvoiceId
			 where b.Flag=1 and b.Rid is not null order by Rid
			
			 ----------------------------------------------------------------
			 
			 if(exists(Select Id from SMS_B_D_INVOICE_PAYMENTCREDITS where IsAdvance=1))
			begin
				if(OBJECT_ID('tempdb.dbo.#AdvancePaid') is not null)
				drop table  #AdvancePaid
				
			select Sum(Amount) as AdvancePaid,a.InvoiceId into #AdvancePaid from SMS_B_D_INVOICE_PAYMENTCREDITS a 
			left outer join SMS_B_D_INVOICE b on a.InvoiceId=b.Id 
			where b.BillgenLogId=@bgLogId and a.IsAdvance=1 and b.BillgenLogId=@bgLogId 
			group by a.InvoiceId
				
			Update SMS_B_D_INVOICE set AdvancePaid=x.AdvancePaid--,BillAmount=BillAmount-x.AdvancePaid
			from	#AdvancePaid x where x.InvoiceId=SMS_B_D_INVOICE.Id  
			end
					
			
			update SMS_B_D_INVOICE set BillAmount=BillAmount+LastBillDue
			where BillgenLogId=@bgLogId  and  BillGenSession=@BillGenSession
					
		
		print '---------------23--------------------'
		
		Begin try
		update SMS_B_D_NEXTINVOICEMONTH	set SMS_B_D_NEXTINVOICEMONTH.HAccountId=x.HAccountId,SMS_B_D_NEXTINVOICEMONTH.InvoiceId=x.InvoiceId,
		SMS_B_D_NEXTINVOICEMONTH.LastInvoiceId=x.LastInvoiceId,SMS_B_D_NEXTINVOICEMONTH.NextMonthYear=x.NextMonthYear
		,SMS_B_D_NEXTINVOICEMONTH.UpdatedOn=GETDATE(),SMS_B_D_NEXTINVOICEMONTH.UpdatedBy=x.CreatedBy,SMS_B_D_NEXTINVOICEMONTH.InvoiceMonth=x.BillMonthYear
		from(	
		Select b.Id as Blid,DateAdd(m,1,a.BillMonthYear) as NextMonthYear,a.BillMonthYear,a.HAccountId,b.InvoiceId as LastInvoiceId,ISNULL(c.Id,0) as InvoiceId,
		a.CreatedBy from 
		#temp_invoice a	
		left outer join SMS_B_D_NEXTINVOICEMONTH b on a.AccountId=b.AccountId
		left outer join SMS_B_D_INVOICE c on a.AccountId=b.AccountId and  c.AccountId=b.AccountId  and c.BillgenLogId=@bgLogId
		and  c.BillGenSession=@BillGenSession
		where b.Id is not null
		) x  where SMS_B_D_NEXTINVOICEMONTH.Id=x.Blid	
		End try	
			Begin Catch
				SELECT   'L16' as Place, ERROR_NUMBER() AS ErrorNumber,ERROR_SEVERITY() AS ErrorSeverity    ,ERROR_STATE() AS ErrorState    ,ERROR_PROCEDURE() AS ErrorProcedure    ,ERROR_LINE() AS ErrorLine    ,ERROR_MESSAGE() AS ErrorMessage;								
		End Catch
			
		select 'Generated' as Msg,@BillGenSession as BillGenSession,(Select COUNT(Id) from SMS_B_D_INVOICE 
		where BillgenLogId=@bgLogId and BillGenSession=@BillGenSession) as Bilcount;	
		
		print ('---------------24--------------------')
		
		update SMS_B_D_INVOICE_GEN_LOG set 	UpdatedOn=GETDATE(),
		NoofBillGenerated=(Select COUNT(Id) from SMS_B_D_INVOICE where BillgenLogId=@bgLogId) where ID=@bgLogId
		
		Set  @BillGenSession=@BillGenSession+1		
	end
	update SMS_B_D_INVOICE_GEN_LOG set 	CompletedOn=GETDATE(),Status=1,
		NoofBillGenerated=(Select COUNT(Id) from SMS_B_D_INVOICE where BillgenLogId=@bgLogId) where ID=@bgLogId			
end
GO
