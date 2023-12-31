USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_d_subscriber_state]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[sms_view_d_subscriber_state] as
select a.*,b.FormNo,(select count(BouqueId) from PRP_ACCOUNTTRANSACTION where AccountId=a.id) as BouqueCount,b.CustomerId,b.OperatorId,
b.SocietyId,b.MobileNo,b.ProspectId,b.PCustomerId,b.DetailId,b.DOB,b.OCCUPATION,b.SubscriberName,
b.FName,b.LName,b.Mname,b.FlatNo,b.FloorNo,b.Wing,b.Building,b.Address,b.Gender,b.Zipcode,b.Email,b.Phone,
b.Operator,b.ParentOperatorId,b.TobeBilled,b.ParentOperator,b.AreaId,b.Area as  AreaName,b.SocietyName,b.SocietyCode,
case when a.Status=1 and a.ApplicableRate=1 and a.BoxType=1 then 'MHDActive' 
when a.Status=1 and a.ApplicableRate=1 and a.BoxType=0 then 'MSDActive' 
when a.Status=1 and a.ApplicableRate=0 and a.BoxType=0 then 'ESDActive' 
when a.Status=1 and a.ApplicableRate=0 and a.BoxType=1 then 'EHDActive' 
when a.Status=0 and a.ApplicableRate=1 and a.BoxType=1 then 'MHDInActive' 
when a.Status=0 and a.ApplicableRate=1 and a.BoxType=0 then 'MSDInActive' 
when a.Status=0 and a.ApplicableRate=0 and a.BoxType=0 then 'ESDInActive' 
when a.Status=0 and a.ApplicableRate=0 and a.BoxType=1 then 'EHDInActive' end as [State]
from sms_view_digital_accounts a 
left join sms_view_subscribers b on a.SubscriberId=b.Id where b.Id is not null
GO
