USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_PAYMENT]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_PAYMENT](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[Amount] [float] NOT NULL,
	[ReceiptId] [bigint] NOT NULL,
	[ReasonId] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Createdby] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[InvoiceId] [bigint] NOT NULL,
	[Description] [varchar](250) NULL,
	[ServiceType] [bit] NOT NULL,
	[IsAdjusted] [bit] NOT NULL,
	[REASON] [varchar](250) NULL,
 CONSTRAINT [PK_SMS_PAYMENT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_PAYMENT] ADD  CONSTRAINT [DF_SMS_PAYMENT_SubscriberId]  DEFAULT ((0)) FOR [SubscriberId]
GO
ALTER TABLE [dbo].[SMS_PAYMENT] ADD  CONSTRAINT [DF_SMS_PAYMENT_AccountId]  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[SMS_PAYMENT] ADD  CONSTRAINT [DF_SMS_PAYMENT_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SMS_PAYMENT] ADD  CONSTRAINT [DF_SMS_PAYMENT_InvoiceId]  DEFAULT ((0)) FOR [InvoiceId]
GO
ALTER TABLE [dbo].[SMS_PAYMENT] ADD  CONSTRAINT [DF_SMS_PAYMENT_ServiceType]  DEFAULT ((0)) FOR [ServiceType]
GO
ALTER TABLE [dbo].[SMS_PAYMENT] ADD  CONSTRAINT [DF_SMS_PAYMENT_IsAdjusted]  DEFAULT ((0)) FOR [IsAdjusted]
GO
