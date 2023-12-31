USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_account_prepaidbouquets_all]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[prp_account_prepaidbouquets_all] as
select a.*,b.BouqueCode,b.BType,b.BouqueName,case when b.isRio=0 then b.Packages else '' end as Packages,b.PackageID,
case when isRio=0 then b.Channels else '' end as Channels,b.ChannelID from [prp_view_account_bouque_transaction_all] a
left outer join prp_view_bouques b on a.BouqueId=b.id where b.Id is not null
GO
