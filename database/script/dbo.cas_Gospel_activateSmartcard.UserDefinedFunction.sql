USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_Gospel_activateSmartcard]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_Gospel_activateSmartcard](@scno as varchar(16),@expdate as datetime)
returns varchar(30)
As
begin 
declare @sc as varchar(30)
declare @sent_or_not as varchar(2)='01'
declare @status as varchar(2)='01'
declare @cmd_type as varchar(2)='11'
declare @cmd_len as varchar(2)='10'
declare @Cas_ver as varchar(2)

select @Cas_ver=(select VALUE from X_SYSTEM_CONSTANTS where ID=3)
select @sc=@Cas_ver+dbo.fn_varbintostr_(@cmd_type,2)+dbo.fn_varbintostr_(@cmd_len,4)+dbo.cas_Gospel_convert_smartcard(@scno)+
@sent_or_not+@status+dbo.fn_getUTCHexdateTime(@expdate)

return @sc
end
GO
