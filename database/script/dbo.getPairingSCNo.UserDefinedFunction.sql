USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getPairingSCNo]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getPairingSCNo](@pairingId as bigint)
returns varchar(20)
As
begin
Declare @re as varchar(20)
Select @re=SmartcardNo from sms_view_pairing where Id=@pairingId
return isnull(@re,'--')
end
GO
