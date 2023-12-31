USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getFirstDate]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getFirstDate](@date as datetime)
Returns date
As
begin
declare @return as date
if @date is not null
begin
set @return=convert(date,convert(varchar(8),@date,120)+'01',120)
end
else 
begin
set @return=null
end
return @return
end
GO
