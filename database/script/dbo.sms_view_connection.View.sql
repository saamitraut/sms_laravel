USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_connection]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_connection] as
select l.Id,f.id as AccountId,f.Address,f.Areaname,f.CustomerId,f.FormNo,f.MobileNo,f.OperatorName,f.ApplicableRate,f.BillingSMonth,f.BoxType
,f.Branch,f.BranchId,f.BrandTitle,f.Building,f.ConnectionId,f.CurrentStatus,f.Deleted,f.FlatNo,f.FloorNo,f.IsPrimary,f.OperatorId
,f.ParentOperatorId,f.SmartCardId,f.Status,f.StbBrandId,f.StbId,f.STBNo,f.SmartcardNo,f.CreatedBy,f.CreatedOn
,f.SocietyId,f.SocietyName,f.SubscriberName,f.Areaid
,f.ActivationDate,f.DeactivationDate,l.ActionFlag, 
case when l.ActionFlag='1' and f.BoxType=0 and f.ApplicableRate=1 then 'MSDNewConnection' 
	 when l.ActionFlag='1' and f.BoxType=0 and f.ApplicableRate=0 then 'ESDNewConnection' 
	 when l.ActionFlag='1' and f.BoxType=1 and f.ApplicableRate=1 then 'MHDNewConnection' 
	 when l.ActionFlag='1' and f.BoxType=1 and f.ApplicableRate=0 then 'EHDNewConnection' 
	 when l.ActionFlag='3' and f.BoxType=1 and f.ApplicableRate=1 then 'MHDDeactivation' 
	 when l.ActionFlag='3' and f.BoxType=1 and f.ApplicableRate=0 then 'EHDDeactivation' 
	 when l.ActionFlag='3' and f.BoxType=0 and f.ApplicableRate=1  then 'MSDDeactivation' 
	 when l.ActionFlag='3' and f.BoxType=0 and f.ApplicableRate=0  then 'ESDDeactivation' 
	 when l.ActionFlag='2' and f.BoxType=0  and f.ApplicableRate=1 then 'MSDActivated'
	 when l.ActionFlag='2' and f.BoxType=0  and f.ApplicableRate=0 then 'ESDActivated'
	 when l.ActionFlag='2' and f.BoxType=1  and f.ApplicableRate=1 then 'MHDActivated'
	 when l.ActionFlag='2' and f.BoxType=1  and f.ApplicableRate=0 then 'EHDActivated'
     when l.ActionFlag='4' and f.BoxType=0  and f.ApplicableRate=1 then 'MSDDisconnected' 
     when l.ActionFlag='4' and f.BoxType=0  and f.ApplicableRate=0 then 'ESDDisconnected' 
     when l.ActionFlag='4' and f.BoxType=1  and f.ApplicableRate=1 then 'MHDDisconnected' 
     when l.ActionFlag='4' and f.BoxType=1  and f.ApplicableRate=0 then 'EHDDisconnected' 
		end as Actions,l.DateTime as Actiondate
from SMS_Z_D_ACTIVEINACTIVE_LOG l left join 
[sms_h_view_digital_accounts_details] f on l.AccountId=f.id
where f.id is not null
GO
