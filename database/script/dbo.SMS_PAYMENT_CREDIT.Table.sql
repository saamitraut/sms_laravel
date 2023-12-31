USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_PAYMENT_CREDIT]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_PAYMENT_CREDIT](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[ServiceType] [bit] NOT NULL,
	[Amount] [float] NOT NULL,
	[ReceiptId] [bigint] NOT NULL,
	[ReasonId] [bigint] NOT NULL,
	[IsAdjusted] [bit] NOT NULL,
	[InvoiceId] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Createdby] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SMS_PAYMENT_CREDIT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_PAYMENT_CREDIT] ADD  CONSTRAINT [DF_SMS_PAYMENT_CREDIT_SubscriberId]  DEFAULT ((0)) FOR [SubscriberId]
GO
ALTER TABLE [dbo].[SMS_PAYMENT_CREDIT] ADD  CONSTRAINT [DF_SMS_PAYMENT_CREDIT_AccountId]  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[SMS_PAYMENT_CREDIT] ADD  CONSTRAINT [DF_SMS_PAYMENT_CREDIT_ServiceType]  DEFAULT ((0)) FOR [ServiceType]
GO
ALTER TABLE [dbo].[SMS_PAYMENT_CREDIT] ADD  CONSTRAINT [DF_SMS_PAYMENT_CREDIT_IsAdjusted]  DEFAULT ((0)) FOR [IsAdjusted]
GO
ALTER TABLE [dbo].[SMS_PAYMENT_CREDIT] ADD  CONSTRAINT [DF_SMS_PAYMENT_CREDIT_InvoiceId]  DEFAULT ((0)) FOR [InvoiceId]
GO
ALTER TABLE [dbo].[SMS_PAYMENT_CREDIT] ADD  CONSTRAINT [DF_SMS_PAYMENT_CREDIT_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SMS_PAYMENT_CREDIT] ADD  CONSTRAINT [DF_SMS_PAYMENT_CREDIT_Remark]  DEFAULT ((0)) FOR [Remark]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Analog Account
1-Digital Account' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_PAYMENT_CREDIT', @level2type=N'COLUMN',@level2name=N'ServiceType'
GO
