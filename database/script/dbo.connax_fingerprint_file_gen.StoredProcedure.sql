USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[connax_fingerprint_file_gen]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[connax_fingerprint_file_gen]        

AS        

BEGIN        

     

	declare @filename varchar(100);        

	declare @filegen varchar(max);        

	declare @fquery varchar(max);        

	declare @filepath varchar(max);        

	declare @fileId int;        

       

	declare @fp_time varchar(20)--3 bytes      

	declare @fp_duration varchar(10)--2 bytes      

	declare @fp_position_X varchar(10)--2 bytes      

	declare @fp_position_Y varchar(10)--2 bytes      

	declare @fp_height varchar(10)--1 byte      

         

	declare @Id bigint;      

   

	declare @hr varchar(5)  

	declare @min varchar(6)  

	declare @sec varchar(6)  

	declare @time varchar(24)  

	declare @hextime varchar(6)         

                  

	set @filepath = 'D:\connax\autreq\req\';        

         

	if(OBJECT_ID('tempdb.dbo.#fingerprintcmd') is not null)            

	drop table  #fingerprintcmd    

            

	if(OBJECT_ID('tempdb.dbo.#fparams') is not null)          

	drop table  #fparams       

     

	if(OBJECT_ID('tempdb.dbo.#fdataq') is not null)          

	drop table  #fdataq      

                           

        

	if(OBJECT_ID('SMS.dbo.AuthDataFP') is not null)          

	drop table  SMS.dbo.AuthDataFP      

        

          

	Select  a.*,cast(replace(p.StartTime,'T',' ') as datetime) as StartTime,p.XAxis,p.YAxis,p.Duration,p.Height 

	into #fingerprintcmd     

	from ConaxCommandLog a left join Conax_Cas_Command_Param p on p.CommandId=a.Id      

	where p.CommandId is not null and a.Request is null and a.StatusCode=0 and a.CommandName='DISPLAY_FINGERPRINT'         

	and CAST(a.CommandDate as date)<=CAST(GETDATE() as date) order by a.SmartcardNo asc      

     

	Select ROW_NUMBER() over(order by x.StartTime)  as Id, x.* into #fparams       

	from (      

		Select cast(replace(a.StartTime,'T',' ') as datetime) as StartTime,a.XAxis,a.YAxis,a.Duration,a.Height     

		from #fingerprintcmd a     

		group by a.StartTime,a.XAxis,a.YAxis,a.Duration,a.Height      

	) x      

          

	while exists(Select * from #fparams)        

	Begin        

		Select top 1 @Id=Id,@fp_time=StartTime,@fp_duration=Duration,@fp_position_X=XAxis,@fp_position_Y=YAxis,

		@fp_height=Height from #fparams      

      

		Insert into ConnaxFileLog(filenname,Status,TransactionId,Actiondate)        

		

		Select @filepath,0,'00000',GETDATE();        

      

		Select @fileId=SCOPE_IDENTITY(),@filename=@filepath+'gp'+RIGHT('00000'+CAST(SCOPE_IDENTITY() AS VARCHAR(6)),6)+'.emm';        

      

		Select * into #fdataq from #fingerprintcmd       

		where StartTime=@fp_time and Duration=@fp_duration and  XAxis=@fp_position_X and YAxis=@fp_position_Y 

		and Height=@fp_height    

    

		Select @hr=right('00000'+dbo.DecimalToBinary(datepart(hh,dateadd(hh,-5,dateadd(minute,-30,@fp_time)))),5)  

		Select @min=right('000000'+dbo.DecimalToBinary(datepart(minute,dateadd(hh,-5,dateadd(minute,-30,@fp_time)))),6)  

		Select @sec=right('000000'+dbo.DecimalToBinary(datepart(ss,@fp_time)),6)  

    

		Select @time=@hr+@min+@sec+'0000000'--0110 1001 0101 0010 0000 0000  

		

		select @hextime=dbo.fn_binarytohex(substring(@time,1,4))+dbo.fn_binarytohex(substring(@time,5,4))

		+dbo.fn_binarytohex(substring(@time,9,4))+dbo.fn_binarytohex(substring(@time,13,4))

		+dbo.fn_binarytohex(substring(@time,17,4))+dbo.fn_binarytohex(substring(@time,21,4))  

    

		select @fp_time=right('000000'+cast(case when @hextime='0' then '0FFFFF' else @hextime end as varchar(6)),6) --Start Immediately      

		select @fp_duration=case when @fp_duration='0' then '03E8' else dbo.fn_varbintostr_(@fp_duration*100,4) end--1000 centisec=10sec      

		select @fp_position_X=case when @fp_position_X='0' then '0014' else dbo.fn_varbintostr_(@fp_position_X,4) end--20 pixels from left      

		select @fp_position_Y=case when @fp_position_Y='0' then '0014' else dbo.fn_varbintostr_(@fp_position_Y,4) end--20 pixels from left      

		select @fp_height=case when @fp_height='0' then '0A' else dbo.fn_varbintostr_(@fp_height,2) end--10 pixels height   

                                       

		Select x.texts,x.orders into AuthDataFp from (        

			Select 'U' as texts,1 as orders        

			union all        

			Select RIGHT('00000'+CAST(@fileId AS VARCHAR(6)),6) as texts,2 as orders        

			union all        

			Select '00001503' as texts,3 as orders --Command Id       

			union all        

			Select @fp_time+@fp_duration+@fp_position_X+@fp_position_Y+@fp_height as texts,4 as orders --Add parameters to send fingerprint       

			union all        

			Select 'U' as texts,5 as orders        

			union all        

			Select 'U' as texts,6 as orders        

			union all        

			Select 'U' as texts,7 as orders        

			union all        

			Select 'U' as texts,8 as orders        

			union all        

			Select 'EMM' as texts,9 as orders        

			union all        

			Select RIGHT('00000'+CAST(COUNT(distinct SmartcardNo) AS VARCHAR(5)),5) as texts,10 as orders        

			from #fdataq      

			union all              

			Select distinct SmartcardNo as texts,11 as orders        

			from #fdataq       

			union all               

			Select 'ZZZ' as texts,13 as orders

		) x        

          

		set @fquery= 'Select texts from SMS.dbo.AuthDatafp order by orders';        

    

		set @filegen = 'EXEC xp_cmdshell '' bcp "'+@fquery+'" queryout "'+@filename+'" -T -c -t, '' ';        

		print @filegen;        

		EXEC (@filegen);        

      

		update ConaxCommandLog set StatusCode=1,ConnaxFileLogId=@fileId,

		Request=(Select STUFF((SELECT ';' + QUOTENAME(texts)       

			from SMS.dbo.AuthDataFP order by orders FOR XML PATH(''), TYPE).value('.', 'VARCHAR(MAX)'),1,1,''))      

		where Id in (Select Id from #fdataq);      

        

		update ConnaxFileLog set filenname=@filename,Status=1,

		TransactionId=RIGHT('00000'+CAST(@fileId AS VARCHAR(6)),6) where Id=@fileId      

        

		delete from #fparams where  Id=@Id      

                           

		if(OBJECT_ID('tempdb.dbo.#fdataq') is not null)          

		drop table  #fdataq      

                                   

		if(OBJECT_ID('SMS.dbo.AuthDataFP') is not null)          

		drop table  SMS.dbo.AuthDataFP                 

	End        

         

	if(OBJECT_ID('tempdb.dbo.#fingerprintcmd') is not null)            

	drop table  #fingerprintcmd            

      

	if(OBJECT_ID('tempdb.dbo.#fparams') is not null)          

	drop table  #fparams              

END 
GO
