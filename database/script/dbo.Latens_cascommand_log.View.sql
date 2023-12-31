USE [MNSMS]
GO
/****** Object:  View [dbo].[Latens_cascommand_log]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Latens_cascommand_log] 

As  

select a.Id,s.CustomerId as CustomerId,s.SubscriberName as SubscriberName,s.Operator,s.OperatorId as OperatorId, isnull(r.SmartCardNo , 'N/A') as SmartCardNo,isnull(r.STBNo,'N/A') as STBNo

,case when IsAlacarte=0 then (Select PackageName from SMS_PACKAGE where Id=PackageId) when IsAlacarte=1 then (Select channelName from SMS_CHANNEL where Id=PackageId) end as packagename,

a.ComandName,'' as Command,'Send' as Status,a.Result as Response,e.CodeDescription as Description, convert(varchar(19),a.CreatedOn,120) as AddedOn,a.IsAlacarte,a.PackageId,a.CreatedOn,a.Result,a.CreatedBy,

b.NAME as AddedBy,s.Id as SubscriberId,p.Id as AccountId  

from LatensCommandLog a   

left join sms_h_view_digital_accounts p on a.SubscriberId=p.SubscriberId  

left join sms_h_view_pairing r on r.Id=p.PairingId
left join sms_view_subscribers s on a.SubscriberId=s.ID  

left join SMS_ACCESS b on a.CreatedBy=b.ID  

left join LatensErrorCodes e on a.ErrorCode=e.ErrorCode and a.SubErrorCode=e.SubError  

where s.Id is not null
GO
