USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_areawisestbcount]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_areawisestbcount] as
Select isnull(d.Id,0) as AccountId,isnull(d.SubscriberId,0) as SubscriberId ,d.[Status] as AccStatus,
case when d.[Status]=1 then 'Active' else 'Inactive' end as AccountStatus,
s.CustomerId,s.OperatorId,so.Id as SocietyId,so.AreaId,ar.AREACODE,ISNULL(d.UpdatedOn,d.CreatedOn) as ActionDate,
b.BrandTitle,case when b.BoxType=0 then 'SD' else 'HD' end as BoxType,
case when d.ActionTaken=1 and b.BoxType=0 then 'SDACTIVE' when d.ActionTaken=1 and b.BoxType=1 then 'HDACTIVE'
 when d.ActionTaken=2 and b.BoxType=0 then 'SDINACTIVE'  else 'HDINACTIVE' end as BOXAccStatus
from SMS_PAIRING_HISTORY a 
left join SMS_STBS sb on a.StbId=sb.Id
left join SMS_STBSCBRAND b on b.Id=sb.BrandId
left outer join SMS_SUBSCRIBERACCOUNTS_HISTORY d on a.Id=d.PairingId
left outer join SMS_SUBSCRIBERS_HISTORY s on s.Id=d.SubscriberId
left outer join SMS_SOCIETY_MASTER so on so.Id=s.SocietyId
left outer join SMS_AREACODE ar on ar.Id=so.AreaId
where d.SubscriberId is not null
GO
