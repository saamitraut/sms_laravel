USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[Split_coma]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Split_coma](@String varchar(8000))     
returns @temptable TABLE (items varchar(8000))     
as     
begin     
	declare @idx int     
	declare @slice varchar(8000)     
    
	select @idx = 1     
		if len(@String)<1 or @String is null  return     
    
	while @idx!= 0     
	begin     
		set @idx = charindex(',',@String)     
		if @idx!=0     
			set @slice = left(@String,@idx - 1)     
		else     
			set @slice = @String     
		
		if(len(@slice)>0)
			insert into @temptable(Items) values(@slice)     

		set @String = right(@String,len(@String) - @idx)     
		if len(@String) = 0 break     
	end 
return     
end
GO
