USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_B_D_INVOICE_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_B_D_INVOICE_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Fid] [bigint] NOT NULL,
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
	[NextBillId] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SMS_B_D_INVOICE_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SMS_B_D_INVOICE_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO
