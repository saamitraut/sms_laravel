USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_RECEIPT_MASTER_HISTORY]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_RECEIPT_MASTER_HISTORY](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FID] [bigint] NOT NULL,
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
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
	[PreviousId] [bigint] NOT NULL,
	[DMLAction] [tinyint] NOT NULL,
	[DMLComments] [varchar](8000) NULL,
 CONSTRAINT [PK_SMS_RECEIPT_MASTER_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_RECEIPT_MASTER_HISTORY] ADD  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SMS_RECEIPT_MASTER_HISTORY] ADD  DEFAULT ((0)) FOR [PreviousId]
GO
