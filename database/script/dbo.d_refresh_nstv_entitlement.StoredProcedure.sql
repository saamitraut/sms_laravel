USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[d_refresh_nstv_entitlement]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[d_refresh_nstv_entitlement] @accountId as bigint,@UserId as bigint

As
Begin
declare @add as int
set @add=0

select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,Id as AccountId,
dateadd(ss,@add,dbo.returnGreaterdate(isnull(cast(ActivationDate as datetime),GETDATE()),GETDATE())) as CommandDate,@UserId as CreatedBy 
into #temp_pairings from sms_view_accounts_pairings b where Id=@accountid and CASTYPEID=3 

Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
CreatedOn,CreatedBy,CASTYPE)
select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'SMS_CA_OPEN_ACCOUNT_REQUEST',1,''
,'REFRESH_SMS_CA_OPEN_ACC_REQUEST',GETDATE(),GETDATE(),@UserId,'3' from #temp_pairings

Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
CreatedOn,CreatedBy,CASTYPE)
select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,'SMS_CA_REPAIR_REQUEST',1,''
,'REFRESH_SMS_CA_REPAIR_REQUEST',GETDATE(),GETDATE(),@UserId,'3' from #temp_pairings

select ROW_NUMBER()over(order by Id,IsAlacarte ) as RId,* into #temp_entitlements
FROM (
select  a.ProductId AS Id,a.CasCodeNSTV as CasCode,a.CasCodeNSTV as LinkId,a.IsAlacarte as IsAlacarte,
dateadd(ss,@add,dbo.returnGreaterdate(isnull(cast(ActivationDate as datetime),GETDATE()),GETDATE())) as ActivationDate,DeactivationDate,CAS_DA_DATE
from sms_view_all_transaction a 
 WHERE a.AccountId=@accountid )X
if exists(select * from #temp_entitlements)
begin
	select NTILE((Select cast(ceiling(COUNT(RID)/10.0)as int) from #temp_entitlements))over(order by RID) as Nid,* 
	into #temp_entitlement_f 
	from #temp_entitlements
select a.*,dbo.fn_getUTCHexdateTime(ActivationDate) as Hex_ActivationDate
	,dbo.fn_getUTCHexdateTime(CAS_DA_DATE) as Hex_CAS_DA_DATE
	,'01' as  send_or_not,'01' as  tapping_ctrl,dbo.fn_varbintostr_(LEN(dbo.fn_stringtohexStr('ENTL FROM SMS'))/2,2) as Dlen
	,dbo.fn_stringtohexStr('ENTL FROM SMS') as Descp,
	b.SmartcardNo into #temp from #temp_entitlement_f a,#temp_pairings b
	select COUNT(*) as LinkCount,
LinkIds=cast(substring 
							  ((SELECT cast(t.LinkId as varchar)+' '
								  from #temp t
								 WHERE    a.SmartcardNo=t.SmartcardNo and a.Nid=t.Nid 
								ORDER BY t.LinkId FOR XML PATH('')),1,8000) as varchar(8000))
,PackageIds=cast(substring 
							  ((SELECT (','+cast(t.Id as varchar))
								  from #temp t
								 WHERE    a.SmartcardNo=t.SmartcardNo and a.Nid=t.Nid 
								 and t.IsAlacarte=0
								ORDER BY t.LinkId FOR XML PATH('')),2,8000) as varchar(8000))								
,AlacarteIds=cast(substring 
							  ((SELECT (','+cast(t.Id as varchar))
								  from #temp t
								 WHERE    a.SmartcardNo=t.SmartcardNo and a.Nid=t.Nid 
								 and t.IsAlacarte=1
								ORDER BY t.LinkId FOR XML PATH('')),2,8000) as varchar(8000))										
	,SmartcardNo,min(ActivationDate) as ActivationDate,max(CAS_DA_DATE) as CAS_DA_DATE
	 ,Nid,isnull(min(ActivationDate),GETDATE()) as StartDate,isnull(max(CAS_DA_DATE),GETDATE()) as EndDate
	into #temp_f  
	from #temp a group by SmartcardNo,Nid
	 select *,dbo.cas_sumavision_UpdateEntitlement_multi(SmartcardNo,LinkCount,LinkIds) as Command
	 into #t 
	 from #temp_f a	
select ROW_NUMBER() over (Partition by AccountId,ProductId,IsAlacarte ORDER BY ID desc) as RID,* into #tempp
from sms_view_all_transaction where AccountId=@accountId and Status=1 and DeactivationDate>CAST(GETDATE() AS DATE)
Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,
	CreatedOn,CreatedBy,ActivationDate,DeactivationDate,PackageIds,AlacarteIds,CASTYPE,LinkIds,LinkCount)
	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,b.AccountId,'SMS_CA_ENTITLE_REQUEST',9,'','REFRESH_SMS_CA_ENT_REQUEST',
	GETDATE(),GETDATE(),@UserId,ActivationDate,CAS_DA_DATE,PackageIds,AlacarteIds,'3',a.LinkIds,a.LinkCount  
	 from #t a left outer join #temp_pairings b on a.SmartcardNo=b.SmartcardNo
	where b.SubscriberId is not null
end
end
GO
