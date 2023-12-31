USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_prepaid_last_activation]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE View [dbo].[prp_view_prepaid_last_activation] as      
  select AccountId,BouqueId,max(ActivationDate) as LastActivationDate,MAX(DeactivationDate)  as DeactivationDate     
   from prp_view_account_bouque_transaction where ExpStatus=1 group by AccountId,BouqueId 
GO
