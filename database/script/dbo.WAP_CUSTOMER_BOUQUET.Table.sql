USE [MNSMS]
GO
/****** Object:  Table [dbo].[WAP_CUSTOMER_BOUQUET]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WAP_CUSTOMER_BOUQUET](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WapId] [bigint] NULL,
	[PaymentId] [varchar](100) NULL,
	[SubscriberId] [bigint] NOT NULL,
	[CustomerId] [varchar](100) NULL,
	[AccountId] [bigint] NOT NULL,
	[Subscriber] [varchar](255) NULL,
	[STBNo] [varchar](100) NULL,
	[SmartcardNo] [varchar](100) NULL,
	[BoxType] [varchar](50) NULL,
	[BouqueId] [bigint] NULL,
	[BouqueTitle] [varchar](50) NULL,
	[BouqueAmount] [decimal](10, 2) NULL,
	[Amount] [decimal](10, 2) NULL,
	[BouqueType] [varchar](50) NULL,
	[BouqueMonth] [int] NULL,
	[BouqueDeactivationDate] [datetime] NULL,
	[UserType] [varchar](5) NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [bigint] NULL,
	[PaymentOn] [datetime] NULL,
	[PaymentBy] [bigint] NULL,
	[SessionId] [varchar](255) NULL,
	[IsOnlinePayment] [int] NULL,
	[PaymentStatus] [int] NULL,
	[Status] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WAP_CUSTOMER_BOUQUET] ADD  DEFAULT ((1)) FOR [BouqueMonth]
GO
ALTER TABLE [dbo].[WAP_CUSTOMER_BOUQUET] ADD  DEFAULT ((0)) FOR [IsOnlinePayment]
GO
ALTER TABLE [dbo].[WAP_CUSTOMER_BOUQUET] ADD  DEFAULT ((0)) FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[WAP_CUSTOMER_BOUQUET] ADD  DEFAULT ((0)) FOR [Status]
GO
