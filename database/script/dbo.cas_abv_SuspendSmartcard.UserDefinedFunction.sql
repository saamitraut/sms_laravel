USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_abv_SuspendSmartcard]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_abv_SuspendSmartcard](@scno as varchar(16))
returns varchar(20)
As
begin 
declare @sc as varchar(30)
--01-protocal version - 43 -Comand type,0005 length
select @sc='01430006'+dbo.cas_abv_convert_smartcard(@scno)+'FF'
return @sc
end
GO
