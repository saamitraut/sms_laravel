USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_SUBSCRIBEREXTRACHARGES]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_SUBSCRIBEREXTRACHARGES](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SubscriberId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[AmountRaised] [float] NOT NULL,
	[ReasonID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SMS_Subscriberpayment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBEREXTRACHARGES] ADD  CONSTRAINT [DF_SMS_Subscriberpayment_AccountId]  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBEREXTRACHARGES] ADD  CONSTRAINT [DF_SMS_Subscriberpayment_AmountPaid]  DEFAULT ((0)) FOR [AmountRaised]
GO
ALTER TABLE [dbo].[SMS_SUBSCRIBEREXTRACHARGES] ADD  CONSTRAINT [DF_SMS_Subscriberpayment_Status]  DEFAULT ((0)) FOR [Status]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=>Payment against Subscriber else Against Subscriber Accounts' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_SUBSCRIBEREXTRACHARGES', @level2type=N'COLUMN',@level2name=N'AccountId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=> Unbilled 1=>Billed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_SUBSCRIBEREXTRACHARGES', @level2type=N'COLUMN',@level2name=N'Status'
GO
