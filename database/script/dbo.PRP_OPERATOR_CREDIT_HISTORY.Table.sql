USE [MNSMS]
GO
/****** Object:  Table [dbo].[PRP_OPERATOR_CREDIT_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRP_OPERATOR_CREDIT_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NOT NULL,
	[OperatorId] [bigint] NOT NULL,
	[Amount] [float] NOT NULL,
	[CreditDate] [date] NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[ReceiptNo] [varchar](50) NULL,
	[PaymentMode] [int] NOT NULL,
	[BankName] [varchar](50) NULL,
	[ChequeNo] [varchar](50) NULL,
	[ChequeDate] [datetime] NULL,
	[TransType] [int] NOT NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_PRP_OPERATOR_CREDIT_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PRP_OPERATOR_CREDIT_HISTORY] ON 

INSERT [dbo].[PRP_OPERATOR_CREDIT_HISTORY] ([Id], [FID], [OperatorId], [Amount], [CreditDate], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [ReceiptNo], [PaymentMode], [BankName], [ChequeNo], [ChequeDate], [TransType], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (1, 1, 1, 100, CAST(N'2022-08-08' AS Date), N'test', CAST(N'2022-08-08T14:13:44.853' AS DateTime), 1, NULL, NULL, 0, NULL, N'123456', 0, NULL, NULL, NULL, 1, CAST(N'2022-08-08T14:13:44.863' AS DateTime), 1, 0, 1, N'Inserted')
INSERT [dbo].[PRP_OPERATOR_CREDIT_HISTORY] ([Id], [FID], [OperatorId], [Amount], [CreditDate], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [ReceiptNo], [PaymentMode], [BankName], [ChequeNo], [ChequeDate], [TransType], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (2, 2, 1, 500, CAST(N'2022-09-20' AS Date), N'tyghgh', CAST(N'2022-09-20T14:43:43.233' AS DateTime), 3, NULL, NULL, 0, NULL, N'45454', 0, NULL, NULL, NULL, 1, CAST(N'2022-09-20T14:43:43.233' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[PRP_OPERATOR_CREDIT_HISTORY] ([Id], [FID], [OperatorId], [Amount], [CreditDate], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [ReceiptNo], [PaymentMode], [BankName], [ChequeNo], [ChequeDate], [TransType], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (3, 3, 2, 2000, CAST(N'2023-06-06' AS Date), N'0000', CAST(N'2023-06-06T13:48:16.950' AS DateTime), 3, NULL, NULL, 0, NULL, N'123456', 0, NULL, NULL, NULL, 1, CAST(N'2023-06-06T13:48:16.957' AS DateTime), 3, 0, 1, N'Inserted')
INSERT [dbo].[PRP_OPERATOR_CREDIT_HISTORY] ([Id], [FID], [OperatorId], [Amount], [CreditDate], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [ReceiptNo], [PaymentMode], [BankName], [ChequeNo], [ChequeDate], [TransType], [InsertedOn], [InsertedBy], [PreviousId], [DMLAction], [DMLComments]) VALUES (4, 4, 1, 2000, CAST(N'2023-08-22' AS Date), N'0000', CAST(N'2023-08-22T12:26:20.063' AS DateTime), 3, NULL, NULL, 0, NULL, N'123654', 0, NULL, NULL, NULL, 1, CAST(N'2023-08-22T12:26:20.067' AS DateTime), 3, 0, 1, N'Inserted')
SET IDENTITY_INSERT [dbo].[PRP_OPERATOR_CREDIT_HISTORY] OFF
GO
ALTER TABLE [dbo].[PRP_OPERATOR_CREDIT_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[PRP_OPERATOR_CREDIT_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO
