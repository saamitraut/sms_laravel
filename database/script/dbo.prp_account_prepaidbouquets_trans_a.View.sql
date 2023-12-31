USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_account_prepaidbouquets_trans_a]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_account_prepaidbouquets_trans_a] as  

select a.*,b.*,datediff(d,getdate(),a.DeactivationDate) as DaysLeft from prp_account_prepaidbouquets_a a  

cross apply dbo.fn_getYMDbtwndates(cast(GETDATE() as Date),a.DeactivationDate) b
GO
