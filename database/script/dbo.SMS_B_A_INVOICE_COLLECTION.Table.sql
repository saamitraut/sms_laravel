USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_B_A_INVOICE_COLLECTION]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_B_A_INVOICE_COLLECTION](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[InvoiceId] [bigint] NOT NULL,
	[Amount] [float] NOT NULL,
	[PaymentMode] [bit] NOT NULL,
	[RecieptNo] [varchar](50) NULL,
	[CollectionDate] [date] NOT NULL,
	[ColletedBy] [varchar](50) NULL,
	[Description] [varchar](250) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SMS_B_A_INVOICE_COLLECTION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_B_A_INVOICE_COLLECTION] ADD  CONSTRAINT [DF_SMS_B_A_INVOICE_COLLECTION_PaymentMode]  DEFAULT ((0)) FOR [PaymentMode]
GO
ALTER TABLE [dbo].[SMS_B_A_INVOICE_COLLECTION] ADD  CONSTRAINT [DF_SMS_B_A_INVOICE_COLLECTION_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Cash
1-Cheque' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_B_A_INVOICE_COLLECTION', @level2type=N'COLUMN',@level2name=N'PaymentMode'
GO
