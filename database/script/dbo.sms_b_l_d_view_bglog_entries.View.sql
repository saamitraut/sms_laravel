USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_b_l_d_view_bglog_entries]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_b_l_d_view_bglog_entries] as
select a.*,b.status from
SMS_B_D_INVOICE_BGLOG_ENTRIES a 
left outer join SMS_B_D_INVOICE_GEN_LOG b on a.BgLogId=b.Id
GO
