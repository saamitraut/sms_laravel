USE [MNSMS]
GO
/****** Object:  View [dbo].[viewchannelhist]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[viewchannelhist] as

Select a.PackageId,p.PackageName,ISNULL(ac.LOGINID,'System') as AddedBy,Convert(varchar,a.InsertedOn,120) as AddedOn,a.DMLComments,

cast(STUFF( (SELECT ','+  ISNULL(ar.ChannelName,' ')

FROM SMS_CHANNELINPACKAGE_HISTORY h

INNER JOIN SMS_CHANNEL ar ON h.ChannelId = ar.Id

WHERE h.PackageId=a.PackageId and Convert(varchar,h.InsertedOn,120)=Convert(varchar,a.InsertedOn,120)

FOR XML PATH('')), 1, 1, '') as varchar(max)) as Channels

from SMS_CHANNELINPACKAGE_HISTORY a left join SMS_ACCESS ac on a.InsertedBy=ac.ID

left join SMS_PACKAGE p on p.Id=a.PackageId

group by a.PackageId,Convert(varchar,a.InsertedOn,120),a.DMLAction,a.DMLComments,p.PackageName,ac.LOGINID 
GO
