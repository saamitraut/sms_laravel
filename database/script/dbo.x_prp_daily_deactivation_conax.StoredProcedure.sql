USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[x_prp_daily_deactivation_conax]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
CREATE proc [dbo].[x_prp_daily_deactivation_conax]  as    
Begin    
 --For Conax Boxes    
 --drop table #tempConax  

 if(OBJECT_ID('SMS.dbo.tempConax') is not null)
		drop table  tempConax

 --select a.*,b.CASTYPEID,0 as Stat into tempConax   
 --from SMS_SUBSCRIBERTRANSACTIONS a left outer join sms_view_SubscriberAccountList b on a.AccountId=b.Id     
 --where Day(a.DeactivationDate)=day( GETDATE()) and month(a.DeactivationDate)=month( GETDATE()) and year(a.DeactivationDate)=year( GETDATE()) and a.CAS_STATUS=1
 -- and a.Status=1 and b.CASTYPEID=5     

 if(OBJECT_ID('SMS.dbo.tempConax_actual') is not null)
		drop table  tempConax_actual


 select Max(a.Id) as PRP_ID,  max(a.ActivationDate) as ActivationDate, Max(a.DeactivationDate) as DeactivationDate,AccountId,BouqueId into tempConax_actual
 from PRP_ACCOUNTTRANSACTION a left outer join sms_view_SubscriberAccountList b on a.AccountId=b.Id     
 where a.Status=1 and b.CASTYPEID=5     
group by AccountId,BouqueId
order by DeactivationDate asc

select max(PRP_ID) as PRP_ID,max(a.ActivationDate) as ActivationDate, Max(a.DeactivationDate) as DeactivationDate,AccountId,BouqueId into tempConax   
from tempConax_actual a left outer join sms_view_SubscriberAccountList b on a.AccountId=b.Id     
where Day(a.DeactivationDate)=day( GETDATE()) and month(a.DeactivationDate)=month( GETDATE()) and year(a.DeactivationDate)=year( GETDATE()) 
group by AccountId,BouqueId
order by DeactivationDate asc

      
  
 Insert into ConaxCommandLog (CommandName,AccountId,SmartcardNo,STBNo,PackageId,AlacarteId,ProductCode,ActivationDate,DeActivationDate,Request,CreatedOn,Createdby)  
 select 'CANCEL_SUBSCRIPTIONS' as CommandName,a.AccountId,b.SmartcardNo,b.STBNo,case when a.IsAlacarte=0 then ProductId else 0 end  as PackageId,  
 case when a.IsAlacarte=1 then ProductId else 0 end  as AlacarteId,a.CasCodeConax as ProductCode,  
 convert(varchar(19),cast(dbo.getFirstDate(a.ActivationDate) as datetime),120) as ActivationDate,  
 Left(convert(varchar(19),cast(dbo.GetLastDate(a.DeActivationDate)as datetime),120),10)+' 23:59:59' as DeactivationDate,null,getdate(),-11   
 from sms_view_all_transaction a   
 left outer join sms_view_subscriberaccountlist b on a.AccountId=b.Id  
 where a.PrepaidTransId in (select PRP_ID from tempConax) 
 order by   SmartcardNo asc
     
End
GO
