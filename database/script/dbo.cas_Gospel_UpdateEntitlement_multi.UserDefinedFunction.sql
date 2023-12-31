USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_Gospel_UpdateEntitlement_multi]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_Gospel_UpdateEntitlement_multi](@scno as varchar(16),@linkcount as int,@linksids as varchar(1000))
returns varchar(6000)
As
begin 
declare @ret as varchar(6000)
declare @quick_send_flag as varchar(2)='00'
declare @cmd_type as varchar(2)='1'
declare @cas_ver as varchar (2)
select @cas_ver=VALUE from X_SYSTEM_CONSTANTS where Name='G_CAS_VER'

	select @ret=@cas_ver+dbo.fn_varbintostr_(@cmd_type,2)+dbo.fn_varbintostr_(len(cmd)/2,4)+cmd
	from	
	(
		Select cmd=dbo.cas_Gospel_convert_smartcard(@scno)+@quick_send_flag+dbo.fn_varbintostr_(@linkcount,2)+@linksids
	)x
return @ret
end
GO
