USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_CAS_CMDSARCHIVE]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_CAS_CMDSARCHIVE](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
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
	[SendedOn] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[FLAG] [int] NOT NULL,
	[MSG_MAP_ID] [bigint] NOT NULL,
	[Status_msg] [varchar](150) NOT NULL,
	[CASTYPE] [bigint] NOT NULL,
	[LinkIds] [varchar](2000) NULL,
	[LinkCount] [int] NULL,
	[SMSNAME] [varchar](17) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
