USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_abv_UnBindSmartcard]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_abv_UnBindSmartcard](@scno as varchar(16))--Unpairing
returns varchar(24)
As
begin 
declare @sc as varchar(30)
--01-protocal version - 45 -Comand type,0005 length
select @sc='01460008'+VALUE+dbo.cas_abv_convert_smartcard(@scno) from X_SYSTEM_CONSTANTS where NAME='PPID'
return @sc
end
GO
