USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_subscribervsservice]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_subscribervsservice] as 
select a.ID,s.CustomerId,d.FName+SPACE(1)+d.Mname+SPACE(1)+d.LName as SubscriberName,d.LName,d.FName,d.MName,smc.SmartcardNo,stb.STBNo,
 (select min(ActivationDate) from PRP_ACCOUNTTRANSACTION where AccountId=a.Id and DeactivationDate>=cast(getdate() as date)) as ActivationDate,
 (select max(DeactivationDate) from PRP_ACCOUNTTRANSACTION where AccountId=a.Id and DeactivationDate>=cast(getdate() as date)) as DeactivationDate,
 (select sum(Amount) from PRP_ACCOUNTTRANSACTION where AccountId=a.Id and DeactivationDate>=cast(getdate() as date)) as TotalAmount,
 (select count(BouqueId) from PRP_ACCOUNTTRANSACTION where AccountId=a.Id and DeactivationDate>=cast(getdate() as date)) as BouquetCount,
 BouqueName=ltrim(rtrim(cast(substring((SELECT     (','+replace(t.BouName,',',' ')+SPACE(1)) 
 FROM prp_view_account_bouque_transaction t
 WHERE     t.AccountId= a.id ORDER BY Id FOR XML PATH('')),2,8000) as varchar(8000))))
 ,(select NAME from SMS_OPERATOR where s.OperatorId = ID) as OperatorName ,s.OperatorId as OperatorId,cas.CASNAME,
 CASE WHEN a.Status=1 then 'Active' else 'Inactive' end as Status
from SMS_SUBSCRIBERACCOUNTS a 
left join sms_view_pairing p on p.Id=a.PairingId
left join SMS_SMARTCARDS smc on smc.Id=p.SmartCardId 
left join SMS_STBS stb on stb.Id=p.StbId
left join SMS_SUBSCRIBERS s on s.Id=a.SubscriberId
left join SMS_SUBSCRIBERS_DETAILS d on d.SubscriberId=a.SubscriberId
left join SMS_ACCESS ac on ac.ID=a.CreatedBy
left join SMS_CAS_TABLE cas on p.CASTYPEID=cas.ID
where  a.Id in (select AccountId from PRP_ACCOUNTTRANSACTION)
GO
