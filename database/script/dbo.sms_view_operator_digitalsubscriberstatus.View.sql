USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_operator_digitalsubscriberstatus]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_operator_digitalsubscriberstatus] as
 select o.ID as operator,
 case when sa.Status='1' then '1' else '0' end as ActiveStatus,
 case when sa.Status='1' then '0' else '1' end as InactiveStatus
 from SMS_SUBSCRIBERACCOUNTS sa left join SMS_SUBSCRIBERS s on sa.SubscriberID=s.ID
 left join SMS_OPERATOR o on o.ID=s.OperatorId
GO
