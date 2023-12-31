USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_account_prepaidbouquets_a]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_account_prepaidbouquets_a] as  

select a.*,b.BouqueCode,b.BType,b.BouqueName,b.Packages,b.PackageID,b.Channels,b.ChannelID,b.AType from prp_view_account_bouque_transaction_a a  

left outer join prp_view_bouques b on a.BouqueId=b.id  

where b.Id is not null and a.ExpStatus=1
GO
