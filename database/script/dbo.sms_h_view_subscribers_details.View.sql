USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_h_view_subscribers_details]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_h_view_subscribers_details] as
select 
a.Id,(Select MAX(Id) from SMS_SUBSCRIBERS_DETAILS_HISTORY where FId=a.id) as HID,
a.SubscriberId,a.FName,a.LName,a.Mname,a.FlatNo,a.FloorNo,a.Wing,a.Building,a.Address,a.Gender,
a.Zipcode,a.Email,a.Phone,a.DOB,a.OCCUPATION,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,a.Deleted,a.Remark 
from SMS_SUBSCRIBERS_DETAILS a  
union 
select 
a.FId,a.Id as HID,
a.SubscriberId,a.FName,a.LName,a.Mname,a.FlatNo,a.FloorNo,a.Wing,a.Building,a.Address,a.Gender,a.Zipcode,a.Email,a.Phone,a.DOB,a.OCCUPATION,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,a.Deleted,a.Remark
 from SMS_SUBSCRIBERS_DETAILS_HISTORY a 
where a.Deleted=1
GO
