USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[get_SusbcriberAreaCASCode]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[get_SusbcriberAreaCASCode](@SubscriberId as bigint)
returns int
as
Begin
declare @area as int
Select @area=AREACASCODE from sms_view_subscribers where ID=@SubscriberId
return @area
End
GO
