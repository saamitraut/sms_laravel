USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_h_view_digital_accounts]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_h_view_digital_accounts] as

select 

Id,(Select MAX(Id) from SMS_SUBSCRIBERACCOUNTS_HISTORY where FId=a.id) as HId,PairingId,TimeShift,SubscriberId,ConnectionId,ApplicableRate,

BillingSMonth,ActivationDate,DeactivationDate,IsPrimary,Description,

ActionTaken,Status,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,Deleted

from SMS_SUBSCRIBERACCOUNTS a 

union 

Select Fid, HId,PairingId,TimeShift,SubscriberId,ConnectionId,ApplicableRate,

BillingSMonth,ActivationDate,DeactivationDate,IsPrimary,Description,

ActionTaken,Status,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,Deleted

 from 

(select ROW_NUMBER()over(partition by SubscriberId,Fid order by Id desc) as Rid,

Fid,Id as HId,PairingId,TimeShift,SubscriberId,ConnectionId,ApplicableRate,

BillingSMonth,ActivationDate,DeactivationDate,IsPrimary,Description,

ActionTaken,Status,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,Deleted

from SMS_SUBSCRIBERACCOUNTS_HISTORY where Deleted=1) x where Rid=1
GO
