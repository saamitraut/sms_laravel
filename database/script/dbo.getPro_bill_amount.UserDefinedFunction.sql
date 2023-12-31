USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getPro_bill_amount]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[getPro_bill_amount] (@amount as float,@amtdate as datetime=null)  
returns float  
As  
BEGIN  
 declare @proamt as  float;  
 declare @prodate as int;  
 declare @proLastdate as int;  
 select @prodate = DAY(dbo.getMonthlastDate(@amtdate))-DAY(@amtdate)   
 select @proLastdate = DAY(dbo.getMonthlastDate(@amtdate))  
  
 --select DAY(dbo.getMonthlastDate(@amtdate))-DAY(@amtdate)  
 select @proamt =case when DAY(@amtdate) between 1 and 10 then cast(@amount as float)
 when DAY(@amtdate) between 11 and 20 then ((@amount*2)/3)  
 when DAY(@amtdate) between 21 and 31 then (@amount/3)
 end  
 --print(@proamt)  
   
 return ROUND(@proamt ,2)
END
GO
