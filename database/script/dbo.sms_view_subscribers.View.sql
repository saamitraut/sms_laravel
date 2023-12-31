USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_subscribers]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_subscribers] as  
Select a.*,b.Id as DetailId,b.DOB,b.OCCUPATION,b.FName+space(1)+b.Mname+space(1)+b.LName as SubscriberName,b.FName,b.LName,b.Mname,b.FlatNo,b.FloorNo,b.Wing,
b.Building,b.Address,b.Gender,b.Verify,b.Zipcode,b.Email,b.Phone,b.photoprooftype,b.photoprooffilename,b.addressprooftype,b.addressprooffilename   
,c.Name as Operator,case when c.ParentId<1 then c.Id else c.ParentId end as ParentOperatorId,c.TobeBilled,c.Branch as BranchName,c.BranchId,
case c.ParentId when 0 then '-' when -1 then 'MRMPL'  else c.ParentOperator end as ParentOperator,c.Code as OperatorCode,c.ParentOpCode
,d.AREACODE,d.AreaId,d.AreaName as Area,d.SocietyName,d.SocietyCode,b.billingAddress from SMS_SUBSCRIBERS a  
left outer join SMS_SUBSCRIBERS_DETAILS b on a.Id=b.SubscriberId  
left outer join sms_view_operator c on  a.OperatorId=c.Id   
left outer join [sms_view_society] d on a.SocietyId=d.Id 
GO
