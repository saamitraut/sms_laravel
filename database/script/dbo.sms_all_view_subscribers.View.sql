USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_all_view_subscribers]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view[dbo].[sms_all_view_subscribers] as
Select a.Id,a.HID,a.FormNo,a.CustomerId,a.OperatorId,a.SocietyId,a.Areaid,a.SocietyCode,a.SocietyName,a.AreaName,a.MobileNo,a.Status,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,a.Deleted,a.Remark,a.sms_id,
a.OperatorCode,a.OperatorName,a.Branch,
a.BranchId,a.OpTobeBilled as OpTobeBilled,b.Id as DetailId,b.DOB,b.OCCUPATION,b.FName+space(1)+b.Mname+space(1)+b.LName as SubscriberName,b.FName,b.LName,b.Mname,b.FlatNo,b.FloorNo,b.Wing,b.Building,b.Address,b.Gender,b.Zipcode,b.Email,b.Phone 
,a.OperatorName as Operator,case when a.ParentOperatorId<1 then a.OperatorId else a.ParentOperatorId end as ParentOperatorId
,case a.ParentOperatorId when 0 then '-' when -1 then 'SEA'  else a.ParentOperator end as ParentOperator
from  sms_h_view_subscribers a
left outer join sms_h_view_subscribers_details b on a.Id=b.SubscriberId
GO
