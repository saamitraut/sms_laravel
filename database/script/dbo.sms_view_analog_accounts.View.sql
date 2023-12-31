USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_analog_accounts]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_analog_accounts] as
 Select a.*,b.Name as ConnectionScheme,case when a.ApplicableRate=0 and a.IsPrimary=0 then b.MonthlyCharge2 else b.MonthlyCharge end as MonthlyCharge
 from SMS_SUBSCRIBERS_ANALOG_ACCOUNTS a
 left outer join SMS_CONNECTIONSCHEME b on a.ConnectionId=b.Id
GO
