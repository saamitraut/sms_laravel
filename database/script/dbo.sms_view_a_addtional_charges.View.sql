USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_a_addtional_charges]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_a_addtional_charges] as
 Select a.*,b.ReasonTitle,b.IsLocked from SMS_A_ADDTIONALCHARGES a
 left outer join SMS_REASON_MASTER b on a.ReasonId=b.Id
GO
