USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_HexToIntnt]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_HexToIntnt](@str varchar(16))
returns bigint as begin

select @str=upper(@str)
declare @i int, @len int, @char char(1), @output bigint
select @len=len(@str)
,@i=@len
,@output=case
when @len>0
then 0
end
while (@i>0)
begin
select @char=substring(@str,@i,1), @output=@output
+(ASCII(@char)
-(case
when @char between 'A' and 'F'
then 55
else
case
when @char between '0' and '9'
then 48 end
end))
*power(16.,@len-@i)
,@i=@i-1
end
return @output
end
GO
