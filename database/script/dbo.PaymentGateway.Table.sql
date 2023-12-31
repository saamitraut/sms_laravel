USE [MNSMS]
GO
/****** Object:  Table [dbo].[PaymentGateway]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentGateway](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentId] [varchar](100) NULL,
	[TxnAmount] [real] NULL,
	[TxnType] [varchar](50) NULL,
	[BankCode] [varchar](100) NULL,
	[BankMerchantID] [varchar](100) NULL,
	[TxnReferenceNo] [varchar](100) NULL,
	[BankReferenceNo] [varchar](100) NULL,
	[CurrencyName] [varchar](50) NULL,
	[ItemCode] [varchar](50) NULL,
	[TxnMsg] [varchar](200) NULL,
	[Remark] [text] NULL,
	[RespMessage] [text] NULL,
	[PaymentType] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ResponseOn] [datetime] NULL,
	[TransactionOn] [datetime] NULL,
	[RequestParam] [text] NULL,
	[ResponseParam] [text] NULL,
	[RequestToken] [text] NULL,
	[ResponseToken] [text] NULL,
	[Status] [int] NULL,
	[AuthStatus] [varchar](50) NULL,
	[SendStatus] [int] NULL,
	[SessionId] [varchar](150) NULL,
	[PaymentMethod] [int] NULL,
	[DoubleRequestString] [text] NULL,
	[DoubleRequestStatus] [int] NOT NULL,
	[DoubleRequestOn] [datetime] NULL,
	[DoubleResponseString] [text] NULL,
	[UnRead] [int] NOT NULL,
	[OrderId] [varchar](100) NULL,
	[Card] [varchar](255) NULL,
	[FailureMessage] [varchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaymentGateway] ADD  DEFAULT ('0') FOR [Status]
GO
ALTER TABLE [dbo].[PaymentGateway] ADD  DEFAULT ('0') FOR [SendStatus]
GO
ALTER TABLE [dbo].[PaymentGateway] ADD  DEFAULT ('0') FOR [PaymentMethod]
GO
ALTER TABLE [dbo].[PaymentGateway] ADD  DEFAULT ((0)) FOR [UnRead]
GO
