USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getCASErrorDescp]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getCASErrorDescp](@response as varchar(100) )
returns varchar(500)
As
Begin
Declare @desp as varchar(500)
Select @desp=Description from SMS_CAS_ABVERRORCODES where Errorcode=case len(ltrim(rtrim(right(@response,2)))) 
when 1 then '0'+ltrim(rtrim(right(@response,2))) else ltrim(rtrim(right(@response,2))) end 
Set @desp=isnull(@desp,'Failed')
return @desp 
end
GO
