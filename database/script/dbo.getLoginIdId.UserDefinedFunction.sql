USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getLoginIdId]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getLoginIdId](@UserId as bigint)
returns varchar(20)
As
begin
Declare @re as varchar(20)
Select @re=LOGINID from SMS_ACCESS where Id=@UserId
return @re
end
GO
