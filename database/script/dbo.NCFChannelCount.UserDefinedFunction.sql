USE [MNSMS]
GO
/****** Object:  UserDefinedFunction [dbo].[NCFChannelCount]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[NCFChannelCount](@bouId as varchar(8000)) returns bigint As 
Begin
Declare @rd as bigint
select @rd=isnull(sum(cnt),0) from (
select count(distinct ChannelId) as Cnt from (select b.Id as ChannelId,ChannelType from SMS_CHANNELINPACKAGE a left join SMS_CHANNEL b on a.ChannelId=b.Id where a.PackageId in (select b.Id from PRP_BOUQUE_ASSETS a 
left outer join SMS_PACKAGE b on a.PackageId=b.id where b.Id is not null and a.BouqueId in (select items from dbo.Split_coma(@bouId))) and b.ChannelType=0
union all
select Id as ChannelId,ChannelType from SMS_CHANNEL where Id in (select b.Id from PRP_BOUQUE_ASSETS a 
left outer join SMS_CHANNEL b on a.ChannelId=b.id where b.Id is not null and a.BouqueId in (select items from dbo.Split_coma(@bouId))) and ChannelType=0)x
union all
select count(distinct ChannelId)*2 as Cnt from (select b.Id as ChannelId,ChannelType from SMS_CHANNELINPACKAGE a left join SMS_CHANNEL b on a.ChannelId=b.Id where a.PackageId in (select b.Id from PRP_BOUQUE_ASSETS a 
left outer join SMS_PACKAGE b on a.PackageId=b.id where b.Id is not null and a.BouqueId in (select items from dbo.Split_coma(@bouId))) and b.ChannelType=1
union all
select Id as ChannelId,ChannelType from SMS_CHANNEL where Id in (select b.Id from PRP_BOUQUE_ASSETS a 
left outer join SMS_CHANNEL b on a.ChannelId=b.id where b.Id is not null and a.BouqueId in (select items from dbo.Split_coma(@bouId))) and ChannelType=1)x
)x
return isnull(@rd,0)
end
GO
