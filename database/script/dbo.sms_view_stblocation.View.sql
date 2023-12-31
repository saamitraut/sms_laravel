USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_stblocation]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[sms_view_stblocation] as

select a.ID,b.CustomerId,b.SubscriberName as SubscriberName,b.ParentOperatorId,b.OperatorId,a.SmartcardNo,a.STBNo,case when a.status=1 then 'Active' else 'Inactive' end as status
,b.Address from sms_view_SubscriberAccountList a left join sms_view_subscribers b on a.subscriberId=b.id
GO
