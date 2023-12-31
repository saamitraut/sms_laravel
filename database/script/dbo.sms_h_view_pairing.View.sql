USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_h_view_pairing]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_h_view_pairing] as

Select a.Id,(Select MAX(Id) from SMS_PAIRING_HISTORY where FId=a.id) as HId,a.SmartCardId,a.StbId,a.Status,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,a.Deleted,a.Remark,
a.IsLocked,a.LockedOn,a.LockedFrom,b.STBNo,c.SmartcardNo,b.BrandId,e.BoxType,
e.BrandTitle,e.TimeShift,e.CASTYPEID 

from SMS_PAIRING a

left outer join SMS_STBS b on a.StbId=b.Id

left outer join SMS_SMARTCARDS c on a.SmartCardId=c.Id

left outer join SMS_STBSCBRAND e on b.BrandId=e.Id

union 

Select a.Fid,a.Id as HId,a.SmartCardId,a.StbId,a.Status,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,a.Deleted,a.Remark,a.IsLocked,a.LockedOn,a.LockedFrom

,b.STBNo,c.SmartcardNo,b.BrandId,e.BoxType,e.BrandTitle,e.TimeShift,e.CASTYPEID 

from SMS_PAIRING_HISTORY a

left outer join SMS_STBS b on a.StbId=b.Id

left outer join SMS_SMARTCARDS c on a.SmartCardId=c.Id

left outer join SMS_STBSCBRAND e on b.BrandId=e.Id

where a.Deleted=1
GO
