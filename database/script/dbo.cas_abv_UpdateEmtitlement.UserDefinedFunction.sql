USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_abv_UpdateEmtitlement]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_abv_UpdateEmtitlement](@scno as varchar(16),@linkcount as int,@linksids as varchar(6000),@msgdate as varchar(10)
,@startdate	 as varchar(6),@enddate	 as varchar(6))
returns varchar(6000)
As
begin 
declare @ret as varchar(6000)
declare @cmndlen as varchar(4)
select @cmndlen=right(dbo.[fn_varbintostr](22+(@linkcount*10)),4)
--01-protocal version - 16 -Comand type,0005 length
select @ret='0110'+@cmndlen+'40'+VALUE+dbo.cas_abv_convert_smartcard(@scno)+@msgdate+'F1'+@startdate+@enddate+right(dbo.[fn_varbintostr](@linkcount),2)+@linksids 
from  X_SYSTEM_CONSTANTS where NAME='PPID'
return @ret
end
GO
