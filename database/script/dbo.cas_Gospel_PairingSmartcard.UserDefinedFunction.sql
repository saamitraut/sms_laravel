USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_Gospel_PairingSmartcard]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_Gospel_PairingSmartcard](@scno as varchar(16),@stbno as varchar(8),@expdate as datetime)--pairing
returns varchar(50)
As
begin 
declare @sc as varchar(50)
declare @send_now_flag as varchar(2)='00'
declare @awaypair_type as varchar(2)='00'
declare @count as varchar(2) = '01'
declare @reserved as varchar(4) = 'FFFF'
declare @reserved2 as varchar(4) = 'FFFF'
declare @cmd_type as varchar(2)='36'
declare @cmd_len as varchar(2)='19'
declare @cas_ver as varchar (2)
select @cas_ver=VALUE from X_SYSTEM_CONSTANTS where Name='G_CAS_VER'
select @sc=@cas_ver+dbo.fn_varbintostr_(@cmd_type,2)+dbo.fn_varbintostr_(len(cmd)/2,4)+cmd
from (select cmd=@stbno+@send_now_flag+@awaypair_type+dbo.fn_getUTCHexdateTime(@expdate)+@count+dbo.cas_Gospel_convert_smartcard(@scno)+@reserved+@reserved2)
x
return @sc
end
GO
