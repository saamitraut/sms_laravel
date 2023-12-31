USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[NCFChannelCntSlab]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[NCFChannelCntSlab](@chCount as bigint) returns bigint As 
Begin
Declare @rd as bigint
If(@chCount>100)
	Begin 
		select @chCount=@chCount-100;
		select @chCount=case when (@chCount % 25)=0 then (@chCount/25) else (@chCount/25)+1 end;
		select @rd=@chCount
	End 
else 
	Begin 
		select @rd=0;
	End
return isnull(@rd,0)
End
GO
