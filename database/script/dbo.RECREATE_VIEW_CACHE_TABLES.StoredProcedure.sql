USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[RECREATE_VIEW_CACHE_TABLES]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RECREATE_VIEW_CACHE_TABLES] as 
Begin
	if(exists(Select *from LOG_RECREARE_VIEW_CACHE where TableName='SMS_PACKAGE_ALACARTE_AGEING' and ReCreate=1))
	begin
	Declare @getdate as date=getdate()
	exec [sms_paclala_agening] @getdate
	
	Update LOG_RECREARE_VIEW_CACHE set  ReCreate=0,RecretedOn=GETDATE() where TableName='SMS_PACKAGE_ALACARTE_AGEING' 
	end
end
GO
