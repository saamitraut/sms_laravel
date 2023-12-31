USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[prp_fn_getopSubOpbalance]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[prp_fn_getopSubOpbalance](@subscriberId as bigint,@op_subop as bit)--0 for opertaor acc 1 for subop acc  
returns float  
as  
begin  
 declare @bal as float  
 if @op_subop=1  
 begin  
 Select @bal=isnull(b.Balance,0) from sms_view_subscribers a left outer join prp_view_operator_ledger_balance b   
 on a.OperatorId=b.OperatorId  
 where a.Id=@subscriberId and b.operatorId is not null;  
 end  
 else   
 Begin  
 Select @bal=isnull(b.Balance,0) from sms_view_subscribers a left outer join prp_view_operator_ledger_balance b   
 on a.ParentOperatorId=b.OperatorId  
 where a.Id=@subscriberId and b.operatorId is not null   
 end  
 return isnull(@bal,0)  
  
end    
GO
