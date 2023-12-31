USE [MNSMS]
GO
/****** Object:  Table [dbo].[PG_LOG_DETAILS]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PG_LOG_DETAILS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WapId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[RequestId] [varchar](100) NOT NULL,
	[PaymentType] [varchar](50) NULL,
	[LogType] [varchar](100) NOT NULL,
	[LogDesc] [text] NULL,
	[AddedOn] [datetime] NULL,
	[Status] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PG_LOG_DETAILS] ADD  DEFAULT ((1)) FOR [Status]
GO
