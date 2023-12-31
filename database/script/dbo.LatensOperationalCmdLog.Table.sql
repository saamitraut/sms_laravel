USE [MNSMS]
GO
/****** Object:  Table [dbo].[LatensOperationalCmdLog]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LatensOperationalCmdLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CommandName] [varchar](50) NOT NULL,
	[IsGlobal] [bit] NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[StbProvisionId] [bigint] NOT NULL,
	[StbId] [bigint] NOT NULL,
	[Param] [varchar](1000) NOT NULL,
	[TTE] [datetime] NULL,
	[AssetIds] [varchar](2000) NULL,
	[ChannelIds] [varchar](2000) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Status] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LatensOperationalCmdLog] ADD  CONSTRAINT [DF_SMS_LatensOperationalCmdLog_IsGlobal]  DEFAULT ((0)) FOR [IsGlobal]
GO
ALTER TABLE [dbo].[LatensOperationalCmdLog] ADD  CONSTRAINT [DF_SMS_LatensOperationalCmdLog_SubscriberId]  DEFAULT ((0)) FOR [SubscriberId]
GO
ALTER TABLE [dbo].[LatensOperationalCmdLog] ADD  CONSTRAINT [DF_SMS_LatensOperationalCmdLog_Status]  DEFAULT ((0)) FOR [Status]
GO
