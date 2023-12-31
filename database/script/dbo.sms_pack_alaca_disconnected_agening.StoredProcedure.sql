USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[sms_pack_alaca_disconnected_agening]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sms_pack_alaca_disconnected_agening] @date as date=NULL
as  
begin

IF (@date IS NULL)  
SET @date = CAST(GETDATE() AS DATE)

select x.* into #accAll from (select ROW_NUMBER()over(Partition by FID order by Id desc) as RID,FID as AccountId,PairingId,SubscriberId
from SMS_SUBSCRIBERACCOUNTS_HISTORY where InsertedOn<@date)x where x.RId=1 

select x.* into #pairAll from (select ROW_NUMBER()over(Partition by FID order by Id desc) as RID,FID as PairingId,SmartCardId,StbId 
from SMS_PAIRING_HISTORY where InsertedOn<@date)x where x.RId=1 

select x.* into #smcAll from (select ROW_NUMBER()over(Partition by SmartcardId order by Id desc) as RID,SmartcardId,SmartcardNo
from SMS_SMARTCARDS_HISTORY where InsertedOn<@date)x where x.RId=1 

select x.* into #stbAll from (select ROW_NUMBER()over(Partition by STBId order by Id desc) as RID,STBId,STBNo
from SMS_STBS_HISTORY where InsertedOn<@date)x where x.RId=1 

select x.* into #subAll from (select ROW_NUMBER()over(Partition by FID order by Id desc) as RID,FID as SubscriberId,CustomerId 
from SMS_SUBSCRIBERS_HISTORY where InsertedOn<@date)x where x.RId=1 

select a.AccountId,c.SmartcardNo,d.STBNo,e.CustomerId into #SMS_SEARCHMONTH_HIST_SUBSC_DATA_2 from #accAll a 
left join #pairAll b on a.PairingId=b.PairingId
left join #smcAll c on b.SmartCardId=c.SmartcardId
left join #stball d on b.StbId=d.STBId
left join #subAll e on a.SubscriberId=e.SubscriberId

select * into #SMS_SEARCHMONTH_HIST_SUBSC_DATA from (select ROW_NUMBER()OVER(PARTITION BY SmartcardNo order by Accountid desc) as Rid,* 
from #SMS_SEARCHMONTH_HIST_SUBSC_DATA_2)x where x.Rid=1
  
Delete from SMS_PACK_ALACA_DISCONNECTED_AGEING where Convert(varchar(10),CreatedOn,120)=@date;  
Delete from SMS_PACK_ALACA_DISCONNECTED_AGEING_DATA where Convert(varchar(10),GeneratedOn,120)=@date;

select * into #acc_his from(select ROW_NUMBER()over(Partition By FID Order by Id desc) as RID ,* from SMS_SUBSCRIBERACCOUNTS_HISTORY 
where cast(InsertedOn as DATE)<=@date)x where RID=1  

  

select * into #t_pack_cl_prp_1 from (select ROW_NUMBER()over(Partition by FID,AccountId,BouqueId,ActivationDate 
order by Insertedon desc,id desc) as RID,Id,FID,AccountId,BouqueId,ActivationDate,DeactivationDate,Deleted,DMLAction,
'PrePaid' as ConnectionType,Insertedon,Status,InsertedBy,Remark,DMLComments
from PRP_ACCOUNTTRANSACTION_HISTORY
where  cast(InsertedOn as DATE)<=@date)x where RID=1

select a.Id,a.AccountId,a.Deleted,a.DMLAction,isnull(b.PackageId,0) as PackageId,
isnull(b.ChannelId,0) as ChannelId,a.ConnectionType,a.FID,0 as Flag,Insertedon,
a.ActivationDate,a.DeactivationDate,a.Status,a.InsertedBy,a.Remark,a.DMLComments
into #t_pack_cl_prp from #t_pack_cl_prp_1 a left join PRP_BOUQUE_ASSETS b on a.BouqueId=b.BouqueId


 
select * into #trans_Discon_2 from (select ROW_NUMBER()over(Partition By PackageId,ChannelId,AccountId Order by Id desc) as PRID,
DATEDIFF(DAY,cast(InsertedOn as DATE),cast(@date as Date)) as DaysInActive,@date as GeneratedOn,* from #t_pack_cl_prp)x  
where PRID=1 and (Deleted=1 and DMLAction=3 or Status=0) order by AccountId,PackageId,ChannelId


--select * into #trans from #trans_his where AccountId in (select FID from #acc_his)
  
select * into #trans_Discon from #trans_Discon_2 where AccountId in (select AccountId from #SMS_SEARCHMONTH_HIST_SUBSC_DATA)
  
insert into SMS_PACK_ALACA_DISCONNECTED_AGEING_DATA(DaysInActive,Id,FID,CustomerId,SmartcardNo,STBNo,AccountId,ProductId,IsAlacarte,
ActivationDate,DeactivationDate,Flag,Status,CreatedOn,CreatedBy,Deleted,Remark,InsertedOn,InsertedBy,DMLAction,DMLComments,GeneratedOn)  
select x.DaysInActive,x.Id,x.FID,a.CustomerId,a.SmartcardNo,a.STBNo,x.AccountId,case when ChannelId=0 then PackageId else ChannelId end as ProductId ,
case when ChannelId=0 then 0 else 1 end AS IsAlacarte,  
x.ActivationDate,x.DeactivationDate,x.Flag,x.Status,x.InsertedOn,x.InsertedBy,x.Deleted,x.Remark,x.InsertedOn,x.InsertedBy,  
x.DMLAction,x.DMLComments,x.GeneratedOn from #trans_Discon x  
left join #SMS_SEARCHMONTH_HIST_SUBSC_DATA a on x.AccountId=a.AccountId
   
select Count(*) as NoAccs,AgeingDays,PackageId,ChannelId into #t_Discon from(  
select Case when DaysInactive<=30 then 'D30' when DaysInactive<=60 then 'D60' else 'D90' end as AgeingDays,* from #trans_Discon ) x  
group by AgeingDays,PackageId,ChannelId
  
select * into #t_f from(  
select a.*,b.PackageName,b.CasCodeCatVision from #t_Discon a  
left outer join SMS_PACKAGE b on a.PackageId=b.Id where (a.ChannelId=0 or ChannelId is null ) and b.Id is not null   
Union  
select a.*,b.ChannelName,b.CasCodeCatVision from #t_Discon a  
left outer join SMS_CHANNEL b on a.ChannelId=b.Id where (a.PackageId=0 or PackageId is null ) and b.Id is not null
)x

SELECT PackageName,CasCodeCatVision,ChannelId,PackageId,isnull([D30],0) as [30 Days],isnull([D60],0) as [60 Days], isnull([D90],0) as [90 Days] 
into #total_rep FROM #t_f   
PIVOT (sum(NoAccs) FOR AgeingDays IN ([D0],[D30],[D60],[D90])   
)AS p order by ChannelId  
  
insert into SMS_PACK_ALACA_DISCONNECTED_AGEING (PackageName,CasCode,IsAlacarte,ProductId,thirtyDays,sixtydays,nintydays,CreatedOn)  
select PackageName,CasCodeCatVision,case when ChannelId=0 then 0 else 1 end as IsAlacarte,case when ChannelId=0 then PackageId else ChannelId end as PackageId,[30 Days],[60 Days],[90 Days],@date from #total_rep  
End
GO
