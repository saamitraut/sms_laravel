USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[s_Upload_Pairing]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[s_Upload_Pairing] 
@UpLogId as bigint
as
Begin
Declare @query varchar(8000)
Declare @UserId as bigint
Declare @UpFilePath as varchar(8000)
Select @UpFilePath=SavedFilePathName,@UserId=InsertedBy from SMS_FILEUPLOADLOG where Id=@UpLogId
If (@UpFilePath is not null)
Begin
	if(object_id('temp_pairing') is not null)
	drop table temp_pairing
	CREATE TABLE temp_pairing
	(	
		SCNO VARCHAR(50),
		STBNO VARCHAR(50)
	)
	Set @query ='begin  try
	 BULK INSERT temp_pairing 
		FROM '''+@UpFilePath+'''
		WITH 
		(	FIRSTROW =1,       
			ROWTERMINATOR = ''\n''
			,FIELDTERMINATOR  = '',''
		)		
	end try
	Begin Catch
		print ''file not exits''		
	End Catch'
	print (@query)
	exec (@query)
	
	
	
		select a.*,isnull(b.Id,0) as StbId,isnull(b.PairingId,0) as StbPairingId into #temp_pstb from temp_pairing a
		left outer join sms_view_stb b on ltrim(rtrim(a.STBNO))=b.STBNo 		
		
		select a.*,isnull(b.Id,0) as SmartcardId,isnull(b.PairingId,0) as ScPairingId into #temp_p from #temp_pstb a
		left outer join sms_view_smartcard b on a.SCNO=b.SmartcardNo
		 
		select ROW_NUMBER()over(Partition by SmartcardId order by SmartcardId desc) as RID
		,ROW_NUMBER()over(Partition by STBId order by StbId desc) as TID,a.* into #tt from #temp_p a
		
		insert into SMS_PAIRING(SmartCardId,StbId,Status,CreatedOn,CreatedBy,sms_id)
		select SmartcardId,StbId,0,GETDATE(),@UserId,@UpLogId  from #tt where RID=1 and TID=1 
		and StbId>0 and SmartcardId>0 and ScPairingId=0 and StbPairingId=0
		
		insert into SMS_PAIRINGUPLOAD(SCNO,STBNO,IsError,ErrorMessage,UploadLogId)
		select a.SCNO,a.STBNO,Case when isnull(b.Id,0)=0 then 1 else 0 end,
		Case when b.Id is not null then 'Ok' else 
			Case when a.SmartCardId=0 then 'Smartcard Donot Exists' when RID>1 then 'Duplicate Smartcard In File' when ScPairingId>0 then 'Smartcard Already Paired' else '' end
			+'|'+Case when a.StbId=0 then 'STB Donot Exists'  when TID>1 then 'Duplicate STB In File' when ScPairingId>0 then 'STB Already Paired' else '' end
		end,@UpLogId from #tt a
		left outer join SMS_PAIRING b on a.StbId=b.StbId and a.SmartcardId=b.SmartCardId and  sms_id=@UpLogId
			
		Declare @Total as Int
		Declare @Sucess as Int
		Declare @Err as Int

		Select @Sucess=isnull((Select Count(*) From SMS_PAIRINGUPLOAD  where UploadLogId=@UpLogId and IsError=0),0),
		@Err=isnull((Select Count(*) From SMS_PAIRINGUPLOAD  where UploadLogId=@UpLogId and IsError=1),0)

		Set @Total=@Sucess+@Err

		update SMS_FILEUPLOADLOG set UploadLogFilePathName='PR_'+cast(Id as varchar),SucessRecord=@Sucess,ErrorRecord=@Err
		,TotalRecords=@Total,EndedOn=getdate() where Id=@UpLogId
		
		Select  TotalRecords,SucessRecord,ErrorRecord,UploadLogFilePathName from  SMS_FILEUPLOADLOG where Id=@UpLogId

		Select Cast(Row_NUMBER() over (Order by Id) as varchar) as '#',''''+SCNO+'''' as SmartCardNo,''''+STBNO+'''' as STBNo,Case IsError when 1 then 'Error' else 'Ok' end As Status,
		ErrorMessage as Remark from SMS_PAIRINGUPLOAD where UploadLogId=@UpLogId and IsError=1
		
		Update SMS_SMARTCARDS set SmartcardNo=a.SCNO
from 
(Select Distinct SCNO  from SMS_PAIRINGUPLOAD) a
where a.SCNO=SmartcardNo 
if(object_id('temp_pairing') is not null)
	drop table temp_pairing
	End

	Select  TotalRecords,SucessRecord,ErrorRecord,UploadLogFilePathName from  SMS_FILEUPLOADLOG where Id=@UpLogId             
  
	Select Cast(Row_NUMBER() over (Order by Id) as varchar) as '#',''''+SCNO+'''' as SmartCardNo,''''+STBNO+'''' as STBNo,Case IsError when 1 then 'Error' else 'Ok' end As Status,    
	ErrorMessage as Remark from SMS_PAIRINGUPLOAD where UploadLogId=@UpLogId and IsError=1   

end
GO
