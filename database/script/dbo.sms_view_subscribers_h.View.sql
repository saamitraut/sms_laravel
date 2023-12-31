USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_subscribers_h]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_subscribers_h] as
Select a.*,a.FId as SubscriberId,b.Id as DetailId,isnull(b.FName,'')+space(1)+isnull(b.Mname,'')+space(1)+isnull(b.LName,'') as SubscriberName,b.FName,b.LName,b.Mname,b.FlatNo,b.FloorNo,b.Wing,b.Building,b.Address,b.Gender,b.Zipcode,b.Email,b.Phone 
,c.Name as Operator,case c.ParentId when 0 then c.Id else c.ParentId end as ParentOperatorId
,case c.ParentId when 0 then '-' else c.ParentOperator end as ParentOperator,d.AreaId,d.AREACODE,d.AreaName,d.SocietyName,d.SocietyCode
from  SMS_SUBSCRIBERS_HISTORY a
left outer join SMS_SUBSCRIBERS_DETAILS b on a.FID=b.SubscriberId
left outer join sms_view_operator c on  a.OperatorId=c.Id 
left outer join [sms_view_society] d on a.SocietyId=d.Id
GO
