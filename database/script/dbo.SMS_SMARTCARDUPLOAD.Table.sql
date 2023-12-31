USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_SMARTCARDUPLOAD]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_SMARTCARDUPLOAD](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SCNO] [varchar](50) NOT NULL,
	[UpLogId] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
	[Remark] [varchar](150) NULL,
	[InsertedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SMS_SMARTCARDUPLOAD] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_SMARTCARDUPLOAD] ON 

INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (1, N'8006064229523108', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.830' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (2, N'8006064231116776', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.833' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (3, N'8006064231079768', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.837' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (4, N'8006064231474167', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.840' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (5, N'8006064231097760', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.843' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (6, N'8006064231080634', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.843' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (7, N'8006064231080345', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.847' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (8, N'8006064231076780', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.850' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (9, N'8006064231117196', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.853' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (10, N'8006064231119200', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.857' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (11, N'8006064231473896', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.857' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (12, N'8006064229523199', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.860' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (13, N'8006064231115406', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.863' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (14, N'8006064231079008', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.867' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (15, N'8006064229523496', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.870' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (16, N'8006064231083547', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.870' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (17, N'8006064239080297', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.873' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (18, N'8006064231122014', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.877' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (19, N'8006064231115653', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.880' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (20, N'8006064231115307', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.880' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (21, N'8006064231093066', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.883' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (22, N'8006064231083687', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.887' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (23, N'8006064231494397', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.890' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (24, N'8006064231073530', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.890' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (25, N'8006064231077846', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.893' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (26, N'8006064231102685', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.897' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (27, N'8006064231473912', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.900' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (28, N'8006064229522712', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.903' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (29, N'8006064231078356', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.903' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (30, N'8006064231473573', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.907' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (31, N'8006064231073746', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.910' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (32, N'8006064231117220', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.913' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (33, N'8006064239074860', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.913' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (34, N'8006064239074985', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.917' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (35, N'8006064231098859', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.920' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (36, N'8006064229522340', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.923' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (37, N'8006064231118962', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.927' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (38, N'8006064229523082', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.927' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (39, N'8006064231474407', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.930' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (40, N'8006064231079834', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.933' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (41, N'8006064234666454', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.937' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (42, N'8006064231115422', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.937' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (43, N'8006064231108724', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.940' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (44, N'8006064231081145', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.943' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (45, N'8006064231099949', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.947' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (46, N'8006064231079743', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.950' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (47, N'8006064231114805', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.950' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (48, N'8006064231116024', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.953' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (49, N'8006064231114409', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.957' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (50, N'8006064231081558', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.960' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (51, N'8006064231115331', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.960' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (52, N'8006064231119168', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.963' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (53, N'8006064231098891', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.967' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (54, N'8006064231100259', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.970' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (55, N'8006064231082200', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.970' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (56, N'8006064231494660', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.973' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (57, N'8006064231113526', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.977' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (58, N'8006064231495428', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.980' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (59, N'8006064231080840', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.980' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (60, N'8006064231495832', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.983' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (61, N'8006064231076889', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.987' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (62, N'8006064231103410', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.990' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (63, N'8006064231091243', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.993' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (64, N'8006064231085831', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.997' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (65, N'8006064231473870', 1, 1, N'true', CAST(N'2022-08-29T16:36:23.997' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (66, N'8006064231114615', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.000' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (67, N'8006064231073928', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.003' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (68, N'8006064229521987', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.007' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (69, N'8006064231117048', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.010' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (70, N'8006064231113534', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.010' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (71, N'8006064231099154', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.013' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (72, N'8006064231080626', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.017' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (73, N'8006064231101430', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.020' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (74, N'8006064231073613', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.023' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (75, N'8006064231081616', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.023' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (76, N'8006064231119051', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.027' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (77, N'8006064231087068', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.030' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (78, N'8006064239075388', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.033' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (79, N'8006064231080550', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.037' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (80, N'8006064231117709', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.040' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (81, N'8006064231475966', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.040' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (82, N'8006064231495568', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.043' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (83, N'8006064231080311', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.047' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (84, N'8006064231494413', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.050' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (85, N'8006064231117378', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.053' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (86, N'8006064231114417', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.053' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (87, N'8006064231473946', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.057' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (88, N'8006064231115646', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.060' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (89, N'8006064231116263', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.063' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (90, N'8006064231081004', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.067' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (91, N'8006064231081780', 1, 0, N'SCNo Already Exists', CAST(N'2022-08-29T16:36:24.070' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (92, N'8006064231115166', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.070' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (93, N'8006064231081533', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.073' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (94, N'8006064231079156', 1, 1, N'true', CAST(N'2022-08-29T16:36:24.077' AS DateTime))
INSERT [dbo].[SMS_SMARTCARDUPLOAD] ([Id], [SCNO], [UpLogId], [Status], [Remark], [InsertedOn]) VALUES (95, N'8006064231115323', 1, 0, N'SCNo Already Exists', CAST(N'2022-08-29T16:36:24.080' AS DateTime))
SET IDENTITY_INSERT [dbo].[SMS_SMARTCARDUPLOAD] OFF
GO
ALTER TABLE [dbo].[SMS_SMARTCARDUPLOAD] ADD  CONSTRAINT [DF_SMS_SMARTCARDUPLOAD_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[SMS_SMARTCARDUPLOAD] ADD  CONSTRAINT [DF_SMS_SMARTCARDUPLOAD_InsertedOn]  DEFAULT (getdate()) FOR [InsertedOn]
GO
