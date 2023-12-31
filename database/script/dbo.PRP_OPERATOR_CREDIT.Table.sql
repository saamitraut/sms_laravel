USE [MNSMS]
GO
/****** Object:  Table [dbo].[PRP_OPERATOR_CREDIT]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRP_OPERATOR_CREDIT](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_PRP_OPERATOR_CREDIT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PRP_OPERATOR_CREDIT] ON 

INSERT [dbo].[PRP_OPERATOR_CREDIT] ([Id], [OperatorId], [Amount], [CreditDate], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [ReceiptNo], [PaymentMode], [BankName], [ChequeNo], [ChequeDate], [TransType]) VALUES (1, 1, 100, CAST(N'2022-08-08' AS Date), N'test', CAST(N'2022-08-08T14:13:44.853' AS DateTime), 1, NULL, NULL, 0, NULL, N'123456', 0, NULL, NULL, NULL, 1)
INSERT [dbo].[PRP_OPERATOR_CREDIT] ([Id], [OperatorId], [Amount], [CreditDate], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [ReceiptNo], [PaymentMode], [BankName], [ChequeNo], [ChequeDate], [TransType]) VALUES (2, 1, 500, CAST(N'2022-09-20' AS Date), N'tyghgh', CAST(N'2022-09-20T14:43:43.233' AS DateTime), 3, NULL, NULL, 0, NULL, N'45454', 0, NULL, NULL, NULL, 1)
INSERT [dbo].[PRP_OPERATOR_CREDIT] ([Id], [OperatorId], [Amount], [CreditDate], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [ReceiptNo], [PaymentMode], [BankName], [ChequeNo], [ChequeDate], [TransType]) VALUES (3, 2, 2000, CAST(N'2023-06-06' AS Date), N'0000', CAST(N'2023-06-06T13:48:16.950' AS DateTime), 3, NULL, NULL, 0, NULL, N'123456', 0, NULL, NULL, NULL, 1)
INSERT [dbo].[PRP_OPERATOR_CREDIT] ([Id], [OperatorId], [Amount], [CreditDate], [Description], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Deleted], [Remark], [ReceiptNo], [PaymentMode], [BankName], [ChequeNo], [ChequeDate], [TransType]) VALUES (4, 1, 2000, CAST(N'2023-08-22' AS Date), N'0000', CAST(N'2023-08-22T12:26:20.063' AS DateTime), 3, NULL, NULL, 0, NULL, N'123654', 0, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[PRP_OPERATOR_CREDIT] OFF
GO
/****** Object:  Index [_dta_index_PRP_OPERATOR_CREDIT_5_1453404397__K2_K1_3]    Script Date: 2023-11-10 06:14:02 ******/
CREATE NONCLUSTERED INDEX [_dta_index_PRP_OPERATOR_CREDIT_5_1453404397__K2_K1_3] ON [dbo].[PRP_OPERATOR_CREDIT]
(
	[OperatorId] ASC,
	[Id] ASC
)
INCLUDE([Amount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRP_OPERATOR_CREDIT] ADD  CONSTRAINT [DF_PRP_OPERATOR_CREDIT_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[PRP_OPERATOR_CREDIT] ADD  CONSTRAINT [DF_PRP_OPERATOR_CREDIT_PaymentMode]  DEFAULT ((0)) FOR [PaymentMode]
GO
ALTER TABLE [dbo].[PRP_OPERATOR_CREDIT] ADD  CONSTRAINT [DF_PRP_OPERATOR_CREDIT_TransType]  DEFAULT ((1)) FOR [TransType]
GO
ALTER TABLE [dbo].[PRP_OPERATOR_CREDIT]  WITH CHECK ADD  CONSTRAINT [FK_PRP_OPERATOR_CREDIT_SMS_OPERATOR] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[SMS_OPERATOR] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRP_OPERATOR_CREDIT] CHECK CONSTRAINT [FK_PRP_OPERATOR_CREDIT_SMS_OPERATOR]
GO
