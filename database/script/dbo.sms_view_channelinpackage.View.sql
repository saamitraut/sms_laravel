USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_channelinpackage]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_channelinpackage] as
select a.*,c.PackageName,c.CasCode as PackageCasCode from 
sms_view_packvschan a
left outer join SMS_PACKAGE c on c.Id=a.PackageId


GO
