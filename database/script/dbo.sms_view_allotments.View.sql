USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_allotments]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_allotments] as 
select a.*,s.CustomerId,s.FormNo,s.OperatorId,s.SocietyId,s.SubscriberName,s.AreaName,s.AreaId,s.SocietyCode,s.SocietyName,s.FlatNo,s.FloorNo,s.Address
,s.MobileNo,s.Phone,s.Wing,s.Building,s.Email,s.DOB,s.OCCUPATION,s.Zipcode
from [sms_all_digital_account_details] a 
left join [sms_all_view_subscribers] s on s.Id=a.SubscriberId
GO
