USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_BCAS_CMDS]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_BCAS_CMDS](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SmartCardNo] [varchar](220) NOT NULL,
	[STBNo] [varchar](20) NULL,
	[SubscriberId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[CommandName] [varchar](50) NOT NULL,
	[Command] [text] NOT NULL,
	[Status] [int] NOT NULL,
	[Response] [text] NULL,
	[Attempts] [int] NOT NULL,
	[Command_Param] [text] NULL,
	[ActivationDate] [date] NULL,
	[DeactivationDate] [date] NULL,
	[PackageIds] [varchar](8000) NULL,
	[AlacarteIds] [varchar](8000) NULL,
	[Remark] [varchar](550) NULL,
	[CommandDate] [datetime] NOT NULL,
	[SendOn] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[Status_msg] [varchar](150) NOT NULL,
	[CASTYPE] [bigint] NOT NULL,
	[LinkIds] [varchar](2000) NULL,
	[LinkCount] [int] NULL,
	[MessageID] [bigint] NULL,
 CONSTRAINT [PK_SMS_BCAS_CMDS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_BCAS_CMDS] ADD  CONSTRAINT [DF_SMS_BCAS_CMDS_SubscriberId]  DEFAULT ((0)) FOR [SubscriberId]
GO
ALTER TABLE [dbo].[SMS_BCAS_CMDS] ADD  CONSTRAINT [DF_SMS_BCAS_CMDS_AccountId]  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[SMS_BCAS_CMDS] ADD  CONSTRAINT [DF_SMS_BCAS_CMDS_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_BCAS_CMDS] ADD  CONSTRAINT [DF_SMS_BCAS_CMDS_Attempts]  DEFAULT ((0)) FOR [Attempts]
GO
ALTER TABLE [dbo].[SMS_BCAS_CMDS] ADD  CONSTRAINT [DF_SMS_BCAS_CMDS_CommandDate]  DEFAULT (getdate()) FOR [CommandDate]
GO
ALTER TABLE [dbo].[SMS_BCAS_CMDS] ADD  CONSTRAINT [DF_SMS_BCAS_CMDS_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[SMS_BCAS_CMDS] ADD  CONSTRAINT [DF__SMS_BCAS___Statu__7D7B875F]  DEFAULT ('Pending') FOR [Status_msg]
GO
ALTER TABLE [dbo].[SMS_BCAS_CMDS] ADD  CONSTRAINT [DF__SMS_BCAS___CASTY__7E6FAB98]  DEFAULT ((0)) FOR [CASTYPE]
GO
