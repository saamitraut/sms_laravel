USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_archived_subscriber]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[sms_view_archived_subscriber] as
select a.*,b.Fid as DetailId,b.DOB,b.OCCUPATION,b.FName+space(1)+b.Mname+space(1)+b.LName as SubscriberName,b.FName,b.LName,b.Mname,b.FlatNo,b.FloorNo,b.Wing,b.Building,b.Address,b.Gender,b.Zipcode,b.Email,b.Phone
,c.Operator as Operator,c.ParentOperatorId  as ParentOperatorId,c.ParentOperator,c.AreaId,c.AreaName as Area,
c.SocietyName,c.SocietyCode,c.Branch,c.BranchId
from 
(select Row_number()Over(PARTITION By FID order by InsertedOn desc,Id desc )as RID,* from SMS_SUBSCRIBERS_HISTORY )a
left outer join (select Row_number()Over(PARTITION By SubscriberId order by InsertedOn desc,Id desc )as RID,* from SMS_SUBSCRIBERS_DETAILS_HISTORY )b on a.FId=b.SubscriberId and b.RID=1
left outer join sms_view_society c on a.SocietyId=c.Id where a.RID=1


GO
