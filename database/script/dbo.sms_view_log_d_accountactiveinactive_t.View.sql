USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_log_d_accountactiveinactive_t]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view[dbo].[sms_view_log_d_accountactiveinactive_t] as
	select *,dbo.[z_d_getNxtActDectId](Id,AccountId) as NxtId from SMS_Z_D_ACTIVEINACTIVE_LOG
GO
