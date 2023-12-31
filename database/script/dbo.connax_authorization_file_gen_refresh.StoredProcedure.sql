USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[connax_authorization_file_gen_refresh]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[connax_authorization_file_gen_refresh]

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

	

	set @filepath = 'D:\connax\autreq\req\';

	

	if(OBJECT_ID('tempdb.dbo.#authcmd') is not null)    

		drop table  #authcmd  

		

	if(OBJECT_ID('tempdb.dbo.#Products') is not null)    

	drop table  #Products  	

	

	if(OBJECT_ID('SMS.dbo.AuthData') is not null)    

		drop table  SMS..AuthData

				

	Select top 10000 * into #authcmd from ConaxCommandLog where Request is null and StatusCode=0 and CommandName='REFRESH_SUBSCRIPTIONS' 

	and CAST(CommandDate as date)<=CAST(GETDATE() as date)  order by SmartcardNo asc

	

	Select ROW_NUMBER() over(order by x.CACode,x.ActivationDate)  as Id, x.* into #Products 

	from (

	Select p.CasCodeConax as CACode,a.PackageId as ProductId,0 as isAlacarte,a.ActivationDate,a.DeactivationDate from #authcmd a left join SMS_PACKAGE p on p.Id=a.PackageId

	where p.CasCodeConax is not null 

	group by PackageId,AlacarteId,p.CasCodeConax,a.ActivationDate,a.DeactivationDate

	union

	Select p.CasCodeConax as CACode,AlacarteId as ProductId,1 as isAlacarte,a.ActivationDate,a.DeactivationDate from #authcmd a left join SMS_CHANNEL p on p.Id=a.AlacarteId

	where p.CasCodeConax is not null

	group by PackageId,AlacarteId,p.CasCodeConax,a.ActivationDate,a.DeactivationDate) x

		

		

		

		declare @Id int;

		declare @CACode varchar(50);

		declare @ProductId int;

		declare @isAlacarte int;

		declare @ActivationDate datetime;

		declare @DeactivationDate datetime;

		declare @fileId int;

		

	while exists(Select * from #Products )

	Begin

		

		Select top 1 @Id=Id,@CACode=CACode,@ProductId=ProductId,@isAlacarte=isAlacarte,@ActivationDate=ActivationDate,

		@DeactivationDate=DeactivationDate	from #Products

		

		insert into ConnaxFileLog(filenname,Status,TransactionId,Actiondate)

		Select @filepath,0,'00000',GETDATE();

		

		Select @fileId=SCOPE_IDENTITY(),@filename=@filepath+'ps'+RIGHT('00000'+CAST(SCOPE_IDENTITY() AS VARCHAR(6)),6)+'.emm';

		  	



				if(OBJECT_ID('tempdb.dbo.#fdataq') is not null)    

					drop table  #fdataq

			

				Select * into #fdataq	from #authcmd 

				where (case when @isAlacarte=0 then PackageId else AlacarteId end)=@ProductId

				 and ISNULL(ActivationDate,GETDATE())=ISNULL(@ActivationDate,GETDATE()) and ISNULL(DeactivationDate,GETDATE())=ISNULL(@DeactivationDate,GETDATE())

								  

				Select x.texts,x.orders into AuthData from (

						Select 'U' as texts,1 as orders

						union all

						Select RIGHT('00000'+CAST(@fileId AS VARCHAR(6)),6) as texts,2 as orders

						union all

						Select RIGHT('00000000'+CAST(@CACode AS VARCHAR(8)),8) as texts,3 as orders

						union all

						Select REPLACE(REPLACE(REPLACE(REPLACE(CONVERT(varchar(16),cast(dbo.getFirstDate(GETDATE()) as datetime),120),'-',''),' ',''),':',''),' ','') as texts,4 as orders

						union all

						Select  REPLACE(REPLACE(REPLACE(REPLACE(CONVERT(varchar(16),ISNULL(cast(@DeactivationDate as datetime),DATEADD(YEAR,10,GETDATE())),120),'-',''),' ',''),':',''),' ','')  as texts,5 as orders

						union all

						Select 'U' as texts,6 as orders

						union all

						Select 'emm' as texts,7 as orders

						union all

						Select 'U' as texts,8 as orders

						union all

						Select RIGHT('00000'+CAST(COUNT( distinct SmartcardNo) AS VARCHAR(5)),5) as texts,9 as orders

						from #fdataq

						union all

						Select  distinct SmartcardNo as texts,10 as orders

						from #fdataq

						union all

						Select 'ZZZ' as texts,12 as orders) x

		

		set @fquery= 'Select texts from SMS.dbo.AuthData order by orders';

		--set @fquery= 'Select Accountid from SMS.dbo.ConaxCommandLog order by id';

		

		set @filegen = 'EXEC xp_cmdshell '' bcp "'+@fquery+'" queryout "'+@filename+'" -T -c -t, '' ';

		print @filegen;

		EXEC ( @filegen);

					

				

		update ConaxCommandLog set StatusCode=1,ConnaxFileLogId=@fileId,Request=(Select STUFF((SELECT ';' + QUOTENAME(texts) 

        from SMS..AuthData order by orders FOR XML PATH(''), TYPE).value('.', 'VARCHAR(MAX)'),1,1,''))

        where Id in (Select Id from #fdataq);

		

		update ConnaxFileLog set filenname=@filename,Status=1,TransactionId=RIGHT('00000'+CAST(@fileId AS VARCHAR(6)),6) where Id=@fileId

		

		delete from #Products where  Id=@Id

		

		if(OBJECT_ID('tempdb.dbo.#fdataq') is not null)    

			drop table  #fdataq

	                    

		

		if(OBJECT_ID('SMS.dbo.AuthData') is not null)    

			drop table  SMS..AuthData

		

	End

	

	if(OBJECT_ID('tempdb.dbo.#authcmd') is not null)    

		drop table  #authcmd    

		

	

	if(OBJECT_ID('tempdb.dbo.#Products') is not null)    

		drop table  #Products    	

		

		

END
GO
