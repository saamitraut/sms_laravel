USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_package_tranaction]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view  [dbo].[sms_view_package_tranaction] as    

select a.*,b.ProductId,b.IsAlacarte,b.CasCode,b.ProductName
from PRP_ACCOUNTTRANSACTION a
left join prp_view_Bou_pack_channel_cascode  b on a.BouqueId=b.BouqueId and b.IsAlacarte=0

GO
