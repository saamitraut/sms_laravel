USE [MNSMS]
GO
/****** Object:  View [dbo].[viewchannelhist_eachrow]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[viewchannelhist_eachrow] as

Select a.ID,a.PackageId,p.CasCode as ProductId,p.PackageName,ISNULL(ac.LOGINID,'System') as AddedBy,Convert(varchar,a.InsertedOn,121) as AddedOn,a.DMLComments,
ar.ChannelName,ar. ServiceId
from SMS_CHANNELINPACKAGE_HISTORY a left join SMS_ACCESS ac on a.InsertedBy=ac.ID
left join SMS_PACKAGE p on p.Id=a.PackageId
left join SMS_CHANNEL ar ON a.ChannelId = ar.Id
GO
