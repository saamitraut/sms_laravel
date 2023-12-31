USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_abv_sms_activate_account]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cas_abv_sms_activate_account]--abv command

	@accountid bigint,@createdBy as bigint,@bindSc as bit=1,@cmt as varchar(20)='',@addSec as int=15

AS

begin



--Select Pairings in temptable

select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,b.Id as AccountId,

isnull(ActivationDate,GETDATE()) as CommandDate,@createdBy as CreatedBy,a.BranchId 

into #temp_pairings from sms_view_accounts_pairings b 

LEFT OUTER JOIN sms_view_subscribers a on b.SubscriberId=a.Id

where b.Id=@accountid and b.CASTYPEID=1



if exists(select * from #temp_pairings)

begin

---ADDSC Add Smartcard to CAS



Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,

CreatedOn,CreatedBy,CASTYPE)

select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,@cmt+'ADDSC',1,dbo.cas_abv_formatcmd(dbo.cas_abv_addSmartcard(SmartcardNo))

,'cas_abv_sms_activate_account',DATEADD(SECOND,@addSec,GETDATE()),GETDATE(),CreatedBy,'1' from #temp_pairings



		---BINDSC 45 6  Smartcard on CAS --precautional

Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,

CreatedOn,CreatedBy,CASTYPE)

select SmartcardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,@cmt+'BINDSC',6,dbo.cas_abv_formatcmd(dbo.cas_abv_BindSmartcard(SmartcardNo,STBNo))

,'cas_abv_sms_activate_account',DATEADD(SECOND,@addSec+6,GETDATE()),GETDATE(),CreatedBy,'1' from #temp_pairings



		



End

--RESSC  Smartcard on CAS --precautional

--drop table #temp_entitlements 



select ROW_NUMBER()over(order by Id,IsAlacarte ) as RId,* into #temp_entitlements

FROM (

select a.ProductId as Id,a.CasCode,
right(dbo.[fn_varbintostr](a.CasCode),4) as LinkId,a.ProductId,a.IsAlacarte as IsAlacarte,
ActivationDate,DeactivationDate,DeactivationDate as CAS_DA_DATE

from sms_view_prp_account_transaction a WHERE a.AccountId=@accountid

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

								 WHERE    a.SmartcardNo=t.SmartcardNo and a.Nid=t.Nid and a.ActivationDate=t.ActivationDate and a.CAS_DA_DATE=t.CAS_DA_DATE

								ORDER BY t.LinkId FOR XML PATH('')),2,8000) as varchar(8000))

,PackageIds=cast(substring 

							  ((SELECT (','+cast(t.Id as varchar))

								  from #temp t

								 WHERE    a.SmartcardNo=t.SmartcardNo and a.Nid=t.Nid and a.ActivationDate=t.ActivationDate and a.CAS_DA_DATE=t.CAS_DA_DATE and t.IsAlacarte=0

								ORDER BY t.LinkId FOR XML PATH('')),2,8000) as varchar(8000))								

,AlacarteIds=cast(substring 

							  ((SELECT (','+cast(t.Id as varchar))

								  from #temp t

								 WHERE    a.SmartcardNo=t.SmartcardNo and a.Nid=t.Nid and a.ActivationDate=t.ActivationDate and a.CAS_DA_DATE=t.CAS_DA_DATE and t.IsAlacarte=1

								ORDER BY t.LinkId FOR XML PATH('')),2,8000) as varchar(8000))										

	,SmartcardNo,ActivationDate,DeactivationDate,CAS_DA_DATE,Nid,dbo.fn_getHexdate(isnull(ActivationDate,GETDATE())) as StartDate,dbo.fn_getHexdate(isnull(CAS_DA_DATE,GETDATE())) as EndDate,

	dbo.fn_getHexdateTime(dateadd(second,@addSec+7,isnull(GETDATE(),GETDATE()))) as MsgDate

	into #temp_f  from #temp a group by SmartcardNo,Nid,ActivationDate,DeactivationDate,CAS_DA_DATE

	 

	 select *,dbo.cas_abv_formatcmd(dbo.[cas_abv_UpdateEmtitlement](SmartcardNo,LinkCount,LinkIds,MsgDate,StartDate,EndDate)) as Command

	 into #t from #temp_f a

	 

	 
--WAITFOR DELAY '00:00:06'
	 

	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,

	CreatedOn,CreatedBy,ActivationDate,DeactivationDate,PackageIds,AlacarteIds,CASTYPE)

	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,b.AccountId,@cmt+'ENTUPD',9,a.Command,'cas_abv_sms_activate_account',

	DATEADD(SECOND,@addSec+6,GETDATE()),GETDATE(),b.CreatedBy,ActivationDate,DeactivationDate,PackageIds,AlacarteIds,'1'

	 from #t a left outer join #temp_pairings b on a.SmartcardNo=b.SmartcardNo

	where b.SubscriberId is not null


end

end
GO
