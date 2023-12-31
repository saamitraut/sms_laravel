USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[e_getCasResponse]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[e_getCasResponse] @command_id as int,@commandResponse as varchar(8000),@internalErr as bit=0
As
Begin
declare @status as varchar(500)
Set @status=CASe @internalErr when 0 then 1 else 0 end
update SMS_CAS_CMDS set Response=ltrim(rtrim(@commandResponse)) ,SendedOn=getdate(),
Attempts=Attempts+1,Status_msg=@status,Status =Case @status when '1' then 1 else 2 end where id=@command_id 
Select 'Send' as msg, @status as ret
end
GO
