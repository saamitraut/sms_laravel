USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getNxtFrmNo]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   
           CREATE function [dbo].[getNxtFrmNo]()returns varchar(8) 
as
Begin
Declare @frmno as varchar(8)
select @frmno='FM'+dbo.getNdigit(ISNULL(cast(max(SUBSTRING(FormNo,3,LEN(FormNo)))as bigint),0)+1,6) 
from SMS_SUBSCRIBERS where  FormNo like 'FM[0-9][0-9][0-9][0-9][0-9][0-9]'
return @frmno
end
GO
