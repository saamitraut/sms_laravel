USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_paid_bill_collection]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_paid_bill_collection] as 
 Select isnull(SUM(Amount),0) as Paid,SubscriberId,AccountId,InvoiceId from SMS_BILLCOLLECTION
  group by SubscriberId,AccountId,InvoiceId
GO
