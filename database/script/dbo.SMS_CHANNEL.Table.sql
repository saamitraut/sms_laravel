USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_CHANNEL]    Script Date: 2023-11-10 06:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_CHANNEL](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ChannelName] [varchar](150) NOT NULL,
	[CasCodeGospel] [int] NOT NULL,
	[CasCode] [int] NOT NULL,
	[LogoExt] [varchar](6) NOT NULL,
	[Price] [float] NOT NULL,
	[Price2] [float] NOT NULL,
	[BillingCycle] [int] NOT NULL,
	[BroadcasterId] [bigint] NOT NULL,
	[BRate] [float] NOT NULL,
	[CategoryId] [bigint] NOT NULL,
	[ChannelType] [bit] NOT NULL,
	[IsAlacarte] [bit] NOT NULL,
	[Description] [varchar](250) NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Deleted] [bigint] NOT NULL,
	[Remark] [varchar](250) NULL,
	[sms_id] [bigint] NULL,
	[TSIDGospel] [varchar](50) NULL,
	[TSID] [varchar](50) NULL,
	[CasCodeTelelynx] [varchar](50) NULL,
	[PcrId] [varchar](20) NULL,
	[ComponentPidAudio] [varchar](20) NULL,
	[ComponentPidVideo] [varchar](20) NULL,
	[SymbolRate] [varchar](20) NULL,
	[EcmPidAudio] [varchar](20) NULL,
	[EcmPidVideo] [varchar](20) NULL,
	[QAM] [varchar](20) NULL,
	[Serviceid] [varchar](20) NULL,
	[Frequency] [varchar](20) NULL,
	[CasCodeNSTV] [varchar](50) NULL,
	[CasCodeKingvon] [varchar](50) NULL,
	[CasCodeCatVision] [varchar](50) NULL,
	[CasCodeBCas] [varchar](50) NULL,
	[LCNNO] [varchar](20) NULL,
 CONSTRAINT [PK_SMS_CHANNEL] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  CONSTRAINT [DF_SMS_CHANNEL_CasCodeGospel]  DEFAULT ((0)) FOR [CasCodeGospel]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  CONSTRAINT [DF_SMS_CHANNEL_CasCode]  DEFAULT ((0)) FOR [CasCode]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  CONSTRAINT [DF_SMS_CHANNEL_ImageId]  DEFAULT ((0)) FOR [LogoExt]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  CONSTRAINT [DF_SMS_CHANNEL_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  CONSTRAINT [DF_SMS_CHANNEL_Price2]  DEFAULT ((0)) FOR [Price2]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  CONSTRAINT [DF_SMS_CHANNEL_BillingCycle]  DEFAULT ((1)) FOR [BillingCycle]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  CONSTRAINT [DF_SMS_CHANNEL_BroadcasterId]  DEFAULT ((0)) FOR [BroadcasterId]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  CONSTRAINT [DF_SMS_CHANNEL_BRate]  DEFAULT ((0)) FOR [BRate]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  CONSTRAINT [DF_SMS_CHANNEL_CategoryId]  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  CONSTRAINT [DF_SMS_CHANNEL_ChannelType]  DEFAULT ((0)) FOR [ChannelType]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  CONSTRAINT [DF_SMS_CHANNEL_IsAlacarte]  DEFAULT ((0)) FOR [IsAlacarte]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  CONSTRAINT [DF_SMS_CHANNEL_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  CONSTRAINT [DF_SMS_CHANNEL_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SMS_CHANNEL] ADD  DEFAULT (NULL) FOR [CasCodeBCas]
GO
ALTER TABLE [dbo].[SMS_CHANNEL]  WITH NOCHECK ADD  CONSTRAINT [FK_SMS_CHANNEL_SMS_BROADCASTER] FOREIGN KEY([BroadcasterId])
REFERENCES [dbo].[SMS_BROADCASTER] ([ID])
GO
ALTER TABLE [dbo].[SMS_CHANNEL] CHECK CONSTRAINT [FK_SMS_CHANNEL_SMS_BROADCASTER]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bill Cycle Month
1-every month
2-every second month
3-quaterly
6-Half Yearly
12-Yearly' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_CHANNEL', @level2type=N'COLUMN',@level2name=N'BillingCycle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-SD
1-HD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_CHANNEL', @level2type=N'COLUMN',@level2name=N'ChannelType'
GO
