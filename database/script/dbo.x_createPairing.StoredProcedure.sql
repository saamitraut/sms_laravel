USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[x_createPairing]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[x_createPairing] @stbId as bigint,@smartcardId as bigint,@UserId as bigint  
As  
begin  
declare @stb_msg as varchar(100)  
declare @sc_msg as varchar(100)  
declare @pairingId as bigint  
declare @castypstb as int
declare @castypsc as int

 Select @stb_msg=case when AccountId>0 then 'Already Alloted to SubscriberId '+dbo.getCustomerId(SubscriberId)   
 when PairingId>0 then 'Already Associated with Smartcard '+dbo.getPairingSCNo(PairingId) else 'Ok' end,
 @castypstb=CASTYPEID      
 from sms_view_stb where id=@stbId  
 
 Select @sc_msg=case when AccountId>0 then 'Already Alloted to SubscriberId '+dbo.getCustomerId(SubscriberId)   
 when PairingId>0 then 'Already Associated with STB '+dbo.getPairingSTBNo(PairingId) else 'Ok' end,
 @castypsc=CASTYPEID   
 from sms_view_smartcard where id=@smartcardId  
 
 If @castypsc=@castypstb
	Begin  
	 if @sc_msg='Ok' and @stb_msg='Ok'  
	 begin  
	  insert into SMS_PAIRING (SmartCardId,StbId,CreatedOn,CreatedBy)values (@smartcardId,@stbId,GETDATE(),@UserId)  
	  Select @pairingId=SCOPE_IDENTITY()   
	  declare @castypeid as int  
	  select @castypeid=CASTYPEID from sms_view_pairing where Id=@pairingId  
	  if(@castypeid=3)  
	  begin  
	  insert into SMS_COMMAND_TABLE_SOAP (CasId,CommandName,SubscriberId,AccountId,  
	  SmartcardId,StbId,PairingId,StbNo,SmartcardNo,Remark,CommandDate,CreatedOn,CreatedBy,Cmd_Params)  
	  select 3 as CasId,'setStbDetail',SubscriberId,AccountId,SmartCardId,StbId,Id,STBNo,  
	  SmartcardNo,'SET STB FROM PAIRING PROC',GETDATE(),GETDATE(),CreatedBy,'"STBID":"'+cast(SmartCardId as varchar)+'","STBSerialNo":"'+StbNo+'",  
	  "STBUAKey":"'+SmartcardNo+'",  
	  "STBManufactureName":"'+BrandTitle+'","STBStatus":"'+cast(isnull(AccountStatus,0) as varchar)+'",  
	  "CreatedBy":"'+cast(CreatedBy as varchar)+'","CreationDate":"'+CONVERT(VARCHAR(19), GETDATE(), 120)+'",  
	  "Cost":"'+cast(1 as varchar)+'"'  
	  from sms_view_pairing where Id=@pairingId  
	  end   
	 End  
	End
	Else
	 Select 'CAS Type Does Not Match' as msg, isnull(@pairingId,0) as PairingId

Select isnull(@sc_msg,'Invalid Smartcard')+'<br>'+isnull(@stb_msg,'Invalid STBNo') as msg,isnull(@pairingId,0) as PairingId  
   
End
GO
