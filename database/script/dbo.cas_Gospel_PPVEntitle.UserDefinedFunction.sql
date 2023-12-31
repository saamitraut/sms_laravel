USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_Gospel_PPVEntitle]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_Gospel_PPVEntitle](@scno as varchar(16),@linksids as varchar(4),@enddate as datetime)
returns varchar(6000)
As
begin 
declare @ret as varchar(6000)
declare @cmd_type as varchar(2)='17'
declare @cas_ver as varchar (2)


select @cas_ver=VALUE from X_SYSTEM_CONSTANTS where Name='G_CAS_VER'

	select @ret=@cas_ver+dbo.fn_varbintostr_(@cmd_type,2)+dbo.fn_varbintostr_(len(cmd)/2,4)+cmd
	from	
	(
	Select cmd=dbo.cas_Gospel_convert_smartcard(@scno)+@linksids+dbo.fn_getUTCHexdateTime(@enddate)
	)x
return @ret
end
GO
