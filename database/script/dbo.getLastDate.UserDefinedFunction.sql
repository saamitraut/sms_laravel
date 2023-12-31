USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getLastDate]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getLastDate](@date as datetime)
Returns date
As
begin
declare @return as date
if @date is not null
begin
set @return=convert(date,DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@date)+1,0)),120)
end
else 
begin
set @return=null
end
return @return
end
GO
