USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[sms_pack_alaca_active_agening]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sms_pack_alaca_active_agening] @date as date=NULL
as  
begin

IF (@date IS NULL)  
SET @date = CAST(GETDATE() AS DATE)
  
Delete from SMS_PACK_ALACA_ACTIVE_AGEING where Convert(varchar(10),CreatedOn,120)=@date;  
Delete from SMS_PACK_ALACA_ACTIVE_AGEING_DATA where Convert(varchar(10),GeneratedOn,120)=@date;

select * into #acc_his from(select ROW_NUMBER()over(Partition By FID Order by Id desc) as RID ,
* from SMS_SUBSCRIBERACCOUNTS_HISTORY where cast(InsertedOn as DATE)<=@date)x where RID=1  
  
--select * into #trans_his from(select ROW_NUMBER()over(Partition By FID Order by Id desc) as RID ,
--* from PRP_ACCOUNTTRANSACTION_HISTORY where cast(InsertedOn as DATE)<=@date)x where RID=1
  
--select * into #trans from #trans_his where AccountId in (select FID from #acc_his where Deleted=0 and DMLAction!=4 and Status=1)

select * into #t_pack_cl_prp_1 from (select ROW_NUMBER()over(Partition by FID,AccountId,BouqueId,ActivationDate 
order by Insertedon desc,id desc) as RID,Id,FID,AccountId,BouqueId,ActivationDate,DeactivationDate,Deleted,DMLAction,
'PrePaid' as ConnectionType,Insertedon,Status,InsertedBy,Remark,DMLComments
from PRP_ACCOUNTTRANSACTION_HISTORY
where  cast(InsertedOn as DATE)<=@date)x where RID=1

select a.Id,a.AccountId,a.Deleted,a.DMLAction,isnull(b.PackageId,0) as PackageId,
isnull(b.ChannelId,0) as ChannelId,a.ConnectionType,a.FID,0 as Flag,Insertedon,
a.ActivationDate,a.DeactivationDate,a.Status,a.InsertedBy,a.Remark,a.DMLComments
into #t_pack_cl_prp from #t_pack_cl_prp_1 a left join PRP_BOUQUE_ASSETS b on a.BouqueId=b.BouqueId

  
select * into #trans_Active from (select ROW_NUMBER()over(Partition By PackageId,ChannelId,AccountId Order by Id desc) as PRID,
DATEDIFF(DAY,cast(InsertedOn as DATE),cast(@date as Date)) as DaysActive,@date as GeneratedOn,* from #t_pack_cl_prp)x  
where PRID=1 and (Deleted=0 and DMLAction!=4) order by AccountId,PackageId,ChannelId
  
insert into SMS_PACK_ALACA_ACTIVE_AGEING_DATA(DaysActive,Id,FID,CustomerId,SubscriberName,SmartcardNo,STBNo,AccountId,
ProductId,IsAlacarte,ActivationDate,DeactivationDate,Flag,Status,CreatedOn,CreatedBy,Deleted,Remark,InsertedOn,InsertedBy,DMLAction,DMLComments,
GeneratedOn)  
select x.DaysActive,x.Id,x.FID,s.CustomerId,s.SubscriberName,a.SmartcardNo,a.STBNo,x.AccountId,
case when ChannelId=0 then PackageId else ChannelId end as ProductId ,
case when ChannelId=0 then 0 else 1 end AS IsAlacarte,  
x.ActivationDate,x.DeactivationDate,x.Flag,x.Status,x.Insertedon,x.InsertedBy,x.Deleted,x.Remark,x.InsertedOn,x.InsertedBy,  
x.DMLAction,x.DMLComments,x.GeneratedOn from #trans_Active x  
 left join sms_view_SubscriberAccountList a on x.AccountId=a.Id  
 left join sms_view_subscribers s on s.Id=a.SubscriberId
   
select Count(*) as NoAccs,AgeingDays,PackageId,ChannelId into #t_Active from(  
select Case when DaysActive<=30 then 'D30' when DaysActive<=60 then 'D60' else 'D90' end as AgeingDays,* from #trans_Active ) x  
group by AgeingDays,PackageId,ChannelId
  
select * into #t_f from(  
select a.*,b.PackageName,b.CasCode as ProductId from #t_Active a  
left outer join SMS_PACKAGE b on a.PackageId=b.Id where (a.ChannelId=0 or ChannelId is null ) and b.Id is not null  
Union  
select a.*,b.ChannelName,b.CasCode as ProductId from #t_Active a  
left outer join SMS_CHANNEL b on a.ChannelId=b.Id where (a.PackageId=0 or PackageId is null ) and b.Id is not null
)x

SELECT PackageName,ProductId as ProductId,ChannelId,PackageId,isnull([D30],0) as [30 Days],isnull([D60],0) as [60 Days], isnull([D90],0) as [90 Days] 
into #total_rep FROM #t_f   
PIVOT ( sum(NoAccs) FOR AgeingDays IN ([D0],[D30],[D60],[D90])   
)AS p order by ChannelId  
  
insert into SMS_PACK_ALACA_ACTIVE_AGEING (PackageName,CasCode,IsAlacarte,ProductId,thirtyDays,sixtydays,nintydays,CreatedOn)  
select PackageName,ProductId as ProductId,case when ChannelId=0 then 0 else 1 end as IsAlacarte,case when ChannelId=0 then PackageId else ChannelId end as PackageId,[30 Days],[60 Days],[90 Days],@date from #total_rep  
End
GO
