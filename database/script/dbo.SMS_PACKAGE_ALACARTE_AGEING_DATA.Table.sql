USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_PACKAGE_ALACARTE_AGEING_DATA]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_PACKAGE_ALACARTE_AGEING_DATA](
	[PRID] [tinyint] NULL,
	[DaysWnt] [bigint] NULL,
	[RID] [tinyint] NULL,
	[Id] [bigint] NULL,
	[FID] [bigint] NULL,
	[CustomerId] [varchar](50) NULL,
	[SubscriberName] [varchar](150) NULL,
	[SmartcardNo] [varchar](50) NULL,
	[STBNo] [varchar](50) NULL,
	[AccountId] [bigint] NULL,
	[ProductId] [bigint] NULL,
	[IsAlacarte] [bit] NULL,
	[ActivationDate] [datetime] NULL,
	[DeactivationDate] [datetime] NULL,
	[Flag] [bit] NULL,
	[Status] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](100) NULL,
	[InsertedOn] [datetime] NULL,
	[InsertedBy] [int] NULL,
	[DMLAction] [tinyint] NULL,
	[DMLComments] [varchar](100) NULL,
	[GeneratedOn] [datetime] NULL
) ON [PRIMARY]
GO
