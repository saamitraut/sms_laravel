USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_channelinpackage_d]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[sms_view_channelinpackage_d] as
Select b.*,a.PackageId from SMS_CHANNELINPACKAGE a
left outer join SMS_CHANNEL b on a.ChannelId=b.Id 
where b.id is not null and a.IsSubPack=0


GO
