USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_digital_connection]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_digital_connection] as
select l.Id,f.Id as AccountId,f.PairingId,f.TimeShift,f.SubscriberId,f.ConnectionId,f.ApplicableRate,f.BillingSMonth,f.ActivationDate,f.DeactivationDate,f.IsPrimary,f.Description,f.ActionTaken,f.Status,f.CreatedOn,f.CreatedBy,f.UpdatedOn,f.UpdatedBy,f.Deleted,f.SmartCardId,f.StbId,f.STBNo,f.SmartcardNo,f.BoxType,f.BrandTitle,f.StbBrandId,f.CurrentStatus,f.CustomerId,f.FormNo,f.OperatorId,f.SocietyId,f.SubscriberName,f.AreaName,f.AreaId,f.SocietyCode,f.SocietyName,f.FlatNo,f.FloorNo,f.Address,f.MobileNo,f.Phone,f.Wing,f.Building,f.Email,f.DOB,f.OCCUPATION,f.Zipcode
,l.ActionFlag,
case when l.ActionFlag='1' and f.BoxType=0 and f.ApplicableRate=1 then 'MSDNewConnection' 
	when l.ActionFlag='1' and f.BoxType=0 and f.ApplicableRate=0 then 'ESDNewConnection' 
	 when l.ActionFlag='1' and f.BoxType=1 and f.ApplicableRate=1 then 'MHDNewConnection' 
	 when l.ActionFlag='1' and f.BoxType=1 and f.ApplicableRate=0 then 'EHDNewConnection' 
	 when l.ActionFlag='3' and f.BoxType=1 and f.ApplicableRate=1 then 'MHDDeactivation' 
	 when l.ActionFlag='3' and f.BoxType=0  and f.ApplicableRate=0 then 'ESDDeactivation' 
	 when l.ActionFlag='2' and f.BoxType=0  and f.ApplicableRate=1 then 'MSDActivated'
	 when l.ActionFlag='2' and f.BoxType=1  and f.ApplicableRate=0 then 'EHDActivated'
     when l.ActionFlag='4' and f.BoxType=0 and f.ApplicableRate=1  then 'MSDDisconnected' 
     when l.ActionFlag='4' and f.BoxType=1  and f.ApplicableRate=0 then 'HDDisconnected' 
		end as Actions,l.DateTime as Actiondate
from SMS_Z_D_ACTIVEINACTIVE_LOG l left join 
sms_view_allotments f on l.AccountId=f.Id
where f.id is not null
GO
