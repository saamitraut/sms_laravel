USE [MNSMS]
GO
/****** Object:  Table [dbo].[ConnaxFileLog]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConnaxFileLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[filenname] [varchar](550) NOT NULL,
	[Status] [int] NOT NULL,
	[TransactionId] [varchar](2000) NOT NULL,
	[Actiondate] [datetime] NOT NULL,
	[Filestatus] [int] NOT NULL,
 CONSTRAINT [PK_ConnaxFileLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConnaxFileLog] ADD  CONSTRAINT [DF_ConnaxFileLog_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[ConnaxFileLog] ADD  CONSTRAINT [DF_ConnaxFileLog_Actiondate]  DEFAULT (getdate()) FOR [Actiondate]
GO
ALTER TABLE [dbo].[ConnaxFileLog] ADD  CONSTRAINT [DF_ConnaxFileLog_Filestatus]  DEFAULT ((0)) FOR [Filestatus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=>file created 1=>file uploaded in ftp 2=>response downloaded from ftp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConnaxFileLog', @level2type=N'COLUMN',@level2name=N'Status'
GO
