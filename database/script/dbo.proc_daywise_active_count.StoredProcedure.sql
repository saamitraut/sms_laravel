USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[proc_daywise_active_count]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[proc_daywise_active_count]  @date as date=NULL
as
begin

Declare @count as bigint
IF (@date IS NULL)  
SET @date = dateadd(d,-1,CAST(getdate() as date))
--select @date=dateadd(d,-1,CAST(getdate() as date))
--select @date=CAST(getdate() as date)

Delete from perdaywise_count where Convert(varchar(10),Days,120)=@date;

create table #table(Id int,AccountId int,ProductName varchar(100) null,Bcas varchar(100) null,isAlacarte varchar(100) null,
 	CustomerId varchar(50) null,SmartcardNo varchar(50) null,STBNo varchar(50) null,OPERCODE varchar(60) null,
	ActivationDate varchar(60) null,DeactvationDate varchar(60) null,CASTYPE varchar(10) null,BrandTitle varchar(30) null);
 	Insert into #table 
 	exec [daywise_active_brdRepALLDATA] @date

	select @count=Count(distinct SmartcardNo) from #table

		insert into perdaywise_count(Counts,Days,Createdon)
		select @count,@date,GETDATE()
	
	end
GO
