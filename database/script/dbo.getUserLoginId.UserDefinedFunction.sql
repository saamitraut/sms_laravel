USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getUserLoginId]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[getUserLoginId](@from  as int,@accesId as bigint)
returns varchar(60)
As
begin
Declare @re as varchar(60)
if(@from=1)
Select @re='SLA-'+isnull(LOGINID,'System') from SLA_ACCESS where Id=@accesId
else
Select @re='SMS-'+isnull(LOGINID,'System') from SMS_ACCESS where Id=@accesId

return isnull(@re,'--')
end
GO
