USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_bill_d_sch_grouped]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_bill_d_sch_grouped] as
select COUNT(InvoiceId) as Billcount,SUM(BasicCharge) as BasicCharge,SUM(PayPackageCharge) as PayPackageCharge,SUM(AddtionalCharges)
 as AddtionalCharges
,SUM(CurrentAmount) as CurrentAmount,SUM(TaxAmount) as TaxAmount,SUM(AdvancePaid) as AdvancePaid,SUM(CreditCharges) as CreditCharges
,SUM(DiscountCharges) as DiscountCharges,SUM(ExtraPayments) as ExtraPayments,SUM(BillAmount) as BillAmount,
'{"f":"d","a":"'+cast(cast(SUM(BillAmount)as decimal(16,2))as varchar)+'","c":"'+CAST(COUNT(InvoiceId) as varchar )+'","areaid":"'+CAST(AreaId as varchar )+'","billmonthyear":"'+CAST(BillMonthYear as varchar )+'","applicablerate":"'+CAST(applicablerate as varchar )+'","schemeid":"'+CAST(SchemeId as varchar )+'"}' as RateCount,
''+cast(cast(SUM(BillAmount)as decimal(16,2))as varchar)+' ['+CAST(COUNT(InvoiceId) as varchar )+']' as RateCountV
,AreaName,BillMonthYear,AreaId,SchemeRate,SchemeId,ApplicableRate from [sms_view_bill_digital_ratewise] 
group by AreaName,BillMonthYear,AreaId,SchemeRate,SchemeId,ApplicableRate
GO
