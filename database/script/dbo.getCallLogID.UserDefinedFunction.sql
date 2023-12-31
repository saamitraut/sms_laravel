USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[getCallLogID]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[getCallLogID](@SubCalltyId as bigint,@rowId as bigint=1)
RETURNS varchar(12)
as
Begin
Declare @ret as varchar(12)
Declare @tdte as varchar(4)
Declare @nos as varchar(5)
Declare @pre as varchar(3)
Declare @maxCallId as varchar(12)
Declare @calId as bigint

Select @pre=CallTypeCode+Code from sla_view_calltypelist where ID=@SubCalltyId

Select @maxCallId=isnull(max(cast(right(CallLogId,5) as int)),0) from SLA_COMPLAINT_HISTORY where SubCallId=@SubCalltyId
and month(CreatedOn)=month(getdate()) and YEAR(CreatedOn)=YEAR(getdate())

select @calId =isnull(cast(right(@maxCallId,5) as int ),0)+@rowId
set @tdte= convert(varchar(4),getdate(),12)
set @nos=dbo.getNdigit(@calId,5)
Set @ret=@pre+right(@tdte,2)+left(@tdte,2)+@nos
return @ret

end
GO
