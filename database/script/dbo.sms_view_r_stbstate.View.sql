USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_r_stbstate]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_r_stbstate] as
select *,
Case when Status=4 then 'Blacklisted' when  Status=3  then 'Faulty' when  PStatus=-1 then 'QC' when isAssigned=1 then 'Issued' 
when Pstatus=0 then 'Pairing QC' when Pstatus=1 then 'Pairing Stock' else 'Undefined' end as [State]
 from sms_view_stb
GO
