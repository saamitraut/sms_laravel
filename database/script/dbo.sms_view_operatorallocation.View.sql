USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_operatorallocation]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[sms_view_operatorallocation] as
select a.*,b.id as OperatorId,b.NAME as OperatorName,b.CODE,isnull(
(select top 1 ID  from sms_subscriberaccounts where pairingId=a.Id),0) as Accouts from sms_view_pairing a
left outer join sms_operator b on b.Id=a.AllocatedOperatorId
left outer join SMS_SMARTCARDS c on c.Id=a.SmartCardId
left outer join SMS_STBS d on d.Id=a.Stbid where a.AllocatedOperatorId>0
GO
