USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_accounts_pairing_details]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_accounts_pairing_details] as
select a.*,b.FormNo,b.CustomerId,b.MobileNo,b.OperatorId,b.SocietyId,b.SubscriberName
,b.SocietyName,b.Area,b.Operator,b.ParentOperator,b.ParentOperatorId,b.DOB as DOB
 from sms_view_accounts_pairings a
left outer join sms_view_subscribers b on a.SubscriberId=b.Id 
where b.Id is not null
GO
