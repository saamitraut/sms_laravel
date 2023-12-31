USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[cas_abv_BindSmartcard]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[cas_abv_BindSmartcard](@scno as varchar(16),@stbid as varchar(20))--pairing

returns varchar(500)

As

begin 

declare @sc as varchar(300)



--01-protocal version - 45 -Comand type,0005 length

select top 1 @sc='0160'+

dbo.fn_varbintostr_((LEN('362701'+dbo.fn_getHexdateTime(Dateadd(month,1,GETDATE()))+'07'+'02'+dbo.cas_abv_convert_smartcard(@scno)

+dbo.fn_varbintostr_((LEN(right(dbo.[fn_varbintostr](Id),8)+

dbo.fn_getHexdateTime(GETDATE())+dbo.fn_varbintostr_((len('01'+dbo.fn_varbintostr_(Len(@stbid),2)+dbo.cas_abv_stbidlength(@stbid))/2),4)+'01'+dbo.fn_varbintostr_(Len(@stbid),2)+dbo.cas_abv_stbidlength(@stbid))/2),4)

+right(dbo.[fn_varbintostr](Id),8)+

dbo.fn_getHexdateTime(GETDATE())+dbo.fn_varbintostr_((len('01'+dbo.fn_varbintostr_(Len(@stbid),2)+dbo.cas_abv_stbidlength(@stbid))/2),4)+'01'+dbo.fn_varbintostr_(Len(@stbid),2)+dbo.cas_abv_stbidlength(@stbid))/2),4)

+'362701'+dbo.fn_getHexdateTime(Dateadd(month,1,GETDATE()))+'07'+'02'+dbo.cas_abv_convert_smartcard(@scno)

+dbo.fn_varbintostr_((LEN(right(dbo.[fn_varbintostr](Id),8)+

dbo.fn_getHexdateTime(GETDATE())+dbo.fn_varbintostr_((len('01'+dbo.fn_varbintostr_(Len(@stbid),2)+dbo.cas_abv_stbidlength(@stbid))/2),4)+'01'+dbo.fn_varbintostr_(Len(@stbid),2)+dbo.cas_abv_stbidlength(@stbid))/2),4)

+right(dbo.[fn_varbintostr](Id),8)+

dbo.fn_getHexdateTime(GETDATE())+dbo.fn_varbintostr_((len('01'+dbo.fn_varbintostr_(Len(@stbid),2)+dbo.cas_abv_stbidlength(@stbid))/2),4)+'01'+dbo.fn_varbintostr_(Len(@stbid),2)+dbo.cas_abv_stbidlength(@stbid)

from SMS_CAS_CMDS order by Id desc

/*

select top 1 @sc='0160002C'+'362701'+dbo.fn_getHexdateTime(Dateadd(month,1,GETDATE()))+'07'+'02'+dbo.cas_abv_convert_smartcard(@scno)+'001B'+right(dbo.[fn_varbintostr](Id),8)+

dbo.fn_getHexdateTime(GETDATE())+dbo.fn_varbintostr_((len('01'+dbo.fn_varbintostr_(Len(@stbid),2)+dbo.cas_abv_stbidlength(@stbid))/2),4)+'01'+dbo.fn_varbintostr_(Len(@stbid),2)+dbo.cas_abv_stbidlength(@stbid)

from SMS_CAS_CMDS order by Id desc 

*/

return @sc

end








GO
