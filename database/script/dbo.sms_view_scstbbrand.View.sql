USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_scstbbrand]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[sms_view_scstbbrand] as
Select a.*,b.CASNAME from SMS_STBSCBRAND a
left outer join SMS_CAS_TABLE b on a.CASTYPEID=b.ID
GO
