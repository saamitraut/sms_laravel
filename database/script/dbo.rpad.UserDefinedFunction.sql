USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[rpad]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  function [dbo].[rpad](@str as varchar(200),@pad as int)
returns varchar(500)
as
BEGIN
declare @r as varchar(500)	
declare @d as int	
set @d=@pad-LEN(@str);


	if(@d>0)
	Select @r=@str+SPACE(@d)
	else
	Set @r=@str
return @r
end
GO
