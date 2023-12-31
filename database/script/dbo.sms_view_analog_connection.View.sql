USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_analog_connection]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_analog_connection] as
select l.Id,f.Id as AccountId,f.Address,f.AreaName,f.CustomerId,f.OperatorName,f.Branch,f.BranchId,f.ParentOperatorId,
f.SocietyId,f.SocietyName,f.SubscriberName,f.TVId,f.ConnectionId,f.CreatedOn,f.CreatedBy,f.BillingSMonth,
f.ApplicableRate,l.ActionFlag,f.IsPrimary,f.Deleted
,f.AreaId,f.ActivationDate,f.DeactivationDate, 
case when l.ActionFlag='1' and f.ApplicableRate=1  then 'MNewInstallation' 
	when l.ActionFlag='1' and f.ApplicableRate=0  then 'ENewInstallation' 
	 when l.ActionFlag='3'  and f.ApplicableRate=1 then 'MDeactivation' 
	 when l.ActionFlag='3'  and f.ApplicableRate=0 then 'EDeactivation' 
	 when l.ActionFlag='2' and f.ApplicableRate=1 then 'MReconnection'
	 when l.ActionFlag='2' and f.ApplicableRate=0 then 'EReconnection'
	 when l.ActionFlag='4'  and f.ApplicableRate=1 then 'MDisconnection' 
	 when l.ActionFlag='4'  and f.ApplicableRate=0 then 'EDisconnection' 
     End as Actions,l.DateTime as Actiondate,f.Status
from SMS_Z_A_ACTIVEINACTIVE_LOG l left join 
sms_h_view_analog_accounts_details f on l.AccountId=f.id
where f.Id is not null
GO
