USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[cas_sms_get_Gospel_bootupchannel_Global]    Script Date: 2023-11-10 06:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
Create proc[dbo].[cas_sms_get_Gospel_bootupchannel_Global] 
@channelId as varchar(8000),  
@UserId as bigint,
@ExpiredTime as datetime
as   
Begin  
 if(@channelId is not null or @channelId!='')  
 Begin  
declare @PCRPID as varchar(50)
declare @AudioComPID as varchar(50)
declare @VideoComPID as varchar(50)
declare @AudioECMPID as varchar(50)
declare @VideoECMPID as varchar(50)
declare @SymbolRate as varchar(50)
declare @frequency as varchar(50)
declare @QAM as varchar(50)
declare @serviceid as varchar(50)

   Select @PCRPID=dbo.fn_varbintostr_(PcrId,4) ,
   @AudioComPID=dbo.fn_varbintostr_(ComponentPidAudio,4),@VideoComPID=dbo.fn_varbintostr_(ComponentPidVideo,4),
   @AudioECMPID=dbo.fn_varbintostr_(EcmPidAudio,4),@VideoECMPID=dbo.fn_varbintostr_(EcmPidVideo,4),
   @SymbolRate=SymbolRate+'0',@frequency='0'+Frequency+'0000',@QAM=case when QAM='64' then '0300' when QAM='256' then '0500' end  ,
   @serviceId=dbo.fn_varbintostr_(ServiceId,4) from SMS_CHANNEL a  
   left outer join (Select * from dbo.Split_coma(@channelId)) b on a.Id=CAST(b.items as bigint)  
   where b.items is not null                                    

   declare @msg as varchar(200)  

    Insert into SMS_CAS_CMDS(SmartCardNo,SmartCardId,STBNo,StbId,SubscriberId,AccountId,CommandName,CommandId,
    Command,Remark,CommandDate,CreatedOn,CreatedBy,CASTYPE)
   select -1,-1,-1,-1,-1,-1,'Bootup',1, dbo.cas_abv_formatcmd('02'+'22'+'0050'+dbo.cas_Gospel_convert_smartcard
   ('FFFFFFFF')+'00000000'+'00'+'00'+@PCRPID+'00'+'FFFFFF'+'02'+'02'+'00'+@AudioComPID+@AudioECMPID+'01'
   +'00'+@VideoComPID+@VideoECMPID+'FFFF'+@frequency+'FFF'+'0'+@QAM
   +@SymbolRate+'0'+'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'+@serviceId+dbo.fn_getUTCHexdateTime(@ExpiredTime))
   ,'cas_Gospel_sms_addindatabase_account',GETDATE(),GETDATE(),-1,1 


   

   Set @msg='Boot Up Channel command send Successfully to selected Smartcards '   

   end

   else

   Set @msg='Please select channel'   

   

 Select @msg as msg  

    

End 
GO
