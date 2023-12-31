USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_sumavision_UpdateEntitlement_multi]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_sumavision_UpdateEntitlement_multi](@scno as varchar(16),@linkcount as int,@linksids as varchar(1000))  
returns varchar(6000)  
As  
begin   
declare @ret as varchar(6000)  
declare @Command as varchar(6000)  
   
 select @Command=dbo.cas_sumavision_convert_smartcard(@scno)+dbo.fn_varbintostr_(@linkcount,2)+@linksids  
  
 select @ret=dbo.cas_abv_formatcmd('02'+dbo.fn_varbintostr_(1,2)+  
 dbo.fn_varbintostr_((LEN(@command)/2),2)+@command);  
return @ret  
end  
GO
