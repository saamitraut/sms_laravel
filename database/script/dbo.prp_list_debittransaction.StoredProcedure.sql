USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[prp_list_debittransaction]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[prp_list_debittransaction] @creditId as bigint      
As      
Begin      
 Declare @d as datetime      
 set @d=GETDATE()      
 select a.*,b.AccountId,b.ActivationDate,b.Amount as TranactionAmt,b.BouqueCode,b.BouqueId,b.BouqueName,b.Channels      
 ,b.Packages,b.DeactivationDate,b.Rate,b.ExpStatus into #t from PRP_OPERATOR_CREDIT_TRANSACTION a      
 left outer join prp_account_prepaidbouquets_all b on a.TransactionId=b.Id      
 where a.TransactionType=1  and b.Id is not null      
 and a.CreditId=@creditId      
       
 select a.*,b.SubscriberId,b.SmartcardNo,b.STBNo into #t1 from #t a      
 left outer join sms_all_digital_account_details b on a.AccountId=b.Id      
       
 select a.*,b.CustomerId,b.SubscriberName into #t2 from #t1 a      
 left outer join sms_view_subscribers b on a.SubscriberId=b.Id       
       
 select Id,TransactionNo,Amount as DebitAmount,TranactionAmt as Amount,RefundAmt,CustomerId,SmartcardNo,BouqueName,     
 Rate,ActivationDate,DeactivationDate,CreatedOn,CreatedBy from #t2  order by Id desc      
 End 
GO
