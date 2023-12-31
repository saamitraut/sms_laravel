USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_TAX_MASTER]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_TAX_MASTER](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TaxTitle] [varchar](150) NOT NULL,
	[TaxCode] [varchar](50) NOT NULL,
	[TaxValue] [float] NOT NULL,
	[IsInAmount] [bit] NOT NULL,
	[ParentTaxId] [bigint] NOT NULL,
	[ApplicableOn] [varchar](50) NULL,
	[Description] [varchar](250) NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SMS_TAX_MASTER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_TAX_MASTER] ADD  CONSTRAINT [DF_SMS_TAX_MASTER_IsInAmount]  DEFAULT ((0)) FOR [IsInAmount]
GO
ALTER TABLE [dbo].[SMS_TAX_MASTER] ADD  CONSTRAINT [DF_SMS_TAX_MASTER_ParentTaxId]  DEFAULT ((0)) FOR [ParentTaxId]
GO
ALTER TABLE [dbo].[SMS_TAX_MASTER] ADD  CONSTRAINT [DF_SMS_TAX_MASTER_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_TAX_MASTER] ADD  CONSTRAINT [DF_SMS_TAX_MASTER_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-In Percent
1-In Amount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_TAX_MASTER', @level2type=N'COLUMN',@level2name=N'IsInAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Subscription Charge
2-Hardware Chage
3-Installation Charge' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_TAX_MASTER', @level2type=N'COLUMN',@level2name=N'ApplicableOn'
GO
