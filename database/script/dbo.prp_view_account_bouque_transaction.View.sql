USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_account_bouque_transaction]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[prp_view_account_bouque_transaction] as         
select a.Id,a.AccountId,a.Rate,a.Amount,a.BouqueId,a.Status,a.ActivationDate,a.DeactivationDate,a.CreatedOn,a.CreatedBy,a.UpdatedOn,    
a.UpdatedBy,a.Deleted,a.Remark,a.SessionFlag,a.CASStatus,a.Status & Case when a.DeactivationDate>=Cast(GETDATE() as date) then 1 else 0 end as ExpStatus,
BouqueName as BouName,Packages as PACNAME,Channels CHANAME,PackageID PACKID,ChannelID as CHANID  
from dbo.PRP_ACCOUNTTRANSACTION a inner join prp_view_bouques b on a.BouqueId=b.Id      
GO
