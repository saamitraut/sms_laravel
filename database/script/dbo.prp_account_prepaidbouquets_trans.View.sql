USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_account_prepaidbouquets_trans]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE View [dbo].[prp_account_prepaidbouquets_trans] as    
select a.*,b.*,datediff(d,getdate(),a.DeactivationDate) as DaysLeft from prp_account_prepaidbouquets a    
cross apply dbo.fn_getYMDbtwndates(cast(GETDATE() as Date),a.DeactivationDate) b 
GO
