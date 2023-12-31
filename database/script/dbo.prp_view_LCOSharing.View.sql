USE [MNSMS]
GO
/****** Object:  View [dbo].[prp_view_LCOSharing]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[prp_view_LCOSharing] as
select sum(LCOSharing) as LCOSharing, sum(NCF_LCOSharing) as NCF_LCOSharing,sum(LCOSharing)+sum(NCF_LCOSharing) as TotalLCOSharing,OperatorId
from PRP_ACCOUNTTRANSACTION_HISTORY where DMLAction=1 group by OperatorId
GO
