USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_RECEIPT_MASTER]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_RECEIPT_MASTER](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ReceiptNo] [varchar](250) NOT NULL,
	[ReceiptAmount] [float] NOT NULL,
	[Subscriberid] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Createdby] [bigint] NOT NULL,
	[updatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[ReceiptDate] [datetime] NOT NULL,
	[PaymentMode] [bit] NOT NULL,
	[Chequenumber] [varchar](250) NULL,
	[BankName] [varchar](250) NULL,
	[Chequedate] [datetime] NULL,
	[Digital] [bit] NULL,
	[reconsile] [bit] NOT NULL,
	[BankStatus] [bit] NOT NULL,
	[PAYMENTFOR] [varchar](250) NULL,
	[Remark] [varchar](250) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SMS_RECEIPT_MASTER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_RECEIPT_MASTER]    Script Date: 2023-11-10 06:14:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SMS_RECEIPT_MASTER] ON [dbo].[SMS_RECEIPT_MASTER]
(
	[ReceiptNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_RECEIPT_MASTER] ADD  CONSTRAINT [DF_SMS_RECEIPT_MASTER_PaymentMode]  DEFAULT ((0)) FOR [PaymentMode]
GO
ALTER TABLE [dbo].[SMS_RECEIPT_MASTER] ADD  CONSTRAINT [DF_SMS_RECEIPT_MASTER_Analog]  DEFAULT ((0)) FOR [Digital]
GO
ALTER TABLE [dbo].[SMS_RECEIPT_MASTER] ADD  CONSTRAINT [DF_SMS_RECEIPT_MASTER_reconsile]  DEFAULT ((0)) FOR [reconsile]
GO
ALTER TABLE [dbo].[SMS_RECEIPT_MASTER] ADD  CONSTRAINT [DF_SMS_RECEIPT_MASTER_BankStatus]  DEFAULT ((0)) FOR [BankStatus]
GO
ALTER TABLE [dbo].[SMS_RECEIPT_MASTER] ADD  CONSTRAINT [DF_SMS_RECEIPT_MASTER_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 for digital and 1 for analog' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_RECEIPT_MASTER', @level2type=N'COLUMN',@level2name=N'Digital'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'unique column for receipt number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_RECEIPT_MASTER', @level2type=N'INDEX',@level2name=N'IX_SMS_RECEIPT_MASTER'
GO
