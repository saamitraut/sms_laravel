USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[z_d_getNxtActDectId]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[z_d_getNxtActDectId](@id as bigint,@accId as bigint)
 returns bigint
 As 
 Begin
 Declare @r as bigint
	select @r=min(Id) from SMS_Z_D_ACTIVEINACTIVE_LOG where Id>@id and AccountId=@accId 
 return isnull(@r,0)
 End
GO
