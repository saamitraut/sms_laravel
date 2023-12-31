USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_Gospel_UpdateEntitlement]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_Gospel_UpdateEntitlement](@scno as varchar(16),@linkcount as int,@linksids as varchar(4)
,@startdate	 as datetime,@enddate as datetime)
returns varchar(6000)
As
begin 
declare @ret as varchar(6000)
declare @quick_send_flag as varchar(2)='00'
declare @send_or_not as varchar(2)='01'
declare @tappingctrl as varchar(2)='00'
declare @cmd_type as varchar(2)='1'
declare @cmd_len as varchar(2)='10'
declare @descp as varchar(50)
declare @cas_ver as varchar (2)

select @cas_ver=VALUE from X_SYSTEM_CONSTANTS where Name='G_CAS_VER'

select @descp=dbo.fn_stringtohexStr('FROM SMS');
	select @ret=@cas_ver+dbo.fn_varbintostr_(@cmd_type,2)+dbo.fn_varbintostr_(len(cmd)/2,4)+cmd
	from	
	(
	Select cmd=dbo.cas_Gospel_convert_smartcard(@scno)+@quick_send_flag+dbo.fn_varbintostr_(@linkcount,2)+@send_or_not+@tappingctrl+
	dbo.fn_varbintostr_(@linksids,4)+dbo.fn_getUTCHexdateTime(dateadd(MINUTE,-150,@startdate))+
	dbo.fn_getUTCHexdateTime(dateadd(minute,-150,@enddate))+dbo.fn_varbintostr_(LEN(@descp)/2,2)+@descp
	)x
return @ret
end
GO
