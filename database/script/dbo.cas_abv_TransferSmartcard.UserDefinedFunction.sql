USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_abv_TransferSmartcard]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_abv_TransferSmartcard](@Oldscno as varchar(16),@newscno as varchar(16))
returns varchar(30)
As
begin 
declare @sc as varchar(30)
--01-protocal version - 41 -Comand type,0005 length
select @sc='0142000B'+dbo.cas_abv_convert_smartcard(@Oldscno)+dbo.cas_abv_convert_smartcard(@newscno)+'0F'
return @sc
end
GO
