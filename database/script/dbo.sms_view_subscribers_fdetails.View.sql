USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_subscribers_fdetails]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_subscribers_fdetails] as
Select a.*,b.Id as DetailId,b.FName+space(1)+b.Mname+space(1)+b.LName as SubscriberName,b.FName,b.LName,b.Mname,b.FlatNo,b.FloorNo,b.Wing,b.Building,b.Address,b.Gender,b.Zipcode,b.Email,b.Phone 
,c.Name as Operator,case c.ParentId when 0 then c.Id else c.ParentId end as ParentOperatorId
,case c.ParentId when 0 then '-' else c.ParentOperator end as ParentOperator,d.AREACODE as Area,d.SocietyName,e.SmartcardNos,e.SCStbNos,e.StbNos,isnull(e.Accounts,0) as DigitalAccounts
,(Select COUNT(Id) from SMS_SUBSCRIBERS_ANALOG_ACCOUNTS where SubscriberId=a.Id) as AnalogAccounts
from  SMS_SUBSCRIBERS a
left outer join SMS_SUBSCRIBERS_DETAILS b on a.Id=b.SubscriberId
left outer join sms_view_operator c on  a.OperatorId=c.Id 
left outer join [sms_view_society] d on a.SocietyId=d.Id
left outer join 
(
select SubscriberId,
SmartcardNos=cast(substring 
                          ((SELECT     ('~' + t.SmartcardNo)
                              FROM         sms_view_pairing t
                              WHERE     t.SubscriberId= a.SubscriberId
                              ORDER BY Id FOR XML PATH('')),2,8000) as varchar(8000))
,StbNos=cast(substring 
                          ((SELECT     ('~' + t.STBNo)
                              FROM         sms_view_pairing t
                              WHERE     t.SubscriberId= a.SubscriberId
                              ORDER BY Id FOR XML PATH('')),2,8000) as varchar(8000))
,SCStbNos=cast(substring 
                          ((SELECT     ('~' + t.SmartcardNo+'-'+t.STBNo)
                              FROM         sms_view_pairing t
                              WHERE     t.SubscriberId= a.SubscriberId
                              ORDER BY Id FOR XML PATH('')),2,8000) as varchar(8000)),COUNT(Id) as Accounts
from SMS_SUBSCRIBERACCOUNTS a group by SubscriberId
) e on e.SubscriberId=a.Id
GO
