USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getOpBranch]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[getOpBranch](@operatorid as bigint)
returns varchar(300)
As
begin
Declare @re as varchar(300)
Select @re=isnull(Branch,'N/A') from sms_view_operator where Id=@operatorid
return isnull(@re,'--')
end
GO
