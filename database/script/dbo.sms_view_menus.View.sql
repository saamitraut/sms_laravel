USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_menus]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_menus] as
select *,LEN(Label) as Width from SMS_MENU
GO
