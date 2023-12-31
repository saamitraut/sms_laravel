USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[s_Upload_SCfile_php]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[s_Upload_SCfile_php] @UpLogId as bigint,@brandId as bigint	  
as
Begin

Declare @query varchar(8000)
Declare @UserId as bigint
Declare @UpFilePath as varchar(8000)
Select @UserId=InsertedBy from SMS_FILEUPLOADLOG where Id=@UpLogId


		declare @r as varchar(100)
		declare @patren as varchar(100)
		declare @msg varchar(100)
		declare @len int
		declare @significant int

	Select 

	@patren=Case CharAllowed when 1 then '^\d{'+CAST(Maxlength as varchar)+'}$' when 2 then '^([a-zA-Z0-9]){'+CAST(Maxlength as varchar)+'}$'

	 when 3 then '^([a-fA-F0-9]){'+CAST(Maxlength as varchar)+'}$' else '^([a-zA-Z]){'+CAST(Maxlength as varchar)+'}$' end 

	,@msg=CAST(Maxlength as varchar)+' Digits only '+Case CharAllowed when 1 then 'Numeric' when 2 then 'AlphaNumeric' when 3 then 'Hexadecimal' else 'Alphabets' end +' Value'

	,@len=Maxlength,@significant=SignificantDigits	 from SMS_STBSCBRAND where Id=@brandId

	

--	print '-------------------------------------Step2--------------------------'

			

--print '-------------------------------------Step4--------------------------'

	---print convert(varchar,GETDATE(),120)		

		update SMS_SMARTCARDUPLOAD set SMS_SMARTCARDUPLOAD.Status=0,SMS_SMARTCARDUPLOAD.Remark='Duplicate Entry'

		from (

		Select MAX(Id) as Mid,left(ltrim(rtrim(SCNO)),@significant) as SCNO from SMS_SMARTCARDUPLOAD 

		where UpLogId=@UpLogId group by  

		left(ltrim(rtrim(SCNO)),@significant) having COUNT(*)>1 ) a where SMS_SMARTCARDUPLOAD.Id=a.Mid

		

	---	print '-------------------------------------Step4--------------------------'

	-- print convert(varchar,GETDATE(),120)

	 

		----select * --into #t_alteady 

		----from (

		----Select left(ltrim(rtrim(SmartcardNo)),10) as SCNO from SMS_SMARTCARDS

		----intersect 

		----Select Distinct left(ltrim(rtrim(SCNO)),10) as SCNO  from SMS_SMARTCARDUPLOAD a where UpLogId=20

		----) x 

				

		--Update SMS_SMARTCARDUPLOAD set Status=0,Remark='SCNo Already Exists' From #t_alteady a

		--where a.SCNO=left(ltrim(rtrim(SMS_SMARTCARDUPLOAD.SCNO)),@significant) 

		--and SMS_SMARTCARDUPLOAD.Status=1 and SMS_SMARTCARDUPLOAD.UpLogId=@UpLogId

		

	--	print '-------------------------------------Step5--------------------------'

	--print convert(varchar,GETDATE(),120)

		insert into SMS_SMARTCARDS(SmartcardNo,BrandId,UploadLogId,CreatedOn,CreatedBy)

		Select SCNO,@brandId,UpLogId,getdate(),@UserId from SMS_SMARTCARDUPLOAD a		

		where a.Status=1 and a.UpLogId=@UpLogId

		Declare @Total as Int

		Declare @Sucess as Int

		Declare @Err as Int

--print '-------------------------------------Step6--------------------------'

	--print convert(varchar,GETDATE(),120)

		Select @Sucess=isnull((Select Count(*) From SMS_SMARTCARDUPLOAD  where UpLogId=@UpLogId and Status=1),0),

		@Err=isnull((Select Count(*) From SMS_SMARTCARDUPLOAD  where UpLogId=@UpLogId and Status=0),0)



		Set @Total=@Sucess+@Err

--print '-------------------------------------Step7--------------------------'

	--print convert(varchar,GETDATE(),120)

		update SMS_FILEUPLOADLOG set UploadLogFilePathName='SC_'+cast(Id as varchar),SucessRecord=@Sucess,ErrorRecord=@Err

		,TotalRecords=@Total,EndedOn=getdate() where Id=@UpLogId

		

		Select  TotalRecords,SucessRecord,ErrorRecord,UploadLogFilePathName from  SMS_FILEUPLOADLOG where Id=@UpLogId

--print '-------------------------------------Step8--------------------------'

	--print convert(varchar,GETDATE(),120)

		Select Cast(Row_NUMBER() over (Order by Id) as varchar) as '#',','+SCNO as SmartCardNo,Case Status when 0 then 'Error' else 'Ok' end As Status,

		Remark from SMS_SMARTCARDUPLOAD where UpLogId=@UpLogId

		--print '-------------------------------------Step3--------------------------'

	--print convert(varchar,GETDATE(),120)





End
GO
