USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_cascommand]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[sms_view_cascommand] as  
select s.Id,s.CustomerId,s.OperatorId,s.SocietyId,s.SubscriberName,s.Area,s.AreaId,s.SocietyCode,p.STBNo,p.SmartcardNo,p.SmartCardId,p.StbId,p.AccountId,p.CASTYPEID,p.Id as PairingId,  
'<input type="checkbox" name="chk[]" id="chk'+cast(p.SmartCardId as varchar)+'" value="'+cast(p.SmartCardId as varchar)+'">' as Action  
from sms_view_pairing p left join sms_view_subscribers s on s.Id=p.SubscriberId  
where s.CustomerId is not null  

GO
