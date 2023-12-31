USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[connax_flashmessage_file_gen]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[connax_flashmessage_file_gen]      

AS      

BEGIN      

   

 declare @filename varchar(100);      

 declare @filegen varchar(max);      

 declare @fquery varchar(max);      

 declare @filepath varchar(max);      

 declare @fileId int;      



 declare @flash_text varchar(150)  

 declare @flash_seqno varchar(10)  

 declare @flash_StartTime varchar(20)  

 declare @flash_duration varchar(10)  

 declare @flash_repetition varchar(10)  

 declare @flash_interval varchar(10)  

       

 declare @Id bigint;    

 

 declare @hr varchar(5)    

 declare @min varchar(6)    

 declare @sec varchar(6)    

 declare @day varchar(6)    

 declare @month varchar(6)    

 declare @year varchar(6)    



 declare @time varchar(32)    

 declare @hextime varchar(8)        

 

 declare @flash_message_data varchar(500)  

       

 set @filepath = 'D:\connax\autreq\req\';      

       

 if(OBJECT_ID('tempdb.dbo.#flashmsgcmd') is not null)          

  drop table  #flashmsgcmd  

          

  if(OBJECT_ID('tempdb.dbo.#flparams') is not null)        

 drop table  #flparams     

   

 if(OBJECT_ID('tempdb.dbo.#fldataq') is not null)        

   drop table  #fldataq    

                         

      

  if(OBJECT_ID('SMS.dbo.AuthDataFlash') is not null)        

   drop table  SMS.dbo.AuthDataFlash    

      

        

 Select  a.*,cast(replace(p.StartTime,'T',' ') as datetime) as StartTime,p.Duration,p.Msg,p.Repetition,p.Interval  into #flashmsgcmd  

 from ConaxCommandLog a left join Conax_Cas_Command_Param p on p.CommandId=a.Id    

 where p.CommandId is not null and a.Request is null and a.StatusCode=0 and a.CommandName='REPEAT_BARK_MSG_CLIENT'     

 and CAST(a.CommandDate as date)<=CAST(GETDATE() as date) order by a.SmartcardNo asc    

   

 Select ROW_NUMBER() over(order by x.StartTime)  as Id, x.* into #flparams     

 from (    

 Select cast(replace(a.StartTime,'T',' ') as datetime) as StartTime,a.Duration,a.Msg,a.Repetition,a.Interval  

 from #flashmsgcmd a   

 group by a.StartTime,a.Duration,a.Msg,a.Repetition,a.Interval  

 ) x    

        

 while exists(Select * from #flparams)      

 Begin      

  Select top 1 @Id=Id,@flash_StartTime=StartTime,@flash_duration=Duration,@flash_repetition=Repetition,@flash_interval=Interval,@flash_text=Msg from #flparams    

    

  Insert into ConnaxFileLog(filenname,Status,TransactionId,Actiondate)      

  Select @filepath,0,'00000',GETDATE();      

    

  Select @fileId=SCOPE_IDENTITY(),@filename=@filepath+'gp'+RIGHT('00000'+CAST(SCOPE_IDENTITY() AS VARCHAR(6)),6)+'.emm';      

    

  Select * into #fldataq from #flashmsgcmd     

    where StartTime=@flash_StartTime and Duration=@flash_duration and  Repetition=@flash_repetition and Interval=@flash_interval and Msg=@flash_text  

  

  Select @hr=right('00000'+dbo.DecimalToBinary(datepart(hh,dateadd(hh,-5,dateadd(minute,-30,@flash_StartTime)))),5)    

  Select @min=right('000000'+dbo.DecimalToBinary(datepart(minute,dateadd(hh,-5,dateadd(minute,-30,@flash_StartTime)))),6)    

  Select @day=right('00000'+dbo.DecimalToBinary(datepart(d,dateadd(hh,-5,dateadd(minute,-30,@flash_StartTime)))),5) 

  Select @month=right('0000'+dbo.DecimalToBinary(datepart(m,dateadd(hh,-5,dateadd(minute,-30,@flash_StartTime)))),4) 

  Select @year=right('0000'+dbo.DecimalToBinary(substring(cast(datepart(yy,dateadd(hh,-5,dateadd(minute,-30,@flash_StartTime))) as char),3,2)),4) 

      

  Select @time='001'+@day+@year+@month+'000'+@hr+'00'+@min

    

  select @hextime=dbo.fn_binarytohex(substring(@time,1,4))+dbo.fn_binarytohex(substring(@time,5,4))  

  +dbo.fn_binarytohex(substring(@time,9,4))+dbo.fn_binarytohex(substring(@time,13,4))  

  +dbo.fn_binarytohex(substring(@time,17,4))+dbo.fn_binarytohex(substring(@time,21,4))

  +dbo.fn_binarytohex(substring(@time,25,4))+dbo.fn_binarytohex(substring(@time,29,4))     

    

  Set @flash_message_data=''  

  Select @flash_message_data=@flash_message_data+'01'+dbo.fn_varbintostr_(len(@flash_text),2)--NOB

  Select @flash_message_data=@flash_message_data+dbo.fn_stringtohexStr(@flash_text)--Hex Text

  Select @flash_message_data=@flash_message_data+'0201ff0402'+dbo.fn_varbintostr_(@flash_duration,4)

  Select @flash_message_data=@flash_message_data+'0304'+@HexTime

  Select @flash_message_data=@flash_message_data+case when @flash_repetition!='0' then '0501'+dbo.fn_varbintostr_(@flash_repetition,2)

  +case when @flash_interval!='0' then '0601'+dbo.fn_varbintostr_(@flash_interval,2) else '0601'+dbo.fn_varbintostr_(10,2) end else '' end



                               

  Select x.texts,x.orders into AuthDataFlash from (      

      Select 'U' as texts,1 as orders      

      union all      

      Select RIGHT('00000'+CAST(@fileId AS VARCHAR(6)),6) as texts,2 as orders      

      union all      

      Select '00000002' as texts,3 as orders --Command Id     

      union all      

      Select @flash_message_data as texts,4 as orders --Add parameters to send fingerprint     

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

      from #fldataq    

      union all            

      Select distinct SmartcardNo as texts,11 as orders      

      from #fldataq     

      union all             

      Select 'ZZZ' as texts,13 as orders) x      

        

  set @fquery= 'Select texts from SMS.dbo.AuthDataFlash order by orders';      

  

  set @filegen = 'EXEC xp_cmdshell '' bcp "'+@fquery+'" queryout "'+@filename+'" -T -c -t, '' ';      

  print @filegen;      

  EXEC ( @filegen);      

    

  update ConaxCommandLog set StatusCode=1,ConnaxFileLogId=@fileId,Request=(Select STUFF((SELECT ';' + QUOTENAME(texts)     

        from SMS.dbo.AuthDataFlash order by orders FOR XML PATH(''), TYPE).value('.', 'VARCHAR(MAX)'),1,1,''))    

        where Id in (Select Id from #fldataq);    

      

  update ConnaxFileLog set filenname=@filename,Status=1,TransactionId=RIGHT('00000'+CAST(@fileId AS VARCHAR(6)),6) where Id=@fileId    

      

  delete from #flparams where  Id=@Id    

                         

  if(OBJECT_ID('tempdb.dbo.#fldataq') is not null)        

   drop table #fldataq    

                         

      

  if(OBJECT_ID('SMS.dbo.AuthDataFlash') is not null)        

   drop table SMS.dbo.AuthDataFlash    

         

 End      

       

 if(OBJECT_ID('tempdb.dbo.#flashmsgcmd') is not null)          

  drop table #flashmsgcmd          

    

 if(OBJECT_ID('tempdb.dbo.#flparams') is not null)        

  drop table #flparams     

     

END 
GO
