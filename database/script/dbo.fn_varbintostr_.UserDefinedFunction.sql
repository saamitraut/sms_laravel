USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_varbintostr_]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_varbintostr_](@v as bigint,@len as int=16)
returns varchar(100)
as
Begin
declare @vr as varchar(100)
Select @vr=right(upper(substring(CONVERT(varchar(100),master.dbo.fn_varbintohexstr(@v)),3,100)),@len);
return @vr;
End
GO
