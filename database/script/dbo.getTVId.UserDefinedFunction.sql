USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getTVId]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getTVId](@subscriberId as bigint,@roId as bigint=1)
returns varchar(8)
as
Begin
Declare @ret  varchar(8)
Declare @MaxCustId  int

Select @MaxCustId=cast(max(right(TVId,3)) as int) from  sms_h_view_analog_accounts 
where SubscriberId= @subscriberId
Select  @ret  ='ICCTV'+dbo.getNdigit(isnull(@MaxCustId,0)+@roId,3)
return @ret	
end
GO
