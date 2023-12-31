USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_CATVISION_CMDS]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_CATVISION_CMDS](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SmartCardNo] [varchar](220) NOT NULL,
	[SmartCardId] [bigint] NOT NULL,
	[STBNo] [varchar](20) NULL,
	[StbId] [bigint] NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[CommandId] [bigint] NOT NULL,
	[CommandName] [varchar](50) NOT NULL,
	[Command] [text] NOT NULL,
	[Status] [int] NOT NULL,
	[Response] [text] NULL,
	[Attempts] [int] NOT NULL,
	[Command_Param] [text] NULL,
	[ActivationDate] [date] NULL,
	[DeactivationDate] [date] NULL,
	[PackageIds] [varchar](1150) NULL,
	[AlacarteIds] [varchar](1150) NULL,
	[Remark] [varchar](550) NULL,
	[CommandDate] [datetime] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[FLAG] [varchar](50) NULL,
	[LinkIds] [varchar](2000) NULL,
	[LinkCount] [int] NULL,
	[UpdatedOn] [datetime] NULL,
	[message] [varchar](250) NULL,
	[displayType] [varchar](50) NULL,
	[direction] [varchar](50) NULL,
	[length] [varchar](50) NULL,
	[transparency] [varchar](50) NULL,
	[Position] [varchar](50) NULL,
	[fcolor] [varchar](50) NULL,
	[bgcolor] [varchar](50) NULL,
	[unittime] [varchar](50) NULL,
	[pertime] [varchar](50) NULL,
	[tottaltime] [varchar](50) NULL,
	[Fsize] [varchar](50) NULL,
	[coordinate1] [varchar](50) NULL,
	[coordinate2] [varchar](50) NULL,
	[coordinate3] [varchar](50) NULL,
	[coordinate4] [varchar](50) NULL,
	[areacode] [varchar](50) NULL,
	[serviceid] [varchar](50) NULL,
 CONSTRAINT [PK_SMS_CATVISION_CMDS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_CATVISION_CMDS] ADD  CONSTRAINT [DF_SMS_CATVISION_CMDS_SmartCardId]  DEFAULT ((0)) FOR [SmartCardId]
GO
ALTER TABLE [dbo].[SMS_CATVISION_CMDS] ADD  CONSTRAINT [DF_SMS_CATVISION_CMDS_StbId]  DEFAULT ((0)) FOR [StbId]
GO
ALTER TABLE [dbo].[SMS_CATVISION_CMDS] ADD  CONSTRAINT [DF_SMS_CATVISION_CMDS_SubscriberId]  DEFAULT ((0)) FOR [SubscriberId]
GO
ALTER TABLE [dbo].[SMS_CATVISION_CMDS] ADD  CONSTRAINT [DF_SMS_CATVISION_CMDS_AccountId]  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[SMS_CATVISION_CMDS] ADD  CONSTRAINT [DF_SMS_CATVISION_CMDS_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_CATVISION_CMDS] ADD  CONSTRAINT [DF_SMS_CATVISION_CMDS_Attempts]  DEFAULT ((0)) FOR [Attempts]
GO
ALTER TABLE [dbo].[SMS_CATVISION_CMDS] ADD  CONSTRAINT [DF_SMS_CATVISION_CMDS_CommandDate]  DEFAULT (getdate()) FOR [CommandDate]
GO
ALTER TABLE [dbo].[SMS_CATVISION_CMDS] ADD  CONSTRAINT [DF_SMS_CATVISION_CMDS_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[SMS_CATVISION_CMDS] ADD  CONSTRAINT [DF_SMS_CATVISION_CMDS_FLAG]  DEFAULT ((0)) FOR [FLAG]
GO
ALTER TABLE [dbo].[SMS_CATVISION_CMDS] ADD  CONSTRAINT [DF__SMS_CATVI__Updat__32C37846]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
