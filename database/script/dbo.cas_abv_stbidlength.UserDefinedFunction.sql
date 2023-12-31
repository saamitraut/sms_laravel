USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_abv_stbidlength]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[cas_abv_stbidlength] (@stbno as varchar(50)) 
returns varchar(8000)
as
begin
declare @i int     
set @i=1
declare @slice varchar(8000)
while @i<(LEN(@stbno)+1)
begin 		
	
	set @slice=ISNULL(@slice,'')+'3'+substring(@stbno,@i,1)
	set @i=@i+1;
end 
return   ltrim(rtrim(@slice))
end
GO
