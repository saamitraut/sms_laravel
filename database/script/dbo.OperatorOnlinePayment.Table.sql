USE [MNSMS]
GO
/****** Object:  Table [dbo].[OperatorOnlinePayment]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperatorOnlinePayment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OperatorId] [varchar](100) NULL,
	[PaymentId] [varchar](100) NULL,
	[ReferenceId] [varchar](100) NULL,
	[TransactionId] [varchar](100) NULL,
	[BankTransactionId] [varchar](100) NULL,
	[Bank] [varchar](255) NULL,
	[Amount] [varchar](50) NULL,
	[Remark] [text] NULL,
	[PaymentType] [int] NULL,
	[PaymentMode] [varchar](10) NULL,
	[LogId] [bigint] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[RequestedOn] [datetime] NULL,
	[ResponseOn] [datetime] NULL,
	[TransactionOn] [datetime] NULL,
	[RespCode] [varchar](50) NULL,
	[RespMessage] [varchar](500) NULL,
	[PostParam] [text] NULL,
	[ResponseParam] [text] NULL,
	[RequestToken] [text] NULL,
	[DoubleRequestString] [text] NULL,
	[DoubleRequestStatus] [int] NULL,
	[DoubleRequestOn] [datetime] NULL,
	[DoubleResponseString] [text] NULL,
	[UnRead] [int] NULL,
	[Status] [int] NULL,
	[AuthStatus] [varchar](50) NULL,
	[SendStatus] [int] NULL,
	[SessionId] [varchar](150) NULL,
	[PGSource] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[OperatorOnlinePayment] ADD  DEFAULT ((0)) FOR [PaymentType]
GO
ALTER TABLE [dbo].[OperatorOnlinePayment] ADD  DEFAULT ((0)) FOR [UnRead]
GO
ALTER TABLE [dbo].[OperatorOnlinePayment] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[OperatorOnlinePayment] ADD  DEFAULT ((0)) FOR [SendStatus]
GO
