USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_d_addtionalcharges]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_d_addtionalcharges] as
	select a.*,b.ReasonTitle from SMS_D_ADDTIONALCHARGES a
	left outer join SMS_REASON_MASTER b on a.ReasonId=b.Id
GO
