USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[connax_uploadfile]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[connax_uploadfile]

AS

Begin



declare @Filename varchar(500);

declare @Filepath varchar(500);

declare @TransactionId varchar(500);

declare @DestPath varchar(500);

declare @prefix varchar(2);

declare @Id int;



Select top 50 * into #connaxLog from ConnaxFileLog where Status=1 and Actiondate<=GETDATE() order by id asc



while exists(Select * from #connaxLog)

Begin

	Select top 1 @Id=Id,@Filename=RIGHT(filenname,12),@Filepath=LEFT(filenname,(len(filenname)-12)),@prefix=Left(RIGHT(filenname,12),2)

	from #connaxLog



	Select @DestPath= case when @prefix='vp' then 'autreq/Pairing/req' when @prefix='cs' OR @prefix='ps' OR @prefix='gp' then 'autreq/req' end 



	print @Filepath 

	print @Filename

	print @DestPath



	exec connax_uploadfile_ftp	@Filepath,@Filename,@DestPath



	Delete from #connaxLog where Id=@Id

	Update ConnaxFileLog set Status=2 where Id=@Id

End



End
GO
