USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_operator_details]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_view_operator_details] as
select a.ID,a.CODE,a.TobeBilled,a.NAME,a.CONTACTPERSON,a.ParentId,a.ADDRESS,a.MOBILE,a.Email,a.PHONE,a.BranchId,a.STATUS,a.Branch,a.CREATEDON,a.UPDATEDON,
a.CREATEDBY,a.UPDATEDBY,a.Deleted,a.Remark,a.LOGINID,a.AccessId,a.Password,a.BillingFrom,a.ParentOperator,isnull(b.CreditAmount,0) as CreditAmount,
isnull(b.DebitAmount,0)as DebitAmount,isnull(b.Balance,0)as Balance,isnull(b.DebitTransaction,0) as DebitTransaction from [sms_view_operator] a
left outer join prp_view_operatorbalance b on a.ID=b.OperatorId
GO
