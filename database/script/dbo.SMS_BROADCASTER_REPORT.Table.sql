USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_BROADCASTER_REPORT]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_BROADCASTER_REPORT](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BroadcasterId] [bigint] NOT NULL,
	[BroadcasterName] [varchar](150) NOT NULL,
	[RepMonth] [date] NOT NULL,
	[Package_Channel_Id] [bigint] NOT NULL,
	[Package_Channel_Name] [varchar](250) NOT NULL,
	[ChannelCount] [int] NOT NULL,
	[PayChannelCnt] [int] NOT NULL,
	[Opening] [int] NOT NULL,
	[Closing] [int] NOT NULL,
	[Average] [int] NOT NULL,
	[Price1] [float] NOT NULL,
	[Price2] [float] NOT NULL,
	[BRate] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[IsAlacarte] [bigint] NOT NULL,
	[IsHD] [bit] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Channels] [text] NULL,
	[PayChannels] [text] NULL,
	[CREATEDON] [datetime] NOT NULL,
	[UPDATEDON] [datetime] NULL,
	[CREATEDBY] [bigint] NOT NULL,
	[UPDATEDBY] [bigint] NULL,
	[Deleted] [bigint] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SMS_BROADCASTER_REPORT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_SMS_BROADCASTER_REPORT]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[SMS_BROADCASTER_REPORT] ADD  CONSTRAINT [IX_SMS_BROADCASTER_REPORT] UNIQUE NONCLUSTERED 
(
	[BroadcasterId] ASC,
	[RepMonth] ASC,
	[Package_Channel_Id] ASC,
	[IsAlacarte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_BROADCASTER_REPORT] ADD  CONSTRAINT [DF_SMS_BROADCASTER_REPORT_ChannelCont]  DEFAULT ((0)) FOR [ChannelCount]
GO
ALTER TABLE [dbo].[SMS_BROADCASTER_REPORT] ADD  CONSTRAINT [DF_SMS_BROADCASTER_REPORT_IsAlacarte]  DEFAULT ((0)) FOR [IsAlacarte]
GO
ALTER TABLE [dbo].[SMS_BROADCASTER_REPORT] ADD  CONSTRAINT [DF_SMS_BROADCASTER_REPORT_IsHD]  DEFAULT ((0)) FOR [IsHD]
GO
ALTER TABLE [dbo].[SMS_BROADCASTER_REPORT] ADD  CONSTRAINT [DF_SMS_BROADCASTER_REPORT_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_BROADCASTER_REPORT', @level2type=N'COLUMN',@level2name=N'ChannelCount'
GO
