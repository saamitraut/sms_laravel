USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_log_a_accountactiveinactive_count]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view[dbo].[sms_view_log_a_accountactiveinactive_count] as
	Select a.*,isnull(DATEDIFF(DD,a.DateTime,isnull(b.DateTime,getdate())),0) as NoDays,b.DateTime as NxtActionDate,
	isnull(b.IsActive,a.isActive) as NxtStatus from sms_view_log_a_accountactiveinactive_t a
	left outer join sms_view_log_a_accountactiveinactive b on a.NxtId=b.Id
GO
