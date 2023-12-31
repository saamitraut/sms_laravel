USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getPNxtFrmNo]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[getPNxtFrmNo]()returns varchar(8) 
as
Begin
Declare @frmno as varchar(8)
select @frmno='FTA'+dbo.getNdigit(isnull(max(cast(SUBSTRING(FormNo,4,LEN(FormNo))as bigint)),0)+1,5) 
from SLA_PROSPETSUBSCRIBERS
 where   FormNo like 'FTA[0-9][0-9][0-9][0-9][0-9]'
 return @frmno
end
GO
