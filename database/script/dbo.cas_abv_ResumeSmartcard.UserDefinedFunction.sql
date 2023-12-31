USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_abv_ResumeSmartcard]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_abv_ResumeSmartcard](@scno as varchar(16))
returns varchar(18)
As
begin 
declare @sc as varchar(30)
--01-protocal version - 43 -Comand type,0005 length
select @sc='01440005'+dbo.cas_abv_convert_smartcard(@scno)
return @sc
end
GO
