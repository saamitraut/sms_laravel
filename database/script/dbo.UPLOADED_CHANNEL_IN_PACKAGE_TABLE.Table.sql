USE [MNSMS]
GO
/****** Object:  Table [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[PackageName] [varchar](150) NULL,
	[CascodeCatvision] [varchar](150) NOT NULL,
	[ServiceId] [varchar](150) NOT NULL,
	[STATUS] [int] NULL,
	[STATUS_REMARK] [varchar](8000) NULL,
	[SESSION_ID] [bigint] NULL,
 CONSTRAINT [PK_UPLOADED_CHANNEL_IN_PACKAGE_TABLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ON 

INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (1, NULL, N'00001', N'11601', NULL, N'Uploaded Successfully', 12)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (2, NULL, N'00001', N'11601', NULL, N'Uploaded Successfully', 13)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10002, NULL, N'00003', N'10704', NULL, N'Uploaded Successfully', 20019)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10003, NULL, N'00003', N'10706', NULL, N'Uploaded Successfully', 20019)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10004, NULL, N'00003', N'10709', NULL, N'Uploaded Successfully', 20019)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10005, NULL, N'00003', N'10705', NULL, N'Uploaded Successfully', 20019)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10006, NULL, N'00003', N'11209', NULL, N'Uploaded Successfully', 20019)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10007, NULL, N'00003', N'10801', NULL, N'Uploaded Successfully', 20019)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10008, NULL, N'00003', N'11106', NULL, N'Uploaded Successfully', 20019)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10009, NULL, N'00003', N'11204', NULL, N'Uploaded Successfully', 20019)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10010, NULL, N'00003', N'11203', NULL, N'Uploaded Successfully', 20019)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10011, NULL, N'00003', N'10806', NULL, N'Uploaded Successfully', 20019)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10012, NULL, N'00003', N'11202', NULL, N'Uploaded Successfully', 20019)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10013, NULL, N'00003', N'10704', NULL, N'Uploaded Successfully', 20020)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10014, NULL, N'00003', N'10706', NULL, N'Uploaded Successfully', 20020)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10015, NULL, N'00003', N'10709', NULL, N'Uploaded Successfully', 20020)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10016, NULL, N'00003', N'10705', NULL, N'Uploaded Successfully', 20020)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10017, NULL, N'00003', N'11209', NULL, N'Uploaded Successfully', 20020)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10018, NULL, N'00003', N'10801', NULL, N'Uploaded Successfully', 20020)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10019, NULL, N'00003', N'11106', NULL, N'Uploaded Successfully', 20020)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10020, NULL, N'00003', N'11204', NULL, N'Uploaded Successfully', 20020)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10021, NULL, N'00003', N'11203', NULL, N'Uploaded Successfully', 20020)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10022, NULL, N'00003', N'10806', NULL, N'Uploaded Successfully', 20020)
INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] ([id], [PackageName], [CascodeCatvision], [ServiceId], [STATUS], [STATUS_REMARK], [SESSION_ID]) VALUES (10023, NULL, N'00003', N'11202', NULL, N'Uploaded Successfully', 20020)
SET IDENTITY_INSERT [dbo].[UPLOADED_CHANNEL_IN_PACKAGE_TABLE] OFF
GO
