USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_account_prepaidbouquets_trans_refund]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_account_prepaidbouquets_trans_refund] as		

select Case when DATEDIFF(HOUR,dbo.returnGreaterdate(CreatedOn,ActivationDate),GETDATE())>2 then DateAdd(dd,1,dbo.returnGreaterdate(ActivationDate,getdate())) 

else ActivationDate end as NActivationDate,* from  prp_account_prepaidbouquets_trans_a 
GO
