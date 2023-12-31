USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_pairingIssused]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_pairingIssused] as
select a.*,b.FormNo,b.CustomerId,b.MobileNo,b.OperatorId,b.SocietyId,b.SubscriberName
,b.SocietyName,b.Area,b.Operator,b.ParentOperator,b.ParentOperatorId
 from sms_view_pairing a
left outer join sms_view_subscribers b on a.SubscriberId=b.Id where  a.AccountId>0
GO
