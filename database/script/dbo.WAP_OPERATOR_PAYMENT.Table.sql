USE [MNSMS]
GO
/****** Object:  Table [dbo].[WAP_OPERATOR_PAYMENT]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WAP_OPERATOR_PAYMENT](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WapId] [bigint] NULL,
	[PaymentId] [varchar](100) NULL,
	[SubscriberId] [bigint] NOT NULL,
	[CustomerId] [varchar](100) NULL,
	[AccountId] [bigint] NOT NULL,
	[OperatorId] [bigint] NULL,
	[Subscriber] [varchar](255) NULL,
	[STBNo] [varchar](100) NULL,
	[SmartcardNo] [varchar](100) NULL,
	[BoxType] [varchar](50) NULL,
	[PaymentType] [varchar](50) NULL,
	[Amount] [decimal](10, 2) NULL,
	[UserType] [varchar](5) NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [bigint] NULL,
	[PaymentOn] [datetime] NULL,
	[PaymentBy] [bigint] NULL,
	[SessionId] [varchar](255) NULL,
	[PaymentStatus] [int] NULL,
	[Status] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WAP_OPERATOR_PAYMENT] ADD  DEFAULT ((0)) FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[WAP_OPERATOR_PAYMENT] ADD  DEFAULT ((0)) FOR [Status]
GO
