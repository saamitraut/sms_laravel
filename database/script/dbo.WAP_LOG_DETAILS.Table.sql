USE [MNSMS]
GO
/****** Object:  Table [dbo].[WAP_LOG_DETAILS]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WAP_LOG_DETAILS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WapId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[OperatorId] [int] NULL,
	[RequestId] [int] NULL,
	[LogType] [int] NOT NULL,
	[Description] [text] NULL,
	[AddedOn] [datetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[WAP_LOG_DETAILS] ADD  DEFAULT ((1)) FOR [Status]
GO
