USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_D_PAYMENTCREDIT_ENTRIES_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_D_PAYMENTCREDIT_ENTRIES_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[CreditId] [bigint] NOT NULL,
	[MonthYear] [date] NOT NULL,
	[Amount] [float] NOT NULL,
	[isAdjusted] [bit] NOT NULL,
	[InvoiceId] [bigint] NOT NULL,
	[AdjustedOn] [datetime] NULL,
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
 CONSTRAINT [PK_SMS_D_PAYMENTCREDIT_ENTRIES_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_D_PAYMENTCREDIT_ENTRIES_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SMS_D_PAYMENTCREDIT_ENTRIES_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO
