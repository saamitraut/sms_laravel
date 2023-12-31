USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_abv_sms_update_entitlement]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cas_abv_sms_update_entitlement]--abv command

	@accountid bigint=null,@createdBy as bigint=-5,@CAS_STATUS bit=null

AS

begin

--Select Pairings in temptable

select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,Id as AccountId,
isnull(GETDATE(),GETDATE()) as CommandDate,@createdBy as CreatedBy 
into #temp_pairings from sms_view_accounts_pairings b where  (Id=@accountid or @accountid is null)


select ROW_NUMBER()over(order by Id,IsAlacarte ) as RId,* into #temp_entitlements
FROM (
select  a.ProductId as Id,a.CasCode,right(dbo.[fn_varbintostr](a.CasCode),4) as LinkId,a.IsAlacarte as IsAlacarte
,Min(ActivationDate) as ActivationDate,
Max(DeactivationDate) as DeactivationDate,Max(DeactivationDate) as CAS_DA_DATE
from sms_view_prp_account_transaction a 
WHERE (a.AccountId=@accountid or @accountid is null)  and (CASSTATUS=@CAS_STATUS or @CAS_STATUS is null)
group by a.ProductId,a.CasCode,a.IsAlacarte,CASStatus
)X


if exists(select * from #temp_entitlements)
begin

	select NTILE((Select cast(ceiling(COUNT(RID)/255.0)as int) from #temp_entitlements))over(order by RID) as Nid,* 
	into #temp_entitlement_f from #temp_entitlements

	select a.*,b.SmartcardNo into #temp from #temp_entitlement_f a,#temp_pairings b 

	select COUNT(*) as LinkCount,
	LinkIds=cast(substring 

							  ((SELECT (' '+t.LinkId+dbo.[getNdigit_str](t.LinkId,16))

								  from #temp t

								 WHERE    a.SmartcardNo=t.SmartcardNo and a.Nid=t.Nid and a.ActivationDate=t.ActivationDate and a.DeactivationDate=t.DeactivationDate

								ORDER BY t.LinkId FOR XML PATH('')),2,8000) as varchar(8000))

,PackageIds=cast(substring 

							  ((SELECT (','+cast(t.Id as varchar))

								  from #temp t

								 WHERE    a.SmartcardNo=t.SmartcardNo and a.Nid=t.Nid and a.ActivationDate=t.ActivationDate and a.DeactivationDate=t.DeactivationDate and t.IsAlacarte=0

								ORDER BY t.LinkId FOR XML PATH('')),2,8000) as varchar(8000))								

,AlacarteIds=cast(substring 

							  ((SELECT (','+cast(t.Id as varchar))

								  from #temp t

								 WHERE    a.SmartcardNo=t.SmartcardNo and a.Nid=t.Nid and a.ActivationDate=t.ActivationDate and a.DeactivationDate=t.DeactivationDate and t.IsAlacarte=1

								ORDER BY t.LinkId FOR XML PATH('')),2,8000) as varchar(8000))										

	,SmartcardNo,ActivationDate,DeactivationDate,Nid,dbo.fn_getHexdate(isnull(ActivationDate,GETDATE())) as StartDate,dbo.fn_getHexdate(isnull(DeactivationDate,GETDATE())) as EndDate,

	dbo.fn_getHexdateTime(dateadd(second,10,isnull(GETDATE(),GETDATE()))) as MsgDate

	into #temp_f  from #temp a group by SmartcardNo,Nid,ActivationDate,DeactivationDate

	 ---

	 select *,dbo.cas_abv_formatcmd(dbo.[cas_abv_UpdateEmtitlement](SmartcardNo,LinkCount,LinkIds,MsgDate,StartDate,EndDate)) as Command

	 into #t from #temp_f a

	 --

	 

	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,

	CreatedOn,CreatedBy,ActivationDate,DeactivationDate,PackageIds,AlacarteIds,CASTYPE)

	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,b.AccountId,'ENTUPD',9,a.Command,'cas_abv_sms_update_entitlement',

	case when getDate() between ActivationDate  and DeactivationDate then dbo.returnGreaterdate (DATEADD(SECOND,30,GETDATE()),cast(ActivationDate as datetime)) else 

	dbo.returnGreaterdate (DATEADD(SECOND,30,cast(ActivationDate as datetime)),ActivationDate) end as CommandDate,GETDATE(),b.CreatedBy,ActivationDate,

	DeactivationDate,PackageIds,AlacarteIds,'1'

	from #t a left outer join #temp_pairings b on a.SmartcardNo=b.SmartcardNo

	where b.SubscriberId is not null and a.DeactivationDate>=cast(getdate() as date) --and a.ActivationDate>=cast(getdate() as date)



end

end

GO
