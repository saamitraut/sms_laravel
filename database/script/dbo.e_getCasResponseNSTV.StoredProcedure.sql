USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[e_getCasResponseNSTV]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[e_getCasResponseNSTV] 
@command_id as int,@commandResponse as varchar(100)
As
Begin
declare @status as varchar(500)
select @status=dbo.getCASErrorDescp(ltrim(rtrim(@commandResponse)))

update SMS_CAS_CMDS set Response=ltrim(rtrim(@commandResponse)) ,SendedOn=getdate(),
Attempts=Attempts+1,Status_msg=@status,Status =Case @status when 'Ok' then 1 else 0 end where id=@command_id

Select @status as msg,Case @status when 'Ok' then 3 else 0 end as ret
end
GO
