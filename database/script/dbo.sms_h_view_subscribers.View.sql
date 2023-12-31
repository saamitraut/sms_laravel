USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_h_view_subscribers]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_h_view_subscribers] as
select 
a.Id,(Select MAX(Id) from SMS_SUBSCRIBERS_HISTORY where FId=a.id) as HID
,a.FormNo,a.CustomerId,a.OperatorId,a.SocietyId,b.Areaid,b.SocietyCode,b.SocietyName,b.AreaName,a.MobileNo,a.Status,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,a.Deleted,a.Remark,a.sms_id
,c.CODE as OperatorCode,c.NAME as OperatorName,c.Branch,c.ParentOperator,c.BranchId,c.ParentId as ParentOperatorId,a.OpTobeBilled
 from SMS_SUBSCRIBERS a 
 left outer join sms_view_society b on a.SocietyId=b.Id
 left outer join sms_view_operator c on a.OperatorId=c.Id
union 
select 
a.FId,a.Id as HID
,a.FormNo,a.CustomerId,a.OperatorId,a.SocietyId,b.Areaid,b.SocietyCode,b.SocietyName,b.AreaName,a.MobileNo,a.Status,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,
a.Deleted,a.Remark,a.sms_id ,c.CODE as OperatorCode,c.NAME as OperatorName,c.Branch,c.ParentOperator,c.BranchId,c.ParentId as ParentOperatorId,a.OpTobeBilled
from SMS_SUBSCRIBERS_HISTORY a
 left outer join sms_view_society b on a.SocietyId=b.Id
 left outer join sms_view_operator c on a.OperatorId=c.Id
where a.Deleted=1
GO
