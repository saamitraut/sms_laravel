USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_abv_sms_cancell_entitlement]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cas_abv_sms_cancell_entitlement]--abv command

	@accountid bigint=null,@createdBy as bigint=-5,@CommandDate as datetime=null

AS

begin

--Select Pairings in temptable

select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,PairingId,Id as AccountId,

isnull(isnull(@CommandDate,DeactivationDate),GETDATE()) as CommandDate,@createdBy as CreatedBy 

into #temp_pairings from sms_view_accounts_pairings b where (Id=@accountid or @accountid is null)

and CASTYPEID=1 --for abv ID in CAS_TABLE





	select ROW_NUMBER()over(order by Id,IsAlacarte ) as RId,* into #temp_entitlements

	FROM (

	select  a.ProductId as Id,a.CasCode,right(dbo.[fn_varbintostr](a.CasCode),4) as LinkId,a.IsAlacarte as IsAlacarte,ActivationDate,DeactivationDate,DeactivationDate as CAS_DA_DATE

	from 

		sms_view_prp_account_transaction a 		

	 WHERE (a.AccountId=@accountid or @accountid is null)  and a.CASStatus=7

	)X



if exists(select * from #temp_entitlements)

begin

--

	select NTILE((Select cast(ceiling(COUNT(RID)/255.0)as int) from #temp_entitlements))over(order by RID) as Nid,* 

	into #temp_entitlement_f from #temp_entitlements

--

	select a.*,b.SmartcardNo into #temp from #temp_entitlement_f a,#temp_pairings b 

--

	select COUNT(*) as LinkCount,

	LinkIds=cast(substring 

							  ((SELECT (' '+t.LinkId)

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

	,SmartcardNo,ActivationDate,CAS_DA_DATE,Nid,dbo.fn_getHexdate(isnull(ActivationDate,GETDATE())) as StartDate,dbo.fn_getHexdate(isnull(CAS_DA_DATE,GETDATE())) as EndDate,

	dbo.fn_getHexdateTime(dateadd(second,10,isnull(GETDATE(),GETDATE()))) as MsgDate

	into #temp_f  from #temp a group by SmartcardNo,Nid,ActivationDate,CAS_DA_DATE

	 ---

	 select *,dbo.cas_abv_formatcmd(dbo.[cas_abv_CancellEmtitlement](SmartcardNo,LinkCount,LinkIds,MsgDate,StartDate,EndDate)) as Command

	 into #t from #temp_f a

	 --

	 

	Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,Command,Remark,CommandDate,

	CreatedOn,CreatedBy,ActivationDate,DeactivationDate,PackageIds,AlacarteIds,CASTYPE)

	select b.SmartcardNo,b.SmartCardId,b.STBNo,b.StbId,b.SubscriberId,b.AccountId,'ENTDEL',17,a.Command,'cas_abv_sms_cancell_entitlement',

	b.CommandDate,GETDATE(),b.CreatedBy,ActivationDate,CAS_DA_DATE,PackageIds,AlacarteIds,'1'

	 from #t a left outer join #temp_pairings b on a.SmartcardNo=b.SmartcardNo

	where b.SubscriberId is not null



end

end
GO
