USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_advance_report]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_advance_report] as 
Select c.Id,s.CustomerId,s.SubscriberName,s.SocietyName,s.AreaName,s.Operator,a.STBNo,a.SmartcardNo,a.ConnectionScheme,
c.StartingMonth,c.Amount,c.ReasonId,c.RecieptDate
from SMS_A_PAYMENTCREDITS c left join  sms_all_view_subscribers s on s.Id=c.SubscriberId
left join sms_view_SubscriberAccountList a on a.Id=c.AccountId
where c.isAdvancePayment=1
GO
