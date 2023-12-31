USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_his_package]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[sms_his_package] as 
select top 100 Percent ROW_NUMBER()over(Order by DoneON)as RID,* from 
(
Select a.*,isnull(b.LOGINID,'System') as DoneBy,cast(convert(varchar(16),InsertedOn,120)as Datetime) as DoneOn,
cast(STUFF( (SELECT ','+  ISNULL(ar.ChannelName,' ')+cast(h.DMLAction as varchar)
        FROM SMS_CHANNELINPACKAGE_HISTORY h
        INNER JOIN SMS_CHANNEL ar ON h.ChannelId = ar.Id
        WHERE h.InsertedBy=a.InsertedBy and Convert(varchar(10),h.InsertedOn,120)=Convert(varchar(10),a.InsertedOn,120) 
       and a.DMLAction=case when h.DMLAction=3 then 2 else h.DMLAction end 
        and h.PackageId=a.FId
        FOR XML PATH('')), 1, 1, '') as varchar(max)) as Channels
from SMS_PACKAGE_HISTORY a left join SMS_ACCESS b on a.InsertedBy=b.ID
)x

GO
