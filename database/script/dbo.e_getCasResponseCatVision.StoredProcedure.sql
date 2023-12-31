USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[e_getCasResponseCatVision]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[e_getCasResponseCatVision] 
@command_id as int,@commandResponse as varchar(8000),@internalErr as bit=0
As
Begin
declare @status as varchar(500)
Set @status=CASe @internalErr when 0 then 1 else 0 end
--Set @status=CASe @internalErr when 1 then 'CSMSERR' else 'send' end

update SMS_CATVISION_CMDS set Response=ltrim(rtrim(@commandResponse)) ,UpdatedOn=getdate(),
Attempts=Attempts+1,Status =Case @status when '1' then 1 else 2 end where id=@command_id

Select 'Send' as msg, @status as ret
end
GO
