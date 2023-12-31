USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_h_view_digital_accounts_details]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_h_view_digital_accounts_details]
as
select a.*,b.AreaName,b.Areaid,b.CustomerId,b.FormNo,b.MobileNo,b.OperatorId,b.SocietyCode,b.SocietyId,b.SocietyName,b.OperatorName,b.Branch,b.BranchId,b.ParentOperatorId
,c.Address,c.Building,c.FName+space(1)+c.Mname+space(1)+c.LName as SubscriberName,c.FlatNo,c.FloorNo,c.Gender,c.Phone,c.Wing,c.Zipcode
 from sms_all_digital_account_details a
left outer join  sms_h_view_subscribers b on  a.SubscriberId=b.Id
left outer join sms_h_view_subscribers_details c on b.Id=c.SubscriberId and a.SubscriberId=c.SubscriberId
GO
