USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_his_subscriber_1]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_his_subscriber_1] as
select Row_number()Over(PARTITION By a.FID order by a.Id desc )as RID,a.*
,c.Operator as Operator,c.ParentOperatorId  as ParentOperatorId,c.ParentOperator,c.AreaId,c.AreaName as Area,
c.SocietyName,c.SocietyCode,c.Branch,c.BranchId
from SMS_SUBSCRIBERS_HISTORY a
left outer join sms_view_society c on a.SocietyId=c.Id
GO
