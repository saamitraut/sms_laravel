USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_BROADCASTER_REPORT_CHANNEL]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_BROADCASTER_REPORT_CHANNEL](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BroadcasterId] [bigint] NOT NULL,
	[BroadcasterName] [varchar](150) NOT NULL,
	[RepMonth] [date] NOT NULL,
	[Channel_Id] [bigint] NOT NULL,
	[Channel_Name] [varchar](250) NOT NULL,
	[PackageCount] [int] NULL,
	[Package_Names] [text] NULL,
	[Opening] [int] NOT NULL,
	[Closing] [int] NOT NULL,
	[Average] [int] NOT NULL,
	[Price1] [float] NULL,
	[Price2] [float] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Remark] [varchar](250) NULL,
	[Deleted] [bigint] NOT NULL,
 CONSTRAINT [PK_SMS_BROADCASTER_REPORT_CHANNEL] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMS_BROADCASTER_REPORT_CHANNEL] ADD  CONSTRAINT [DF_SMS_BROADCASTER_REPORT_CHANNEL_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
