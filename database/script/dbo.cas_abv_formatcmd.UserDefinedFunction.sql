USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_abv_formatcmd]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_abv_formatcmd](@String varchar(8000))     
returns  varchar(8000) 
as     
begin     
	declare @idx int     
	declare @i int     
	declare @slice varchar(8000)
	set @slice='';         
	set @String=replace(ltrim(rtrim(@String)),' ','')
	select @idx = len(@String) ,@i=1   
		if @idx<1 or @idx is null  return ''        
	while @i<@idx
	begin 		
		set @slice=@slice+SPACE(1)+substring(@String,@i,2)
		set @i=@i+2;
	end 
return   ltrim(rtrim(@slice))
end
GO
