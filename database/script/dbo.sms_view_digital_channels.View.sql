USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_digital_channels]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view[dbo].[sms_view_digital_channels]



as

select a.Id as CategoryId, a.Title as Title,

b.Id as ChannelId, b.ChannelName as ChannelName,

b.LogoExt as LogoExt, b.CasCode as CasCode

 from SMS_CATEGORY a



left join SMS_CHANNEL b on a.Id = b.CategoryId

where a.Status = 1 AND b.Status = 1
GO
