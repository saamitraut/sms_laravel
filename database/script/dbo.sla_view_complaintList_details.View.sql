USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_complaintList_details]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_complaintList_details] as 
Select a.*,isnull(b.CustomerId,'N/A') as CustomerId,isnull(c.PCustomerId,'N/A') as PCustomerId,
isnull(b.FormNo,c.FormNo) as FormNo,
isnull(b.OperatorId,c.OperatorId) as OperatorId,
isnull(b.SocietyId,c.SocietyId) as SocietyId,
isnull(b.Areaid,c.Areaid) as Areaid,
isnull(b.SocietyCode,c.SocietyCode) as SocietyCode,
isnull(b.SocietyName,c.SocietyName) as SocietyName,
isnull(b.AreaName,c.Area) as AreaName,
isnull(b.MobileNo,c.MobileNo) as MobileNo,
isnull(b.Status,c.Status) as SubscriberStatus,
isnull(b.CreatedOn,c.CreatedOn) as SAddedOn,
isnull(b.CreatedBy,c.CreatedBy) as SAddedBy,
isnull(b.SubscriberName,c.SubscriberName) as SubscriberName,
isnull(b.FlatNo,c.FlatNo) as FlatNo,
isnull(b.FloorNo,c.FloorNo) as FloorNo,
isnull(b.Wing,c.Wing) as Wing,
isnull(b.Building,c.Building) as Building,
isnull(b.Address,c.Address) as Address,
isnull(b.Zipcode,c.Zipcode) as Zipcode,
isnull(b.Phone,c.Phone) as Phone,
isnull(b.Operator,c.Operator) as Operator,
isnull(b.ParentOperatorId,c.ParentOperatorId) as ParentOperatorId,
isnull(b.ParentOperator,c.ParentOperator) as ParentOperator,
isnull(b.deleted,c.Deleted) as IsDeleted,
(Select COUNT(*)from SLA_COMPLAINTREPLY where ComplaintId=a.id) as ReplyCnt
from sla_view_complaintList a 
left join sms_all_view_subscribers b on b.Id=a.SubscriberId
left join [sla_view_all_psubscribers] c on c.Id=a.ProspectId
where isnull(b.Id,c.Id) is not null
GO
