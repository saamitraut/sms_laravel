USE [MNSMS]
GO
/****** Object:  View [dbo].[cp_customer_profile]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[cp_customer_profile] as
Select a.Id as id,a.CustomerId as customer_id,b.FName+space(1)+b.Mname+space(1)+b.LName as name,
b.Phone as phone,a.MobileNo as mobile1,null as mobile2,b.Email as email,b.Address as address,null as mso_code,a.OperatorId as operator_id,c.Name as operator,
d.AreaId as area_id,d.AreaName as area,a.SocietyId as society_id,d.SocietyName as society, 'INDIVIDUAL' as is_corporate,
'-' as type,RTRIM(LTRIM(REPLACE(UPPER(c.Branch),'MSO',''))) as company,1 as is_pay_allow,1 as is_allowed 
from SMS_SUBSCRIBERS a left outer join SMS_SUBSCRIBERS_DETAILS b on a.Id=b.SubscriberId
left outer join sms_view_operator c on  a.OperatorId=c.Id
left outer join sms_view_society d on a.SocietyId=d.Id
GO
