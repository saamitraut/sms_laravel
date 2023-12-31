USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_prospectaccounts_history]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_prospectaccounts_history] as
select a.*,b.Name as Scheme,case a.RateType when 1 then 'Rate 1 @'+CAST(b.MonthlyCharge as varchar)
else 'Rate 2 @'+CAST(b.MonthlyCharge2 as varchar) end as Rate from SLA_PROSPECTACCOUNTS_HISTORY a
left outer join SMS_CONNECTIONSCHEME b on a.ConnectionId=b.Id
GO
