USE [MNSMS]
GO
/****** Object:  Table [dbo].[LatensCommandLog]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LatensCommandLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ComandName] [varchar](60) NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[StbId] [bigint] NOT NULL,
	[StbProvisionId] [bigint] NOT NULL,
	[PackageId] [bigint] NOT NULL,
	[IsAlacarte] [bit] NOT NULL,
	[XMLRequest] [xml] NULL,
	[XMLResponse] [xml] NULL,
	[Result] [varchar](50) NULL,
	[ErrorCode] [int] NULL,
	[SubErrorCode] [int] NULL,
	[MgrType] [varchar](50) NULL,
	[SubType] [varchar](150) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[InsertedFrom] [varchar](150) NULL,
	[Flag] [char](1) NOT NULL,
	[SentToCas] [bit] NOT NULL,
	[ErrDescp] [varchar](250) NULL,
 CONSTRAINT [PK_DTHT_LatensCommandLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[LatensCommandLog] ADD  CONSTRAINT [DF_LatensCommandLog_SubscriberId]  DEFAULT ((0)) FOR [SubscriberId]
GO
ALTER TABLE [dbo].[LatensCommandLog] ADD  CONSTRAINT [DF_LatensCommandLog_AccountId]  DEFAULT ((0)) FOR [AccountId]
GO
ALTER TABLE [dbo].[LatensCommandLog] ADD  CONSTRAINT [DF_LatensCommandLog_StbId]  DEFAULT ((0)) FOR [StbId]
GO
ALTER TABLE [dbo].[LatensCommandLog] ADD  CONSTRAINT [DF_LatensCommandLog_StbProvisionId]  DEFAULT ((0)) FOR [StbProvisionId]
GO
ALTER TABLE [dbo].[LatensCommandLog] ADD  CONSTRAINT [DF_LatensCommandLog_PackageId]  DEFAULT ((0)) FOR [PackageId]
GO
ALTER TABLE [dbo].[LatensCommandLog] ADD  CONSTRAINT [DF_LatensCommandLog_IsAlacarte]  DEFAULT ((0)) FOR [IsAlacarte]
GO
ALTER TABLE [dbo].[LatensCommandLog] ADD  CONSTRAINT [DF_DTHT_LatensCommandLog_Flag]  DEFAULT ('S') FOR [Flag]
GO
ALTER TABLE [dbo].[LatensCommandLog] ADD  CONSTRAINT [DF_DTHT_LatensCommandLog_SentToCas]  DEFAULT ((0)) FOR [SentToCas]
GO
