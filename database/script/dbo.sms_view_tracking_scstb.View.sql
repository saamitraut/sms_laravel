USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_tracking_scstb]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[sms_view_tracking_scstb]    
as    
  
select * from (  
 select b.SmartcardNo,c.STBNo,d.NAME,
 case when a.Status=0 then 'Pairing QC' when a.Status=1 and a.AllocatedOperatorId=0 then 'Pairing Stock' when a.Status=1 and a.AllocatedOperatorId>0 then 'Operator Stock'
 when a.Status=3 then 'Faulty' when a.Status=4 then 'Blacklisted' end as Stat,   
 case a.DMLAction when 1 then 'In Pairing Stock' when 3 then 'Pairing is Deleted and returned to QC' when 2 then   
 case when AllocatedOperatorId!=0 then 'Allocated to Operator'   
  when AllocatedOperatorId=0 then 'In Pairing Stock' 
  --when AllocatedOperatorId IS null then 'Invalid' 
  else 'Pairing is Updated' end  
  end as Act,ISNULL(a.UpdatedOn,a.CreatedOn) as AddedOn,  
  --case a.DMLAction when 1 then 0 when 3 then 0 when 2 then  
  ISNULL(AllocatedOperatorId,0) as OpId,'N/A' as SubscriberName,'N/A' as CustomerId,a.Remark    
 from SMS_PAIRING_HISTORY a left outer join SMS_SMARTCARDS_HISTORY b on a.SmartCardId=b.SmartcardId  
 left outer join SMS_STBS_HISTORY c on c.STBId=a.StbId   
 left outer join SMS_ACCESS d on d.ID=isnull(a.UpdatedBy,a.CreatedBy)  
  
   
 union   
   
 select max(d.SmartcardNo) as SmartcardNo,max(c.STBNo) as STBNo,max(e.NAME ) as Name,
 case a.Status when 1 then 'Active' when 0 then 'Inactive' end as Stat,  
 case a.DMLAction when 1 then 'Assigned to Subscriber' when 2 then 'Modified Account' when 3 then 'Disconnected from Subscriber' end as Act,   
 max(ISNULL(a.UpdatedOn,a.CreatedOn)) as AddedOn, max(b.AllocatedOperatorId) as OpId,max(f.SubscriberName) as SubscriberName,max(f.CustomerId) as CustomerId,  
 a.Remark  
 from SMS_SUBSCRIBERACCOUNTS_HISTORY a left outer join SMS_PAIRING_HISTORY b on b.FId=a.PairingId   
 left outer join sms_view_subscribers f on f.Id= a.SubscriberId  
 left outer join SMS_SMARTCARDS_HISTORY d on b.SmartCardId=d.SmartcardId  
 left outer join SMS_STBS_HISTORY c on c.STBId=b.StbId  
 left outer join SMS_ACCESS e on e.ID=ISNULL(a.UpdatedBy,a.CreatedBy)  
 group by b.FId, a.DMLAction,a.InsertedOn,a.Remark,a.Status  
   
 union   
   
 select 'N/A' as SmartcardNo,a.STBNo,e.NAME ,
 case a.Status when 0 then 'QC' when 1 then 'Ready' when 3 then 'Faulty' when 4 then 'BlackListed' end as Stat,
 case a.DMLAction when 1 then 'Box in QC' when 2   
 then case a.Status when 3 then 'Box is send to Faulty' when 4 then 'Box is Blacklisted' else 'Box is Updated' end   
 else 'Invalid' end as Act,ISNULL(a.UpdatedOn,a.CreatedOn) as AddedOn, 0 as OpId,'N/A' as SubscriberName,'N/A' as CustomerId,  
 a.Remark    
 from SMS_STBS_HISTORY a   
 left outer join SMS_ACCESS e on e.ID=ISNULL(a.UpdatedBy,a.CreatedBy)  
  
   
 union   
   
 select a.SmartcardNo, 'N/A' as STBNo, e.NAME,
 case when a.Status=0 then 'QC' when a.Status=1 then 'Ready' when a.Status=3 then 'Faulty' when a.Status=4 then 'BlackListed' end as Stat,
 case a.DMLAction when 1 then 'Smartcard in QC' when 2   
 then case a.Status when 3 then 'Smartcard is send to Faulty' when 4 then 'Smartcard is Blacklisted' else 'Smartcard is Updated' end   
 else 'Invalid' end as Act,ISNULL(a.UpdatedOn,a.CreatedOn) as AddedOn, 0 as OpId,'N/A' as SubscriberName,'N/A' as CustomerId,  
 a.Remark  
 from SMS_SMARTCARDS_HISTORY a   
 left outer join SMS_ACCESS e on e.ID=ISNULL(a.UpdatedBy,a.CreatedBy)  
  
    
 ) x   

GO
