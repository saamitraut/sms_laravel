USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_Gospel_DeleteSmartcard]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[cas_Gospel_DeleteSmartcard](@scno as varchar(16))
returns varchar(32)
As
begin 
declare @sc as varchar(32)
declare @reserved as varchar(8)='FFFFFFFF'
declare @cmd_type as varchar(2)='51'-- 51 dec
declare @cmd_len as varchar(2)='12' -- 24/2
declare @Cas_ver as varchar(2)

select @Cas_ver= Value from X_SYSTEM_CONSTANTS where name='G_CAS_VER'

select @sc=@Cas_ver+dbo.fn_varbintostr_(@cmd_type,2)+dbo.fn_varbintostr_(@cmd_len,4)+@reserved+@reserved+dbo.cas_Gospel_convert_smartcard(@scno)


return @sc
end
GO
