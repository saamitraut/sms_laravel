USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[X_prp_Conax_Activate_bulk]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[X_prp_Conax_Activate_bulk] as 
begin
select * into #tempConaxActivate     
 from SMS_SUBSCRIBERTRANSACTIONS where DeactivationDate >GETDATE() and status=1 and cas_status=1     
 and AccountId in (select distinct AccountId  from tempConax)    
   
 Declare @accId as bigint  
 Declare @ProductId as bigint  
 Declare @IsAlacarte as int  
 while(exists(select * from tempConax where Stat=0))  
 begin  
  Select Top 1 @accId=AccountId,@ProductId=ProductId,@IsAlacarte=IsAlacarte from tempConax where Stat=0  
    
  If(exists(Select * from #tempConaxActivate where AccountId=@accId and ProductId=@ProductId and IsAlacarte=@IsAlacarte))  
  Begin  
     
   Insert into ConaxCommandLog (CommandName,AccountId,SmartcardNo,STBNo,PackageId,AlacarteId,ProductCode,ActivationDate,DeActivationDate,Request,CreatedOn,CreatedBy)  
   select 'ADD_SUBSCRIPTIONS' as CommandName,a.AccountId,b.SmartcardNo,b.STBNo,case when a.IsAlacarte=0 then a.ProductId else 0 end  as PackageId,  
   case when a.IsAlacarte=1 then ProductId else 0 end  as AlacarteId,a.CasCodeConax as ProductCode,  
   convert(varchar(19),cast(dbo.getFirstDate(min(a.ActivationDate)) as datetime),120) as ActivationDate,  
   Left(convert(varchar(19),cast(dbo.GetLastDate(min(a.DeActivationDate))as datetime),120),10)+' 23:59:59' as DeactivationDate,null,getdate(),-2  
   from sms_view_all_transaction a   
   left outer join sms_view_subscriberaccountlist b on a.AccountId=b.Id  
   where a.AccountId=@accId and a.ProductId=@ProductId and a.IsAlacarte=@IsAlacarte and a.Id in (Select Id from #tempConaxActivate)  
   group by a.AccountId,b.SmartcardNo,b.STBNo,a.IsAlacarte,a.CasCodeConax,a.ProductId  
   order by b.SmartcardNo asc
     
  End  
    
  Update tempConax set Stat=1 where AccountId=@accId and ProductId=@ProductId and IsAlacarte=@IsAlacarte   
 end  
   
 end
GO
