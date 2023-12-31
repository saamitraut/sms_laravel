USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_Bou_pack_channel_cascode]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE view [dbo].[prp_view_Bou_pack_channel_cascode] as    



select * from (
select b.Id as ProductId,b.PackageName as ProductName,0 as IsAlacarte,a.BouqueId,b.CasCode,b.CasCodeGospel,b.CasCodeNSTV,b.CasCodeTelelynx,CasCodeKingvon,CasCodeCatVision,CasCodeBCAS
from PRP_BOUQUE_ASSETS a left outer join SMS_PACKAGE b on a.PackageId=b.id where b.Id is not null
Union all
select b.Id as ProductId,b.ChannelName as ProductName,1 as IsAlacarte,a.BouqueId,b.CasCode,b.CasCodeGospel,b.CasCodeNSTV,b.CasCodeTelelynx,CasCodeKingvon,CasCodeCatVision,CasCodeBCAS 
from PRP_BOUQUE_ASSETS a left outer join SMS_CHANNEL b on a.ChannelId=b.id where b.Id is not null)x


GO
