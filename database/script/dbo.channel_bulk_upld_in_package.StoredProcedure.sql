USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[channel_bulk_upld_in_package]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[channel_bulk_upld_in_package] @ID as bigint,@FilePath as varchar(max),@UserId as bigint as
BEGIN
------------------------------------Upload from excel from EXCEL-------------------------------------------------------------------
declare @var as varchar(max);
set @var ='insert into UPLOADED_CHANNEL_IN_PACKAGE_TABLE(CascodeCatvision,ServiceId,SESSION_ID)
select isNull(cast(CascodeCatvision as varchar),''NA''),isNull(cast(ServiceId as varchar),''NA''),'+cast(@ID as varchar)+'
from OPENROWSET(''Microsoft.ACE.OLEDB.12.0'',''Excel 12.0;Database='+@FilePath+';'',''SELECT CascodeCatvision,ServiceId FROM [Sheet1$]'')'
print(@var)
exec (@var)

select a.CascodeCatvision,a.ServiceId,c.id as ChannelId,BRate as BroadcasterPrice,a.SESSION_ID,b.Id as PackageId,@UserId as UserId into #temp from UPLOADED_CHANNEL_IN_PACKAGE_TABLE a
left join SMS_PACKAGE b on a.CascodeCatvision=b.CascodeCatvision
left join SMS_CHANNEL c on a.ServiceId=c.TSID
 where  SESSION_ID=@ID ;


update a set a.Deleted=1,a.UpdatedOn=GETDATE(),Remark='BULK_REMOVED_CHNNEL_FROM_PACKAGE'
from SMS_CHANNELINPACKAGE a
--inner join #temp b on a.PackageId=b.PackageId
where a.PackageId in (select distinct PackageId from #temp)

select * into #channel from (
select ROW_NUMBER() over (partition By channelId order by PackageId desc ) as Rid,* from #temp) x where Rid=1

select * from #channel

insert into SMS_CHANNELINPACKAGE(PackageId,ChannelId,CREATEDON,CREATEDBY,BroadcasterPrice,Remark)
select a.PackageId,a.ChannelId,GETDATE(),a.UserId,a.BroadcasterPrice,'Proc channel_bulk_upld_in_package'
	from #channel a where  SESSION_ID=@ID and a.ChannelId is not null

update UPLOADED_CHANNEL_IN_PACKAGE_TABLE set STATUS_REMARK ='Uploaded Successfully' where  SESSION_ID=@ID
update SESSION_TABLE set EndTime =GETDATE() where Id =@ID

select (select COUNT(Id) from UPLOADED_SOCIETY_TABLE where STATUS =0 and SESSION_ID =@ID) as Uploaded_Entries,(select COUNT(Id) from UPLOADED_SOCIETY_TABLE where STATUS =0 
and SESSION_ID =@ID) as Not_UPLOADED,count(Id) as Total
from #channel where SESSION_ID =@ID

select CascodeCatvision,ServiceId,STATUS_REMARK  from UPLOADED_CHANNEL_IN_PACKAGE_TABLE where SESSION_ID =@ID 

END
GO
