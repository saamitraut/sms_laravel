USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_abv_masterslave_bind]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_abv_masterslave_bind](@master as varchar(16),@slave as varchar(16))--
returns varchar(34)
As
begin 
declare @sc as varchar(34)
--01-protocal version - 4D -Comand type,0005 length
select @sc='014D000D'+VALUE+dbo.cas_abv_convert_smartcard(@slave)+dbo.cas_abv_convert_smartcard(@master) from X_SYSTEM_CONSTANTS where NAME='PPID'
return @sc
end
GO
