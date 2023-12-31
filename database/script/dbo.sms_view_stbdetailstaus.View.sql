USE [MNSMS]
GO
/****** Object:  View [dbo].[sms_view_stbdetailstaus]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[sms_view_stbdetailstaus] AS
select a.STBNo,a.MACADDRESS,a.BrandId,a.Brand as BrandTitle,
case when a.BoxType='0' then 'SD' when a.BoxType='1' then 'HD' end as [Type],
Case
when PairingId=0 and AccountId=0 and Status=1 then 'Instock' 
when PairingId>0 and AccountId>0 and Status=1 then 'Issued' 
when PairingId>0 and AccountId=0  and  Pstatus=0 and Status=1 then 'PairedQC' 
when PairingId>0 and AccountId=0  and  Pstatus=1 and Status=1 then 'PairedStock' 
when Status=3 then 'Faulty'
when Status=4 then 'BlackList'
end as Status
 from sms_view_stb a
GO
