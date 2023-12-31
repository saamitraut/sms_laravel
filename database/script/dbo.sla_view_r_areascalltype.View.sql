USE [MNSMS]
GO
/****** Object:  View [dbo].[sla_view_r_areascalltype]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sla_view_r_areascalltype] as
Select COUNT(*) as Cnt,CalltypeId,Status,
Case when Status=1 and CallType='REQUEST'  then 'OREQUEST'
 when Status=0 and CallType='REQUEST'  then 'CREQUEST'
 when Status=1 and CallType='Complaint'  then 'OComplaint'
 when Status=0 and CallType='Complaint'  then 'CComplaint'
 when Status=1 and CallType='Query'  then 'OQuery'
 when Status=0 and CallType='Query'  then 'CQuery'
 when Status=1 and CallType='Installation'  then 'OInstallation'
 when Status=0 and CallType='Installation'  then 'CInstallation'
 when Status=1 and CallType='Web Query'  then 'OWebQuery'
 when Status=0 and CallType='Web Query'  then 'CWebQuery'
end as [State]
,AreaName,Areaid,CallType from sla_view_complaintList_details
group by status,CalltypeId,AreaName,Areaid,CallType
GO
