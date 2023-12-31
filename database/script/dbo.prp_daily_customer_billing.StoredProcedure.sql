USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[prp_daily_customer_billing]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prp_daily_customer_billing]
As
Begin

if(OBJECT_ID('tempdb.dbo.#custtrans') is not null)
drop table #custtrans;
if(OBJECT_ID('tempdb.dbo.#custtrans2') is not null)
drop table #custtrans2;

select * into #custtrans from PRP_ACCOUNTTRANSACTION_HISTORY where DMLAction=1 and FID not in (select distinct PrpTransId FROM CUST_TRANS);

select a.AccountId,c.SubscriberId,c.CustomerId,c.OperatorId,c.Operator,c.smartcardNo,c.Stbno,a.FID as PrpTransId,a.BouqueId,b.BouqueName,
a.ActivationDate,a.DeactivationDate,ROUND(DATEDIFF(D,ActivationDate,DeactivationDate)*(CAST(b.MRP as float)/30),2) as MRP,a.Remark,a.InsertedOn as PrpInsertDate
into #custtrans2 from #custtrans a left join PRP_BOUQUE b on a.BouqueId=b.Id left join sms_view_subscriberAccountHistory c on a.AccountId=c.FID;

INSERT INTO CUST_TRANS(AccountId,SubscriberId,CustomerId,OperatorId,Operator,SmartcardNo,StbNo,PrpTransId,BouqueId,BouqueName,
ActivationDate,DeactivationDate,MRP,Remark,PrpInsertDate,CreatedOn,CreatedBy)
select AccountId,SubscriberId,CustomerId,OperatorId,Operator,SmartcardNo,StbNo,PrpTransId,BouqueId,BouqueName,
ActivationDate,DeactivationDate,MRP,Remark,PrpInsertDate,GETDATE() AS CreatedOn,1 as CreatedBy FROM #custtrans2;

End
GO
