USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_operator_debit_summary]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_view_operator_debit_summary] as
select sum(Amount+NCFAmount) as DebitAmt,OperatorId,count(*) as NoTrans from PRP_ACCOUNTTRANSACTION_HISTORY  where DMLAction=1 and OperatorId!=0 group by OperatorId
GO
