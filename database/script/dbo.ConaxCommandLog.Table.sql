USE [MNSMS]
GO
/****** Object:  Table [dbo].[ConaxCommandLog]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConaxCommandLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CommandName] [varchar](250) NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[SmartcardNo] [varchar](50) NOT NULL,
	[STBNo] [varchar](50) NOT NULL,
	[PackageId] [varchar](50) NULL,
	[AlacarteId] [varchar](50) NULL,
	[ProductCode] [varchar](10) NULL,
	[ActivationDate] [datetime] NULL,
	[DeactivationDate] [datetime] NULL,
	[Request] [text] NULL,
	[Response] [text] NULL,
	[Result] [varchar](10) NULL,
	[StatusCode] [int] NOT NULL,
	[TransId] [varchar](250) NULL,
	[Description] [varchar](250) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CommandDate] [datetime] NOT NULL,
	[ConnaxFileLogId] [int] NOT NULL,
 CONSTRAINT [PK_ConaxCommandLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConaxCommandLog] ADD  CONSTRAINT [DF_ConaxCommandLog_StatusCode]  DEFAULT ((0)) FOR [StatusCode]
GO
ALTER TABLE [dbo].[ConaxCommandLog] ADD  CONSTRAINT [DF_ConaxCommandLog_CommandDate]  DEFAULT (getdate()) FOR [CommandDate]
GO
ALTER TABLE [dbo].[ConaxCommandLog] ADD  DEFAULT ((0)) FOR [ConnaxFileLogId]
GO
