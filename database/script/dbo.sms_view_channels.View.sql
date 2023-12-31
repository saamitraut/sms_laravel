USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_channels]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[sms_view_channels]
as
SELECT     a.*,b.BROADCASTERNAME,b.BROADCASTERDESC,
	PackagesName=cast(substring 
                          ((SELECT     ('~' + xc.PackageName)
                              from SMS_CHANNELINPACKAGE xa
							left outer join SMS_PACKAGE xc on xc.Id=xa.PackageId
							 WHERE     a.Id = xa.ChannelId
							ORDER BY xc.PackageName, xc.Id FOR XML PATH('')),2,8000) as varchar(8000))
	,PackagesCasCode=cast(substring 
                          ((SELECT     ('~' + xc.CasCode)
                              from SMS_CHANNELINPACKAGE xa
							left outer join SMS_PACKAGE xc on xc.Id=xa.PackageId
							 WHERE     a.Id = xa.ChannelId
							ORDER BY xc.PackageName, xc.Id FOR XML PATH('')),2,8000) as varchar(8000))
	,Channels=(Select Count(Id) from SMS_CHANNELINPACKAGE where ChannelId=a.Id)
FROM         SMS_CHANNEL a
left outer join SMS_BROADCASTER b on a.BroadcasterId=b.Id

GO
