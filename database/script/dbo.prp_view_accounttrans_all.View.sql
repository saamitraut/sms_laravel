USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_accounttrans_all]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[prp_view_accounttrans_all] as 
select * from(select ROW_NUMBER()over(Partition By FID Order by ID desc) as RID,* from PRP_ACCOUNTTRANSACTION_HISTORY where DMLAction=1) x where RID=1
GO
