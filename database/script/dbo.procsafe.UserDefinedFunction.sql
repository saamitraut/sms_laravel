USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[procsafe]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[procsafe](@STR AS VARCHAR(8000))
returns varchar(8000) as 
begin
return replace(@STR,'''','''''')
end
GO
