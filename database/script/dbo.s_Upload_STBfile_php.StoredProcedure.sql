USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[s_Upload_STBfile_php]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[s_Upload_STBfile_php] @UpLogId as bigint,@brandId as bigint

as

Begin

Declare @query varchar(8000)

Declare @UserId as bigint

Declare @UpFilePath as varchar(8000)

Select @UpFilePath=SavedFilePathName,@UserId=InsertedBy from SMS_FILEUPLOADLOG where Id=@UpLogId



		

		declare @r as varchar(100)

		declare @patren as varchar(100)

		declare @msg varchar(100)

		declare @len int

		declare @significant int

		declare @ChipIdRequired bit=0

	Select 

	@patren=Case CharAllowed when 1 then '^\d{'+CAST(Maxlength as varchar)+'}$' when 2 then '^([a-zA-Z0-9]){'+CAST(Maxlength as varchar)+'}$'

	 when 3 then '^([a-fA-F0-9]){'+CAST(Maxlength as varchar)+'}$' else '^([a-zA-Z]){'+CAST(Maxlength as varchar)+'}$' end 

	,@msg=CAST(Maxlength as varchar)+' Digits only '+Case CharAllowed when 1 then 'Numeric' when 2 then 'AlphaNumeric' when 3 then 'Hexadecimal' else 'Alphabets' end +' Value'

	,@len=Maxlength,@significant=SignificantDigits from SMS_STBSCBRAND where Id=@brandId

		

		

		update SMS_STBUPLOAD set SMS_STBUPLOAD.Status=0,SMS_STBUPLOAD.Remark='STB Duplicate Entry'

		from (

		Select MAX(Id) as Mid,left(ltrim(rtrim(STBNO)),@significant) as STBNO from SMS_STBUPLOAD 

		where UpLogId=@UpLogId group by  

		left(ltrim(rtrim(STBNO)),@significant) having COUNT(*)>1) a where SMS_STBUPLOAD.Id=a.Mid		

		

	

		

		insert into SMS_STBS(STBNO,MACADDRESS,BrandId,UploadLogId,CreatedOn,CreatedBy)

		Select STBNO,MACADDR,@brandId,UpLogId,getdate(),@UserId   

		from SMS_STBUPLOAD where Status=1 		

		and UpLogId=@UpLogId

		Declare @Total as Int

		Declare @Sucess as Int

		Declare @Err as Int



		Select @Sucess=isnull((Select Count(*) From SMS_STBUPLOAD  where UpLogId=@UpLogId and Status=1),0),

		@Err=isnull((Select Count(*) From SMS_STBUPLOAD  where UpLogId=@UpLogId and Status=0),0)



		Set @Total=@Sucess+@Err



		update SMS_FILEUPLOADLOG set UploadLogFilePathName='STB_'+cast(Id as varchar),SucessRecord=@Sucess,ErrorRecord=@Err

		,TotalRecords=@Total,EndedOn=getdate() where Id=@UpLogId

		

		Select  TotalRecords,SucessRecord,ErrorRecord,UploadLogFilePathName from  SMS_FILEUPLOADLOG where Id=@UpLogId



		Select Cast(Row_NUMBER() over (Order by Id) as varchar) as '#',' '+StbNo as StbNo,Case Status when 0 then 'Error' else 'Ok' end As Status,

		Remark from SMS_STBUPLOAD where UpLogId=@UpLogId



End






GO
