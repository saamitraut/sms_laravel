USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_archived_accounts_details]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[sms_view_archived_accounts_details] as
select a.*,
b.FormNo,b.CustomerId,b.OperatorId,b.SocietyId,b.MobileNo,b.DOB,b.OCCUPATION,b.SubscriberName,b.FName,b.LName,b.Mname,b.FlatNo,b.FloorNo,b.Wing,b.Building,b.Address,b.Gender,b.Zipcode,b.Email,b.Phone,b.Operator,b.ParentOperatorId,b.ParentOperator,b.AreaId,b.Area,b.SocietyName,b.SocietyCode,b.Branch,b.BranchId
from sms_view_archived_accounts a
left outer join sms_view_archived_subscriber b on a.SubscriberId=b.FID
GO
