USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_FILEUPLOADLOG]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_FILEUPLOADLOG](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UploadFor] [tinyint] NOT NULL,
	[OriginalFilename] [varchar](100) NOT NULL,
	[SavedFilePathName] [varchar](800) NULL,
	[UploadLogFilePathName] [varchar](800) NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[StartedOn] [datetime] NOT NULL,
	[EndedOn] [datetime] NULL,
	[FileSize] [int] NOT NULL,
	[TotalRecords] [int] NOT NULL,
	[SucessRecord] [int] NOT NULL,
	[ErrorRecord] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
 CONSTRAINT [PK_SMS_FILEUPLOADLOG] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_FILEUPLOADLOG] ON 

INSERT [dbo].[SMS_FILEUPLOADLOG] ([Id], [UploadFor], [OriginalFilename], [SavedFilePathName], [UploadLogFilePathName], [InsertedOn], [InsertedBy], [StartedOn], [EndedOn], [FileSize], [TotalRecords], [SucessRecord], [ErrorRecord], [BrandId]) VALUES (1, 1, N'SC.txt', NULL, N'SC_1', CAST(N'2022-08-29T16:36:23.823' AS DateTime), 1, CAST(N'2022-08-29T16:36:23.823' AS DateTime), CAST(N'2022-08-29T16:36:24.123' AS DateTime), 1708, 95, 93, 2, 1)
INSERT [dbo].[SMS_FILEUPLOADLOG] ([Id], [UploadFor], [OriginalFilename], [SavedFilePathName], [UploadLogFilePathName], [InsertedOn], [InsertedBy], [StartedOn], [EndedOn], [FileSize], [TotalRecords], [SucessRecord], [ErrorRecord], [BrandId]) VALUES (2, 2, N'stb.txt', NULL, N'STB_2', CAST(N'2022-08-29T16:37:03.340' AS DateTime), 1, CAST(N'2022-08-29T16:37:03.340' AS DateTime), CAST(N'2022-08-29T16:37:03.637' AS DateTime), 1518, 95, 93, 2, 2)
INSERT [dbo].[SMS_FILEUPLOADLOG] ([Id], [UploadFor], [OriginalFilename], [SavedFilePathName], [UploadLogFilePathName], [InsertedOn], [InsertedBy], [StartedOn], [EndedOn], [FileSize], [TotalRecords], [SucessRecord], [ErrorRecord], [BrandId]) VALUES (3, 3, N'stb.txt', N'E:/xampp/htdocs/MNSMS/uploaded_files/uploads/PAIRING_3.txt', N'PR_3', CAST(N'2022-08-29T16:40:42.590' AS DateTime), 1, CAST(N'2022-08-29T16:40:42.590' AS DateTime), CAST(N'2022-08-29T16:40:42.730' AS DateTime), 3133, 95, 93, 2, 0)
SET IDENTITY_INSERT [dbo].[SMS_FILEUPLOADLOG] OFF
GO
ALTER TABLE [dbo].[SMS_FILEUPLOADLOG] ADD  CONSTRAINT [DF_SMS_FILEUPLOADLOG_InsertedOn]  DEFAULT (getdate()) FOR [InsertedOn]
GO
ALTER TABLE [dbo].[SMS_FILEUPLOADLOG] ADD  CONSTRAINT [DF_SMS_FILEUPLOADLOG_StartedOn]  DEFAULT (getdate()) FOR [StartedOn]
GO
ALTER TABLE [dbo].[SMS_FILEUPLOADLOG] ADD  CONSTRAINT [DF_SMS_FILEUPLOADLOG_FileSize]  DEFAULT ((0)) FOR [FileSize]
GO
ALTER TABLE [dbo].[SMS_FILEUPLOADLOG] ADD  CONSTRAINT [DF_SMS_FILEUPLOADLOG_TotalRecords]  DEFAULT ((0)) FOR [TotalRecords]
GO
ALTER TABLE [dbo].[SMS_FILEUPLOADLOG] ADD  CONSTRAINT [DF_SMS_FILEUPLOADLOG_SucessRecord]  DEFAULT ((0)) FOR [SucessRecord]
GO
ALTER TABLE [dbo].[SMS_FILEUPLOADLOG] ADD  CONSTRAINT [DF_SMS_FILEUPLOADLOG_ErrorRecord]  DEFAULT ((0)) FOR [ErrorRecord]
GO
ALTER TABLE [dbo].[SMS_FILEUPLOADLOG] ADD  CONSTRAINT [DF_SMS_FILEUPLOADLOG_BrandId]  DEFAULT ((0)) FOR [BrandId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Smartcard Upload
2=STB Upload
3=Subscriber Upload' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SMS_FILEUPLOADLOG', @level2type=N'COLUMN',@level2name=N'UploadFor'
GO
