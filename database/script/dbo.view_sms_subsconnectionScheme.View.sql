USE [MNSMS]
GO
/****** Object:  View [dbo].[view_sms_subsconnectionScheme]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[view_sms_subsconnectionScheme] as
select OperatorId,Operator,SubscriberName,ConnectionId,ConnectionScheme,MonthlyCharge,CustomerId,s.Id as SubscriberId,a.Id as AccountId
 from sms_view_SubscriberAccountList a
left join sms_view_subscribers s on s.Id=a.SubscriberId 
where s.Status=1
GO
