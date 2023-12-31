USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_ConaxCommandLog]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_ConaxCommandLog] as



select a.Id as Id,a.CommandName,a.AccountId,a.SmartcardNo,a.STBNo,a.PackageId,a.AlacarteId,a.ProductCode,a.ActivationDate,a.DeactivationDate,

a.Request,a.Response,a.Result,a.StatusCode,a.TransId,a.Description,a.CreatedOn,a.CreatedBy,a.CommandDate,a.ConnaxFileLogId

,case a.CommandName when 'ADD_SUBSCRIPTIONS' then cast('ps'+TransactionId+'.emm' as varchar) when 'CANCEL_SUBSCRIPTIONS' then cast('cs'+TransactionId+'.emm' as varchar) 

when 'CREATE_PAIRING' then cast('vp'+TransactionId+'.emm' as varchar) when 'DISPLAY_FINGERPRINT' then cast('gp'+TransactionId+'.emm' as varchar) end  as Filename



 from ConaxCommandLog a inner join ConnaxFileLog b on a.ConnaxFileLogId=b.Id


GO
