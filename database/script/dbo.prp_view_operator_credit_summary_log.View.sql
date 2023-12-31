USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_operator_credit_summary_log]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_view_operator_credit_summary_log] as
select o.Id as Id,o.NAME as OperatorName,o.CODE as OperatorCode,o.Branch,cast(cast(a.CreditAmount as money) as varchar) as Amount,
cast(cast(a.Balance as money) as varchar) as Balance from prp_view_operatorbalance a inner join sms_view_operator o on o.Id=a.OperatorId
GO
