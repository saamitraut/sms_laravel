USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_day_wise_operator_ledger]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[prp_view_day_wise_operator_ledger] as 

select x.OperatorId as Id,x.AddedOn,x.TransType,
sum(case when x.TransType='CR' then x.Amount else 0 end) as CreditAmount,
sum(case when x.TransType='DB' then x.Amount else 0 end) as DebitAmount,
sum(case when x.TransType='DB' then x.NCFAmount else 0 end) as NCFDebitAmount,
sum(case when x.TransType='LCO_SHARE' then x.Amount else 0 end) as LCOSharing,
sum(case when x.TransType='NCFLCO_SHARE' then x.Amount else 0 end) as NCF_LCOSharing,
sum(case when x.TransType='TOPUPED_BY_PARENTOPER' then x.Amount else 0 end) as TOPUPED_BY_PARENTOPER from (
select OperatorId,Amount,0 as NCFAmount,cast(CreatedOn as date) as AddedOn,'CR' as TransType from PRP_OPERATOR_CREDIT
 where TransType=1
union all
select OperatorId,Amount,NCFAmount,cast(CreatedOn as date) as AddedOn,'DB' as TransType from PRP_ACCOUNTTRANSACTION_HISTORY 
where DMLAction=1 
union all
select OperatorId,LCOSharing as Amount,0 as NCFAmount,getdate() as AddedOn,'LCO_SHARE' as TransType from prp_view_LCOSharing 
union all
select OperatorId,NCF_LCOSharing as Amount,0 as NCFAmount,getdate() as AddedOn,'NCFLCO_SHARE' as TransType from prp_view_LCOSharing 
union all
select b.OperatorId,TotalCredit as Amount,0 as NCFAmount,getdate() as AddedOn,'TOPUPED_BY_PARENTOPER' as TransType
 from sms_view_user_totalCredit a 
left join SMS_ACCESS b on a.TopedUpUserId=b.ID where a.TopedUpUserId is not null and b.ID is not null and OperatorID 
not in (Select id from SMS_OPERATOR where ParentId=0)--and OperatorID=40
)x group by x.OperatorId,x.AddedOn,x.TransType
GO
