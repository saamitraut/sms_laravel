USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getJsonSafe]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getJsonSafe](@str as varchar(8000),@whennull as varchar(100))
returns varchar(8000)
As
begin
	declare @r as varchar(8000)
	if @str is not null and LTRIM(RTRIM(@str))!=''
	begin
		set @r=LTRIM(RTRIM(@str));
		set @r=REPLACE(@r,':','&coln;');
		set @r=REPLACE(@r,',','&coma;');
		set @r=REPLACE(@r,'"','&apos;');		
	end
	else
	set @r=@whennull
	return @r
	
end
GO
