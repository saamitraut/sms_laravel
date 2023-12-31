USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_abv_area_modify_one]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  function [dbo].[cas_abv_area_modify_one](@scno as varchar(16),@areaid as bigint)
returns varchar(34)
As
begin
declare @sc as varchar(34)
--01-protocal version - 4D -Comand type,0005 length
select @sc='0147000D'+VALUE+'01'+dbo.cas_abv_convert_smartcard(@scno)+right(dbo.[fn_varbintostr](@areaid),8) from X_SYSTEM_CONSTANTS where NAME='PPID'
return @sc
end
GO
