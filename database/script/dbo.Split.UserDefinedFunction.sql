USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Split](@String varchar(8000))     
returns @temptable TABLE (items varchar(8000))     
as     
begin     
	declare @idx int     
	declare @i int     
	declare @slice varchar(8000)     
    
	select @idx = len(@String) ,@i=0   
		if @idx<1 or @idx is null  return     
    
	while @i<@idx
	begin 
		set @i=@i+1;
		set @slice = substring(@String,@i,1)				
		insert into @temptable(Items) values(@slice)		
	end 
return     
end
GO
