USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_branch]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_branch] as

select a.SocietyCode,a.SocietyName,a.AreaId,b.AREACODE,b.Name as AreaName,b.AREACASCODE,b.OperatorId,b.Operator,b.OperatorCode,b.ParentOperatorId,b.ParentOperator,b.Branch,b.BranchId from SMS_SOCIETY_MASTER a

left outer join sms_view_area b on a.areaId=b.id
GO
