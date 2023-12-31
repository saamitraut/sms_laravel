USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_all_psubscribers]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_all_psubscribers] as
Select a.Id,(Select max(Id) from SLA_PROSPETSUBSCRIBERS_HISTORY where FId=a.Id) as FId,a.FormNo,a.PCustomerId,a.OperatorId,a.SocietyId,a.MobileNo,a.Status,a.IsConfirmed,a.ConfirmedOn,a.ConfirmedBy,a.RecieptNo,a.RecieptDate,a.NewSubscriberId,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,a.Deleted,a.Remark,
a.sla_id
,b.Id as DetailId,b.DOB,b.OCCUPATION,
b.FName+space(1)+b.Mname+space(1)+b.LName as SubscriberName,b.FName,b.LName,b.Mname,
b.FlatNo,b.FloorNo,b.Wing,b.Building,b.Address,b.Gender,b.Zipcode,b.Email,b.Phone 
,c.Name as Operator,case when c.ParentId<1 then c.Id else c.ParentId end as ParentOperatorId,
c.TobeBilled
,case c.ParentId when 0 then '-' when -1 then 'ICC'  else c.ParentOperator end as ParentOperator
,d.AreaId,d.AreaName as Area,d.SocietyName,d.SocietyCode
,ISNULL(e.LOGINID,'') as ConfirmedByLogin,ISNULL(f.LOGINID,'') as AddedBy 
from  SLA_PROSPETSUBSCRIBERS a
left outer join SLA_PROSPETSUBSCRIBERS_DETAILS b on a.Id=b.ProspectId 
left outer join SLA_ACCESS e on a.ConfirmedBy=e.ID
left outer join SLA_ACCESS f on a.CreatedBy=f.ID
left outer join sms_view_operator c on  a.OperatorId=c.Id 
left outer join [sms_view_society] d on a.SocietyId=d.Id
union 
Select a.FId as Id,a.Id as Hid,a.FormNo,a.PCustomerId,a.OperatorId,a.SocietyId,a.MobileNo,a.Status,a.IsConfirmed,a.ConfirmedOn,a.ConfirmedBy,a.RecieptNo,a.RecieptDate,a.NewSubscriberId,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,a.Deleted,a.Remark,a.sla_id
,b.Id as DetailId,b.DOB,b.OCCUPATION,b.FName+space(1)+b.Mname+space(1)+b.LName as SubscriberName,b.FName,b.LName,b.Mname,b.FlatNo,b.FloorNo,b.Wing,b.Building,b.Address,b.Gender,b.Zipcode,b.Email,b.Phone 
,c.Name as Operator,case when c.ParentId<1 then c.Id else c.ParentId end as ParentOperatorId,c.TobeBilled
,case c.ParentId when 0 then '-' when -1 then 'ICC'  else c.ParentOperator end as ParentOperator,d.AreaId,d.AreaName as Area,d.SocietyName,d.SocietyCode
,ISNULL(e.LOGINID,'') as ConfirmedByLogin,ISNULL(f.LOGINID,'') as AddedBy 
from  SLA_PROSPETSUBSCRIBERS_HISTORY a
left outer join SLA_PROSPETSUBSCRIBERS_DETAILS_HISTORY b on a.FId=b.ProspectId and b.DMLAction=4
left outer join SLA_ACCESS e on a.ConfirmedBy=e.ID
left outer join SLA_ACCESS f on a.CreatedBy=f.ID
left outer join sms_view_operator c on  a.OperatorId=c.Id 
left outer join [sms_view_society] d on a.SocietyId=d.Id
where a.deleted=1
GO
