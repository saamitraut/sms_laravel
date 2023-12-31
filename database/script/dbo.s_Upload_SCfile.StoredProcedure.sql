USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[s_Upload_SCfile]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[s_Upload_SCfile] 
@UpLogId as bigint,@brandId as bigint
as
Begin
Declare @query varchar(8000)
Declare @UserId as bigint
Declare @UpFilePath as varchar(8000)
Select @UpFilePath=SavedFilePathName,@UserId=InsertedBy from SMS_FILEUPLOADLOG where Id=@UpLogId
If (@UpFilePath is not null)
Begin
	if(object_id('temp_sc') is not null)
	drop table temp_sc
	CREATE TABLE temp_sc
	(	
		SCNO VARCHAR(50)	
	)
	Set @query ='begin  try
	 BULK INSERT temp_sc 
		FROM '''+@UpFilePath+'''
		WITH 
		(	FIRSTROW =1,       
			ROWTERMINATOR = ''\n''
		)		
	end try
	Begin Catch
		print ''file not exits''		
	End Catch'
	print (@query)
	exec (@query)
		
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
	
	
	
Delete from temp_sc where SCNO in ( Select SCNO from
(Select ROW_NUMBER() over (Partition by SCNO order by RID desc) as ROWID,x.SCNO
from 
(select ROW_NUMBER() over ( order by SCNO  ) as RID , SCNO
	from temp_sc) x) y
	where ROWID>1)
	
		insert into SMS_SMARTCARDUPLOAD (SCNO,UpLogId,Status,Remark)
		Select SCNO,@UpLogId,dbo.RegexMatch(@patren,ltrim(rtrim((SCNO)))),Case dbo.RegexMatch(@patren,ltrim(rtrim((SCNO)))) 
		when 1 then 'true' else @msg end
		from temp_sc where SCNO not in (Select SmartcardNo from SMS_SMARTCARDS)
		
		
		update SMS_SMARTCARDUPLOAD set SMS_SMARTCARDUPLOAD.Status=0,SMS_SMARTCARDUPLOAD.Remark='Duplicate Entry'
		from (
		Select MAX(Id) as Mid,left(ltrim(rtrim(SCNO)),@significant) as SCNO from SMS_SMARTCARDUPLOAD 
		where UpLogId=@UpLogId group by  
		left(ltrim(rtrim(SCNO)),@significant) having COUNT(*)>1 ) a where SMS_SMARTCARDUPLOAD.Id=a.Mid
		
		update SMS_SMARTCARDUPLOAD set SMS_SMARTCARDUPLOAD.Status=0,SMS_SMARTCARDUPLOAD.Remark='Duplicate Entry'
		where SCNO in (Select SmartcardNo  from SMS_SMARTCARDS) and  UpLogId=@UpLogId
		
				
		Update SMS_SMARTCARDUPLOAD set Status=0,Remark='SCNo Already Exists' From SMS_SMARTCARDS a
		where left(ltrim(rtrim(a.SmartcardNo)),@significant)=left(ltrim(rtrim(SMS_SMARTCARDUPLOAD.SCNO)),@significant) 
		and SMS_SMARTCARDUPLOAD.Status=1 and SMS_SMARTCARDUPLOAD.UpLogId=@UpLogId
		
		insert into SMS_SMARTCARDS(SmartcardNo,BrandId,UploadLogId,CreatedOn,CreatedBy)
		Select SCNO,@brandId,UpLogId,getdate(),@UserId from SMS_SMARTCARDUPLOAD where Status=1 and
		SCNO not in (Select SmartcardNo from SMS_SMARTCARDS)and
		left(ltrim(rtrim(SCNO)),@significant) not in 	(Select left(ltrim(rtrim(SmartcardNo)),@significant) from SMS_SMARTCARDS) 
		and UpLogId=@UpLogId
		 
		Declare @Total as Int
		Declare @Sucess as Int
		Declare @Err as Int

		Select @Sucess=isnull((Select Count(*) From SMS_SMARTCARDUPLOAD  where UpLogId=@UpLogId and Status=1),0),
		@Err=isnull((Select Count(*) From SMS_SMARTCARDUPLOAD  where UpLogId=@UpLogId and Status=0),0)

		Set @Total=@Sucess+@Err

		update SMS_FILEUPLOADLOG set UploadLogFilePathName='SC_'+cast(Id as varchar),SucessRecord=@Sucess,ErrorRecord=@Err
		,TotalRecords=@Total,EndedOn=getdate() where Id=@UpLogId
		
		Select  TotalRecords,SucessRecord,ErrorRecord,UploadLogFilePathName from  SMS_FILEUPLOADLOG where Id=@UpLogId

		Select Cast(Row_NUMBER() over (Order by Id) as varchar) as '#',SCNO as SmartCardNo,Case Status when 0 then 'Error' else 'Ok' end As Status,
		Remark from SMS_SMARTCARDUPLOAD where UpLogId=@UpLogId
if(object_id('temp_sc') is not null)
	drop table temp_sc

End
end
GO
