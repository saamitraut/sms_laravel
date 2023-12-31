USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getLabelMaxLength]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getLabelMaxLength](@parentId as bigint,@frm as int,@to as int)
returns int
as
Begin
declare @r as int
Select  @r =MAX(width) from (
Select Row_Number() over (order by OrderBy,Id) as RowIndex,LEN(Label) as width
from  SMS_MENU where ParentMenuId=@parentId) a  where RowIndex between @frm and @to
return @r
End
GO
