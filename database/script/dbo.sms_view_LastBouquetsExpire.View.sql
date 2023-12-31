USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_LastBouquetsExpire]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_LastBouquetsExpire] as



select c.Id ,d.id as Subscriberid,d.CustomerId,d.SubscriberName,d.Address,d.BranchId,d.Operator,
d.OperatorId,d.AreaId,d.Area,d.SocietyId,d.SocietyName,d.MobileNo,c.IsPrimary,c.Status,c.SmartcardNo,c.STBNo,
BouqueName=(cast(STUFF(( Select '~'+b.BouqueName from PRP_ACCOUNTTRANSACTION_HISTORY t
left join PRP_BOUQUE b on t.BouqueId=b.id 
where t.Remark='Expire Bouquet Remove'  and  t.AccountId=a.AccountId 
group by b.BouqueName for XML Path('')),1,1,' ') as text) ),
a.ActivationDate,a.DeactivationDate,dbo.fn_datediff(a.DeactivationDate,cast(Getdate() as date)) as DaysCount,
d.ParentOperatorId,d.OperatorCode,c.CASTYPE
from (select ROW_NUMBER()over(Partition by Accountid order by InsertedOn desc) as 
Rid,AccountId,BouqueId,ActivationDate,DeactivationDate from PRP_ACCOUNTTRANSACTION_HISTORY where DMLAction=1) a
left join sms_view_SubscriberAccountList c on a.AccountId=c.id
left join sms_view_subscribers d on c.SubscriberId=d.Id
where a.Rid=1 and a.AccountId in (select distinct id from sms_view_SubscriberAccountList)
and a.DeactivationDate<CAST(getDate()  as date)
GO
