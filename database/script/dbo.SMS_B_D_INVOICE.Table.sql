USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_B_D_INVOICE]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_B_D_INVOICE](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[HSubscriberId] [bigint] NOT NULL,
	[HSubscriberDetailId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[HAccountId] [bigint] NOT NULL,
	[HPairingId] [bigint] NOT NULL,
	[SchemeId] [bigint] NOT NULL,
	[ApplicableRate] [bit] NOT NULL,
	[BillNo] [varchar](50) NOT NULL,
	[BillMonthYear] [date] NOT NULL,
	[BillDate] [date] NOT NULL,
	[BillDueDate] [date] NOT NULL,
	[BasicCharge] [float] NOT NULL,
	[PayPackageCharge] [float] NOT NULL,
	[AddtionalCharges] [float] NOT NULL,
	[CurrentCharges] [float] NOT NULL,
	[TaxAmount] [float] NOT NULL,
	[CurrentAmount] [float] NOT NULL,
	[AdvancePaid] [float] NOT NULL,
	[CreditCharges] [float] NOT NULL,
	[DiscountCharges] [float] NOT NULL,
	[ExtraPayments] [float] NOT NULL,
	[LastBillId] [bigint] NOT NULL,
	[LastBillDue] [float] NOT NULL,
	[LastBillAmount] [float] NOT NULL,
	[LastPayments] [float] NOT NULL,
	[LastPaymentId] [bigint] NOT NULL,
	[LastAdvanceBalance] [float] NOT NULL,
	[BillAmount] [float] NOT NULL,
	[BillgenLogId] [bigint] NOT NULL,
	[BillGenSession] [int] NOT NULL,
	[NextBillId] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[LastCollectionId] [bigint] NOT NULL,
	[LastCollectionAmount] [float] NOT NULL,
	[creditAmount] [float] NOT NULL,
	[creditId] [bigint] NOT NULL,
 CONSTRAINT [PK_SMS_B_D_INVOICE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SMS_B_D_INVOICE]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [IX_SMS_B_D_INVOICE] UNIQUE NONCLUSTERED 
(
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SMS_B_D_INVOICE_1]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [IX_SMS_B_D_INVOICE_1] UNIQUE NONCLUSTERED 
(
	[AccountId] ASC,
	[BillMonthYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_SubscriberId]  DEFAULT ((0)) FOR [SubscriberId]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_HSubscriberId]  DEFAULT ((0)) FOR [HSubscriberId]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_HSubscriberDetailId]  DEFAULT ((0)) FOR [HSubscriberDetailId]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_HAccountId]  DEFAULT ((0)) FOR [HAccountId]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_HPairingId]  DEFAULT ((0)) FOR [HPairingId]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_SchemeId]  DEFAULT ((0)) FOR [SchemeId]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_ApplicableRate]  DEFAULT ((1)) FOR [ApplicableRate]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_BasicCharge]  DEFAULT ((0)) FOR [BasicCharge]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_PayPackageCharge]  DEFAULT ((0)) FOR [PayPackageCharge]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_AddtionalCharges]  DEFAULT ((0)) FOR [AddtionalCharges]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_CurrentCharges]  DEFAULT ((0)) FOR [CurrentCharges]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_TaxAmount]  DEFAULT ((0)) FOR [TaxAmount]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_CurrentAmount]  DEFAULT ((0)) FOR [CurrentAmount]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_AdvancePaid]  DEFAULT ((0)) FOR [AdvancePaid]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_CreditCharges]  DEFAULT ((0)) FOR [CreditCharges]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_DiscountCharges]  DEFAULT ((0)) FOR [DiscountCharges]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_ExtraPayments]  DEFAULT ((0)) FOR [ExtraPayments]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_LastBillId]  DEFAULT ((0)) FOR [LastBillId]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_LastBillDue]  DEFAULT ((0)) FOR [LastBillDue]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_LastBillAmount]  DEFAULT ((0)) FOR [LastBillAmount]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_LastPayments]  DEFAULT ((0)) FOR [LastPayments]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_LastPaymentId]  DEFAULT ((0)) FOR [LastPaymentId]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_LastAdvanceBalance]  DEFAULT ((0)) FOR [LastAdvanceBalance]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_BillAmount]  DEFAULT ((0)) FOR [BillAmount]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_BillgenLogId]  DEFAULT ((0)) FOR [BillgenLogId]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_BillGenSession]  DEFAULT ((0)) FOR [BillGenSession]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_NextBillId]  DEFAULT ((0)) FOR [NextBillId]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_LastCollectionId]  DEFAULT ((0)) FOR [LastCollectionId]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_LastCollectionAmount]  DEFAULT ((0)) FOR [LastCollectionAmount]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_creditAmount]  DEFAULT ((0)) FOR [creditAmount]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE] ADD  CONSTRAINT [DF_SMS_B_D_INVOICE_creditId]  DEFAULT ((0)) FOR [creditId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-First Rate
0-Second Rate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_B_D_INVOICE', @level2type=N'COLUMN',@level2name=N'ApplicableRate'
GO
