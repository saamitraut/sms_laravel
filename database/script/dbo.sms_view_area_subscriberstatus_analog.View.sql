USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_area_subscriberstatus_analog]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_area_subscriberstatus_analog] as
Select a.*,b.FormNo,b.CustomerId,b.OperatorId,
b.SocietyId,b.MobileNo,b.ProspectId,b.PCustomerId,b.DetailId,b.DOB,b.OCCUPATION,b.SubscriberName,
b.FName,b.LName,b.Mname,b.FlatNo,b.FloorNo,b.Wing,b.Building,b.Address,b.Gender,b.Zipcode,b.Email,b.Phone,
b.Operator,b.ParentOperatorId,b.TobeBilled,b.ParentOperator,b.AreaId,b.Area as  AreaName,b.SocietyName,b.SocietyCode,
case when a.Status=1 and a.ApplicableRate=1 then 'MActive'
	when a.Status=1 and a.ApplicableRate=0 then 'EActive'
	when a.Status=0 and a.ApplicableRate=1 then 'MInActive'
	when a.Status=0 and a.ApplicableRate=0 then 'EInActive'
	end as [State]
from SMS_SUBSCRIBERS_ANALOG_ACCOUNTS a
left outer join sms_view_subscribers b on a.SubscriberId=b.Id
where b.Area is not null
GO
