USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_abv_UpdateAreaToSC]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_abv_UpdateAreaToSC](@scno as varchar(16),@AreaCasCode as varchar(8))--pairing
returns varchar(24)
As
begin 
declare @sc as varchar(30)
--01-protocal version - 47 -Comand type,0005 length
select @sc='0147000D'+VALUE+'01'+dbo.cas_abv_convert_smartcard(@scno)+@AreaCasCode from X_SYSTEM_CONSTANTS where NAME='PPID'
return @sc
end
GO
