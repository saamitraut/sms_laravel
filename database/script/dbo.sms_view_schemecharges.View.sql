USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_schemecharges]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_schemecharges] as
	select a.*,b.ChargeTitle from SMS_SCHEMECHARGEMAPING a
	left outer join SMS_CHARGEMASTER b on a.ChargeId=b.Id
GO
