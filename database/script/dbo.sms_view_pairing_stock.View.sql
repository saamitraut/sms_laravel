USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_pairing_stock]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_pairing_stock] as
Select a.* from sms_view_pairing a
where a.AccountId=0 and a.Status=1
GO
