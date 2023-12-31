USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_STBUPLOAD]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_STBUPLOAD](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[STBNO] [varchar](50) NOT NULL,
	[MACADDR] [varchar](50) NULL,
	[UpLogId] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
	[Remark] [varchar](150) NULL,
	[InsertedOn] [datetime] NOT NULL,
	[CHIPID] [varchar](50) NULL,
 CONSTRAINT [PK_SMS_STBUPLOAD] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_STBUPLOAD] ON 

INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (1, N'23117160000787', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.347' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (2, N'23118370000641', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.350' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (3, N'23117080033876', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.353' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (4, N'23117080039808', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.357' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (5, N'23117160000647', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.360' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (6, N'23117160004011', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.360' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (7, N'23117080032746', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.363' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (8, N'23118370007315', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.367' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (9, N'23117080055960', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.370' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (10, N'23117080032316', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.370' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (11, N'23117160002445', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.373' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (12, N'23117080035400', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.377' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (13, N'23117080054351', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.380' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (14, N'23117080032514', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.380' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (15, N'23118370000401', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.383' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (16, N'23117080032902', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.387' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (17, N'23117080044451', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.390' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (18, N'23117080038933', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.393' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (19, N'23117080032142', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.393' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (20, N'23117170092691', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.397' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (21, N'23117160003807', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.400' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (22, N'23117170093046', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.403' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (23, N'23117160003419', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.407' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (24, N'23117170093244', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.410' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (25, N'23118370007406', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.410' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (26, N'23117160004979', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.413' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (27, N'23117160001173', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.417' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (28, N'23118370007380', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.420' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (29, N'23117080031656', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.423' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (30, N'23117170093251', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.423' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (31, N'23117080034841', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.427' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (32, N'23117080053056', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.430' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (33, N'23118370007240', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.433' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (34, N'23117160004789', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.437' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (35, N'23117080033199', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.437' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (36, N'23118370000518', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.440' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (37, N'23117160001843', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.443' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (38, N'23117080034163', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.447' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (39, N'23118370007273', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.447' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (40, N'23117080033843', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.450' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (41, N'23117160002353', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.453' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (42, N'23117080033512', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.453' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (43, N'23117160004649', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.457' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (44, N'23117080034601', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.460' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (45, N'23117170093020', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.463' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (46, N'23117080034635', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.467' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (47, N'23117080031714', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.467' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (48, N'23117160002767', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.470' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (49, N'23118370000450', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.473' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (50, N'23117160000209', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.477' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (51, N'23118370007257', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.477' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (52, N'23117080038594', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.480' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (53, N'23118370000534', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.483' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (54, N'23117160004045', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.487' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (55, N'23117160003203', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.490' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (56, N'23117080045136', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.490' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (57, N'23117080034239', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.493' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (58, N'23117080052736', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.497' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (59, N'23117170093442', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.500' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (60, N'23117160000381', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.500' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (61, N'23118370000674', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.503' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (62, N'23117080056679', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.507' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (63, N'23118370007356', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.510' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (64, N'23117080033389', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.510' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (65, N'23117080045920', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.513' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (66, N'23117160004375', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.517' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (67, N'23117160000555', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.517' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (68, N'23117080034676', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.520' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (69, N'23117080031243', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.523' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (70, N'23117080031565', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.523' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (71, N'23117080031649', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.527' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (72, N'23117080032480', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.530' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (73, N'23117160003096', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.533' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (74, N'23117160000613', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.537' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (75, N'23117080033231', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.540' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (76, N'23117160000985', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.540' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (77, N'23118370007299', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.543' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (78, N'23117160001488', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.547' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (79, N'23117080054047', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.547' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (80, N'23117160002031', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.550' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (81, N'23117080054690', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.553' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (82, N'23118370007372', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.557' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (83, N'23117080042398', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.560' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (84, N'23117080051167', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.560' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (85, N'23118370007414', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.563' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (86, N'23117080034825', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.567' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (87, N'23118370007364', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.570' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (88, N'23117080030666', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.570' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (89, N'23118370007323', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.573' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (90, N'23117080035178', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.577' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (91, N'23117160003914', NULL, 2, 0, N'STB Already Exists', CAST(N'2022-08-29T16:37:03.580' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (92, N'23117080032852', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.580' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (93, N'23117160004078', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.583' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (94, N'23117080032522', NULL, 2, 1, N'true', CAST(N'2022-08-29T16:37:03.587' AS DateTime), NULL)
INSERT [dbo].[SMS_STBUPLOAD] ([Id], [STBNO], [MACADDR], [UpLogId], [Status], [Remark], [InsertedOn], [CHIPID]) VALUES (95, N'23117080035152', NULL, 2, 0, N'STB Already Exists', CAST(N'2022-08-29T16:37:03.590' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SMS_STBUPLOAD] OFF
GO
ALTER TABLE [dbo].[SMS_STBUPLOAD] ADD  CONSTRAINT [DF_SMS_STBUPLOAD_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_STBUPLOAD] ADD  CONSTRAINT [DF_SMS_STBUPLOAD_InsertedOn]  DEFAULT (getdate()) FOR [InsertedOn]
GO
