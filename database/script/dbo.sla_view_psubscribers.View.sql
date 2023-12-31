USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_psubscribers]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_psubscribers] as
Select a.*,b.Id as DetailId,b.DOB,b.OCCUPATION,b.FName+space(1)+b.Mname+space(1)+b.LName as SubscriberName,b.FName,b.LName,b.Mname,b.FlatNo,b.FloorNo,b.Wing,b.Building,b.Address,b.Gender,b.Zipcode,b.Email,b.Phone 
,c.Name as Operator,case when c.ParentId<1 then c.Id else c.ParentId end as ParentOperatorId,c.TobeBilled
,case c.ParentId when 0 then '-' when -1 then 'ICC'  else c.ParentOperator end as ParentOperator,d.AreaId,d.AreaName as Area,d.SocietyName,d.SocietyCode
from  SLA_PROSPETSUBSCRIBERS a
left outer join SLA_PROSPETSUBSCRIBERS_DETAILS b on a.Id=b.ProspectId
left outer join sms_view_operator c on  a.OperatorId=c.Id 
left outer join [sms_view_society] d on a.SocietyId=d.Id
GO
