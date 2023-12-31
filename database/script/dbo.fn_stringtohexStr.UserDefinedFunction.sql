USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_stringtohexStr]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_stringtohexStr](@String varchar(8000))     
returns  varchar(8000) 
as     
begin     
	declare @idx int     
	declare @i int     
	declare @slice varchar(8000)
	set @slice='';         
	select @idx = len(@String) ,@i=0   
		if @idx<1 or @idx is null  return ''        
	while @i<@idx
	begin 
		set @i=@i+1;
		set @slice=@slice+right(dbo.[fn_varbintostr](ascii(substring(@String,@i,1))),2)
	end 
return   @slice
end
GO
