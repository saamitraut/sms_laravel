USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_h_view_analog_accounts]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_h_view_analog_accounts] as
select 
a.Id,(Select MAX(Id) from SMS_SUBSCRIBERS_ANALOG_ACCOUNTS_HISTORY where FId=a.id) as HId,a.TVId,
a.SubscriberId,a.ConnectionId,a.BillingSMonth,a.ActivationDate,a.DeactivationDate,a.IsPrimary,a.ApplicableRate,a.Description,
a.ActionTaken,a.Status,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,a.Deleted
from SMS_SUBSCRIBERS_ANALOG_ACCOUNTS a
union 
select 
a.Fid,a.Id as HId,a.TVId,a.SubscriberId,a.ConnectionId,a.BillingSMonth,a.ActivationDate,a.DeactivationDate,
a.IsPrimary,a.ApplicableRate,a.Description,a.ActionTaken,a.Status,a.CreatedOn,a.CreatedBy,a.UpdatedOn,a.UpdatedBy,a.Deleted
from SMS_SUBSCRIBERS_ANALOG_ACCOUNTS_HISTORY a
where a.deleted=1
GO
