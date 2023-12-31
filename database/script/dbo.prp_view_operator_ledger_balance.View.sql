USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_operator_ledger_balance]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_view_operator_ledger_balance] as 
Select Id as OperatorId,sum((CreditAmount+LCOSharing+NCF_LCOSharing+TOPUPED_BY_PARENTOPER)-(DebitAmount+NCFDebitAmount)) as Balance from prp_view_operator_ledger group by Id
GO
