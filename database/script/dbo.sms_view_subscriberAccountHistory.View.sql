USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_subscriberAccountHistory]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_subscriberAccountHistory] as
select y.Id,y.CustomerId,y.SubscriberName,y.Operator,y.Area,y.MobileNo,y.smartcardNo  as smartcardNo,OperatorId,
y.STbno as Stbno,y.Description ,y.InsertedOn,y.FID,y.SubscriberId from (
select ROW_NUMBER() over(Partition by FID order by Id desc) as RID ,x.*  from(
select a.Id as Id,a.FID ,b.CustomerId as CustomerId,b.SubscriberName as SubscriberName,b.Operator,b.OperatorId ,a.InsertedOn
,b.Area as Area,b.AreaId as Areaid,b.MobileNo,a.Deleted  ,a.DMLAction as DMLaction
,ISNULL(c.SmartcardNo,'PairingDel') AS SmartcardNo ,Isnull(c.STBNo,'PairingDel') as STBNo,a.CreatedOn as CreatedOn,Case When a.DMLAction=1 and a.Status=1 then 'Active'
when a.DMLAction=4 then 'Disconnected' when a.DMLAction=3 and a.deleted =1 then 'Disconnected' when a.DMLAction=2 and a.status=0 then 'Suspended'
when a.DMLAction=2 and a.status=1  then 'Active' end as Description,b.Id as SubscriberId
from SMS_SUBSCRIBERACCOUNTS_HISTORY a
left join sms_view_subscribers b on a.SubscriberId=b.Id
left join sms_view_pairing_his c on a.PairingId=c.FId
where 1=1 ) x )y where RID =1
GO
