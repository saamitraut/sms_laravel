USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[sms_unique_acc_gen_brd_report_trai]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sms_unique_acc_gen_brd_report_trai] @repMonthYear as Date
as
Begin

Declare @repMonth as datetime
select @repMonth=CAST(Left(convert(varchar(19),cast(@repMonthYear as datetime),120),10)+' 23:59:59' as datetime);

delete from SMS_BRD_ALL_ACTIVE where repMonth=CAST(@repMonth AS DATE);

DECLARE @week as int;
select @week=CASE DATEPART(D,@repMonthYear) WHEN 7 THEN 1 WHEN 14 THEN 2 WHEN 21 THEN 3 WHEN 28 THEN 4 END;

Declare @open_month_new as datetime
Declare @close_month_new as datetime

if(@week=1)
BEGIN
Select @close_month_new=@repMonth
END

else if(@week=2)
BEGIN
Select @close_month_new=@repMonth
END

else if(@week=3)
BEGIN
Select @close_month_new=@repMonth
END

else if(@week=4)
BEGIN
Select @close_month_new=@repMonth
END


----Closing starts----
select ROW_NUMBER()over(Partition by FID order by Id desc) as RID,id
,FID,SubscriberId,DMLAction,status,Deleted into #t_digital_cl from SMS_SUBSCRIBERACCOUNTS_HISTORY where InsertedOn<=@close_month_new;

Select FID as AccountId,SubscriberId into #accAll from #t_digital_cl where RID=1 and (Status=1 and Deleted=0 and DMLAction!=4)

select x.* into #packAll from (select ROW_NUMBER()over(Partition by FID order by Id desc) as RID,FID as PackageId,PackageType as IsHD
from SMS_PACKAGE_HISTORY where InsertedOn<=@close_month_new)x where x.RId=1 

select x.* into #channelAll from (select ROW_NUMBER()over(Partition by FID order by Id desc) as RID,FID as ChannelId,ChannelType as IsHD
from SMS_CHANNEL_HISTORY where InsertedOn<=@close_month_new)x where x.RId=1 



select * into #t_pack_cl_prp_1 from (select ROW_NUMBER()over(Partition by FID,AccountId,BouqueId,ActivationDate order by Insertedon desc,id desc) as RID,Id,
Id as HistoryTransId,AccountId,BouqueId,ActivationDate,DeactivationDate,Deleted,DMLAction,'PrePaid' as ConnectionType,Insertedon from PRP_ACCOUNTTRANSACTION_HISTORY
where AccountId in (select FID from #t_digital_cl where RID=1 and Status=1 and Deleted=0 and DMLAction!=4) and InsertedOn<=@close_month_new
and ActivationDate<=cast(@close_month_new as date) and  DeactivationDate>=cast(@close_month_new as Date))x where RID=1

select a.Id,a.AccountId,a.Deleted,a.DMLAction,b.PackageId,b.ChannelId,a.ConnectionType,HistoryTransId,Insertedon,a.ActivationDate,a.DeactivationDate,b.BouqueId
into #t_pack_cl_prp from #t_pack_cl_prp_1 a 
left join PRP_BOUQUE_ASSETS b on a.BouqueId=b.BouqueId

--for unique smartcard
select COUNT(DISTINCT AccountId)  as NofAcc into #temp_closing_unique_cnts_all from #t_pack_cl_prp_1 where RID=1 and (Deleted=0 and DMLAction!=4)

--HD pack count
select a.*,b.PackageType into #pack from #t_pack_cl_prp a left join SMS_PACKAGE b on a.PackageId=b.Id and a.ChannelId is null

select ROW_NUMBER()over(Partition by AccountId,BouqueId order by Id desc) as RID,id,FID
,DMLAction,Deleted,BouqueId,AccountId into #t_cl_all_hd_pack 
from PRP_ACCOUNTTRANSACTION_HISTORY 
where InsertedOn<=@close_month_new and DeactivationDate>=cast(@close_month_new as Date)
and ActivationDate<=CAST(@close_month_new as date)  and BouqueId in (select distinct bouqueid from #pack where PackageType=1)
and AccountId in (Select FID from #t_digital_cl where RID=1 and (Status=1 and Deleted=0 and DMLAction!=4)
and FID in (select AccountId from #accAll))


--HD channel count
select a.*,b.ChannelType into #channels from #t_pack_cl_prp a left join SMS_CHANNEL b on a.ChannelId=b.Id and a.PackageId is null

select ROW_NUMBER()over(Partition by AccountId,BouqueId order by Id desc) as RID,id,FID
,DMLAction,Deleted,BouqueId,AccountId into #t_cl_all_hd_ala from PRP_ACCOUNTTRANSACTION_HISTORY 
where InsertedOn<=@close_month_new and DeactivationDate>=cast(@close_month_new as Date)
and ActivationDate<=CAST(@close_month_new as date) and BouqueId in (select distinct bouqueid from #channels where channeltype=1)
and AccountId in (Select FID from #t_digital_cl where RID=1 and (Status=1 and Deleted=0 and DMLAction!=4)
and FID in (select AccountId from #accAll))

--for unique HD smartcards
select COUNT(DISTINCT x.AccountId) as NofAccHD into #temp_closing_unique_cnts_HD 
FROM
(select distinct AccountId from #t_cl_all_hd_pack
UNION
select distinct AccountId from #t_cl_all_hd_ala)x

----Closing ends----  

insert into SMS_BRD_ALL_ACTIVE(RepMonth,Opening,Closing,Average,HdClosing,CREATEDON,CREATEDBY,Remark)
Select @close_month_new as RepMonth,0 as Opening,isnull(a.NofAcc,0) Closing,0,isnull(b.NofAccHD,0) HdClosing,GETDATE(),-1,'AUTO GEN'
 from #temp_closing_unique_cnts_all a,
#temp_closing_unique_cnts_HD b

End
GO
