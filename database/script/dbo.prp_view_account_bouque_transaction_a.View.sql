USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_account_bouque_transaction_a]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_view_account_bouque_transaction_a] as  
select *,Status & Case when a.DeactivationDate>=Cast(GETDATE() as date) then 1 else 0 end as ExpStatus from  PRP_ACCOUNTTRANSACTION a 
GO
