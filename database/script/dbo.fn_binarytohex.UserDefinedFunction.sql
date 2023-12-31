USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_binarytohex]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_binarytohex](@v as char(4))  
returns char(1)  
as  
Begin  
declare @vr as char(1)  
Select @vr=case when @v='0000' then '0' when @v='0001' then '1' when @v='0010' then '2' when @v='0011' then '3'
when @v='0100' then '4' when @v='0101' then '5' when @v='0110' then '6' when @v='0111' then '7' when @v='1000' then '8'
when @v='1001' then '9' when @v='1010' then 'A' when @v='1011' then 'B' when @v='1100' then 'C' when @v='1101' then 'D'
when @v='1110' then 'E' when @v='1111' then 'F' end 
return @vr;  
End  
GO
