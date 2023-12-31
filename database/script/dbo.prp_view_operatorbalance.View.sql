USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_operatorbalance]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_view_operatorbalance] as
select a.operatorId,SUM(a.CreditAmount) as CreditAmount,Max(DebitAmt) as DebitAmount,SUM(CreditAmount)-Max(DebitAmt) as Balance,max(NoTrans) as DebitTransaction 
from prp_view_operator_credit a inner join prp_view_operator_debit_summary b on a.OperatorId=b.OperatorId
group by a.operatorId
GO
