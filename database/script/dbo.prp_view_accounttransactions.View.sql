USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_accounttransactions]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_view_accounttransactions] as
select x.* from (select Id,AccountId, Rate,Amount,BouqueId,ActivationDate,DeactivationDate,CreatedOn,UpdatedOn from PRP_ACCOUNTTRANSACTION         
union        
select FID as Id,AccountId,Rate,Amount,BouqueId,ActivationDate,DeactivationDate,CreatedOn,UpdatedOn from PRP_ACCOUNTTRANSACTION_HISTORY       
where DMLAction=3) x where x.AccountId in (select Id from SMS_SUBSCRIBERACCOUNTS)
GO
