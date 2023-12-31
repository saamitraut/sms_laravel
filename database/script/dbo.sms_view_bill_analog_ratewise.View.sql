USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_bill_analog_ratewise]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_bill_analog_ratewise] as
Select i.Id as InvoiceId,i.SubscriberId,i.AccountId,i.BillNo,i.BillMonthYear,i.BasicCharge,i.AddtionalCharges,i.CurrentAmount,
i.TaxAmount,i.AdvancePaid,i.CreditCharges,i.DiscountCharges,i.ExtraPayments,a.CustomerId,a.FormNo,
i.BillAmount,a.SubscriberName,a.AreaName,a.SocietyName,i.SchemeId,i.ApplicableRate,a.AreaId
,cast(i.SchemeId as varchar)+'|'+cast(i.ApplicableRate as varchar) as SchemeRate
from SMS_B_A_INVOICE i left join sms_all_view_subscribers a on a.Id=i.SubscriberId
GO
