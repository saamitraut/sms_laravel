USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_a_advancepayments]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_a_advancepayments] as
select a.*,b.ReasonTitle
from sms_view_advancepayments a
left outer join SMS_REASON_MASTER b on a.ReasonId=b.Id
where a.ServiceType=0
GO
