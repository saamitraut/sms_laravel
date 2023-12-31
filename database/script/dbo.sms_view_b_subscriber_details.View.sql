USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_b_subscriber_details]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_b_subscriber_details] as
	select a.Id,a.OperatorId,a.SocietyId,a.CustomerId,a.Status,b.AreaId from SMS_SUBSCRIBERS a
	left outer join SMS_SOCIETY_MASTER b on a.SocietyId=b.Id
GO
