USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_inactive_trans_renew]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_view_inactive_trans_renew]

as

select x.FID as Id,x.AccountId,x.BouqueId,x.ActivationDate,x.DeActivationDate,x.CreatedOn,x.CreatedBy,bou.BouqueName,bou.Rate,c.SmartcardNo,c.STBNo,c.CASTYPEId,

case when s.FName!='0' then s.Fname else '' end+' '+case when s.MName!='0' then s.MName else '' end+' '+case when s.LName!='0' then s.LName else '' end 

as SubscriberName,s.CustomerId,s.Operator,s.OperatorId,c.PairingId,s.OperatorCode,c.CASTYPE 

from

(select row_number() over (partition by AccountId,BouqueId order by Id desc) as rid,* from PRP_ACCOUNTTRANSACTION_HISTORY where DMLAction not in (3,4)
)x

--left outer join prp_account_prepaidbouquets b on x.BouqueId=b.BouqueId and x.AccountId=b.AccountId

left outer join sms_view_subscriberaccountlist c on c.Id=x.AccountId

left outer join sms_view_subscribers s on s.Id=c.SubscriberId

left outer join prp_view_bouques bou on bou.Id=x.BouqueId

where x.rid=1 and x.Deactivationdate between dateadd(D,-10,getdate()) and getdate() 
--b.Id is null 
and c.Id is not null and bou.Status=1 and bou.PackageId!='0' 
GO
