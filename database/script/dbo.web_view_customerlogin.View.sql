USE [MNSMS]
GO
/****** Object:  View [dbo].[web_view_customerlogin]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE view [dbo].[web_view_customerlogin] as

select a.*,b.MobileNo,b.FormNo,b.FName,b.SubscriberName,b.FlatNo,b.FloorNo,b.Wing,b.Building,b.Address,
b.Gender,b.Zipcode,b.Email,b.Phone,b.Operator,b.AreaId,b.Area,b.SocietyName,b.SocietyCode

from WEB_SUBSCRIBERLOGIN a

left outer join sms_view_subscribers b on a.SubscriberId=b.Id

where b.Id is not null
GO
