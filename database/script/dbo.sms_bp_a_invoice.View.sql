USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_bp_a_invoice]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_bp_a_invoice] as
select a.*,b.TVId,c.FormNo,c.CustomerId,c.OperatorId,c.SocietyId,c.MobileNo,c.SubscriberName,c.FlatNo,c.FloorNo
,c.Wing,c.Building,c.Address,c.Gender,c.Zipcode,c.Phone,c.Operator,c.ParentOperatorId,c.ParentOperator,c.AreaId,c.Areacode,c.AreaName,c.SocietyName
,c.SocietyCode from SMS_B_A_INVOICE a
left outer join SMS_SUBSCRIBERS_ANALOG_ACCOUNTS_HISTORY b on a.HAccountId=b.Id
left outer join sms_view_subscribers_h c on a.HSubscriberId=c.Id
GO
