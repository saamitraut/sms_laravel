USE [MNSMS]
GO
/****** Object:  Table [dbo].[TELELYNX_CAS_CMDS]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TELELYNX_CAS_CMDS](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SmartCardNo] [varchar](100) NOT NULL,
	[STBNo] [varchar](20) NULL,
	[SubscriberId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[CommandName] [varchar](50) NOT NULL,
	[Command] [text] NULL,
	[Status] [int] NOT NULL,
	[Response] [text] NULL,
	[Command_Param] [text] NULL,
	[ActivationDate] [varchar](50) NULL,
	[DeactivationDate] [varchar](50) NULL,
	[PackageIds] [varchar](300) NULL,
	[AlacarteIds] [varchar](300) NULL,
	[Remark] [varchar](550) NULL,
	[CommandDate] [datetime] NOT NULL,
	[SendedOn] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[Status_msg] [varchar](150) NOT NULL,
	[LinkIds] [varchar](2000) NULL,
	[LinkCount] [int] NULL,
	[StartTime] [varchar](50) NULL,
	[ExpiryTime] [varchar](50) NULL,
	[BranchId] [bigint] NULL,
	[SMSNAME] [varchar](17) NOT NULL,
 CONSTRAINT [PK_TELELYNX_CAS_CMDS_CMDS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TELELYNX_CAS_CMDS] ADD  CONSTRAINT [DF_TELELYNX_CAS_CMDS_SubscriberId]  DEFAULT ((0)) FOR [SubscriberId]
GO
ALTER TABLE [dbo].[TELELYNX_CAS_CMDS] ADD  CONSTRAINT [DF_TELELYNX_CAS_CMDS_AccountId]  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[TELELYNX_CAS_CMDS] ADD  CONSTRAINT [DF_TELELYNX_CAS_CMDS_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[TELELYNX_CAS_CMDS] ADD  CONSTRAINT [DF_TELELYNX_CAS_CMDS_CommandDate]  DEFAULT (getdate()) FOR [CommandDate]
GO
ALTER TABLE [dbo].[TELELYNX_CAS_CMDS] ADD  CONSTRAINT [DF_TELELYNX_CAS_CMDS_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[TELELYNX_CAS_CMDS] ADD  CONSTRAINT [DF__TELELYNX___Statu__151DCC9E]  DEFAULT ('Pending') FOR [Status_msg]
GO
ALTER TABLE [dbo].[TELELYNX_CAS_CMDS] ADD  DEFAULT ((0)) FOR [BranchId]
GO
ALTER TABLE [dbo].[TELELYNX_CAS_CMDS] ADD  CONSTRAINT [DF_TELELYNX_CAS_CMDS_SMSNAME]  DEFAULT ('ADRAPREPAID') FOR [SMSNAME]
GO
