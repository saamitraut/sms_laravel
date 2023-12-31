USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_d_makepayments]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view[dbo].[sms_view_d_makepayments] as
 select CustomerId,ID as SubscriberId,SubscriberName,CreatedBy,id,
isnull((select dbo.getMonthYear(max(BillMonthYear)) from SMS_B_D_INVOICE where SubscriberId=sms_view_subscribers.Id),'No Bill') as LastBillMonth,
isnull((select max(BillNo) from SMS_B_D_INVOICE where SubscriberId=sms_view_subscribers.Id),'No Bill') as LastBillNo,
isnull((select sum(BillAmount) from SMS_B_D_INVOICE where SubscriberId=sms_view_subscribers.Id and LastPaymentId=0 ),0) as AmountPayable,
isnull((select count(Id) from sms_view_SubscriberAccountList where SubscriberId=sms_view_subscribers.Id),0) as NoOfAccounts
from sms_view_subscribers
GO
