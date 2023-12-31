USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_digital_advance_report]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_digital_advance_report] as 
Select c.Id,s.CustomerId,s.SubscriberName,s.SocietyName,s.AreaName,s.Operator,c.Amount,c.Balance,a.STBNo,a.SmartcardNo,a.ConnectionScheme,
c.StartingMonth,c.ReasonTitle,c.RecieptDate,
case when c.IsAdjusted=0 then 'NotAdjusted' else 'Adjusted' end as Status
from sms_view_d_advancepayments c left join  sms_all_view_subscribers s on s.Id=c.SubscriberId
left join sms_view_SubscriberAccountList a on a.Id=c.AccountId
GO
