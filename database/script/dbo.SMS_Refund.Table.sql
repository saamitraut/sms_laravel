USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_Refund]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_Refund](
	[ID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[Amount] [float] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Remark] [varchar](250) NULL,
	[IsRefundedBy] [int] NULL,
	[IsRefundedOn] [datetime] NULL,
	[Receiptno] [varchar](50) NULL,
	[ReceiptDate] [date] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SMS_Refund] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_Refund] ADD  CONSTRAINT [DF_SMS_Refund_ReceiptDate]  DEFAULT (getdate()) FOR [ReceiptDate]
GO
ALTER TABLE [dbo].[SMS_Refund] ADD  CONSTRAINT [DF_SMS_Refund_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=>Refunded 0=>nonRefunded' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_Refund', @level2type=N'COLUMN',@level2name=N'Status'
GO
