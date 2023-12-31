USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_area]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_area] as
 select a.*,b.CODE as OperatorCode,b.TobeBilled,b.NAME as Operator,
 b.ParentId as ParentOperatorId,b.ParentOperator,b.Branch,b.BranchId from SMS_AREACODE a
 left outer join sms_view_operator b on a.OperatorId=b.ID
GO
