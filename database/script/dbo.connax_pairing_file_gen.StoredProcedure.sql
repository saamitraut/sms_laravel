USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[connax_pairing_file_gen]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[connax_pairing_file_gen]

AS

BEGIN

	declare @TransId varchar(10);

	declare @SmartcardNo varchar(50);

	declare @STBNo varchar(50);

	declare @CmdId int;

	declare @filename varchar(100);

	declare @filegen varchar(max);

	declare @fquery varchar(max);

	declare @filepath varchar(max);

	declare @fileId int;

	

	set @filepath = 'D:\connax\autreq\Pairing\req\';

	

	if(OBJECT_ID('tempdb.dbo.#pairingcmd') is not null)    

		drop table  #pairingcmd  

		

	Select  * into #pairingcmd from ConaxCommandLog where Request is null and StatusCode=0 and CommandName='CREATE_PAIRING' 

	and CAST(CommandDate as date)<=CAST(GETDATE() as date)

		

	while exists(Select * from #pairingcmd where StatusCode=0)

	Begin

		Select top 1 @SmartcardNo=SmartcardNo,@STBNo=STBNo,@CmdId=Id from #pairingcmd where StatusCode=0

		

		insert into ConnaxFileLog(filenname,Status,TransactionId,Actiondate)

		Select @filepath,0,'00000',GETDATE();

		

		Select @fileId=SCOPE_IDENTITY(),@filename=@filepath+'vp'+RIGHT('00000'+CAST(SCOPE_IDENTITY() AS VARCHAR(6)),6)+'.emm';

		

		

		Select x.texts,x.orders into fquery from (

						Select 'U' as texts,1 as orders

						union all

						Select RIGHT('00000'+CAST(@fileId AS VARCHAR(6)),6) as texts,2 as orders

						union all

						Select '00000001' as texts,3 as orders

						union all

						Select 'U' as texts,4 as orders

						union all

						Select 'U' as texts,5 as orders

						union all

						Select 'U' as texts,6 as orders

						union all

						Select 'EMM' as texts,7 as orders

						union all

						Select 'U' as texts,8 as orders

						union all

						Select '00002' as texts,9 as orders

						union all

						Select 'S'+@SmartcardNo as texts,10 as orders

						union all 

						Select 'V'+@STBNo as texts,11 as orders

						--Select  'V'+STBNo  as texts,11 as orders

						--from SMS_STBS where STBNo=@STBNo

						union all

						Select 'ZZZ' as texts,12 as orders) x

						

		

		set @fquery= 'Select texts from SMS.dbo.fquery order by orders';

		

		set @filegen = 'EXEC xp_cmdshell '' bcp "'+@fquery+'" queryout "'+@filename+'" -T -c -t, '' ';

			print @filegen;

		EXEC ( @filegen);

					    

		update #pairingcmd set StatusCode=1 where Id=@CmdId

				

		update ConaxCommandLog set StatusCode=1,ConnaxFileLogId=@fileId ,Request=(Select STUFF((SELECT ';' + QUOTENAME(texts) 

                    from SMS..fquery order by orders FOR XML PATH(''), TYPE).value('.', 'VARCHAR(MAX)'),1,1,''))

                    where Id=@CmdId;

		

		if(OBJECT_ID('SMS.dbo.fquery') is not null)    

			drop table  SMS..fquery

			

			update ConnaxFileLog set filenname=@filename,Status=1,TransactionId=RIGHT('00000'+CAST(@fileId AS VARCHAR(6)),6) where Id=@fileId

		

	End

	

	if(OBJECT_ID('tempdb.dbo.#pairingcmd') is not null)    

		drop table  #pairingcmd    

END
GO
