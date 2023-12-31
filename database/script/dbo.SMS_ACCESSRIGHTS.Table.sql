USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_ACCESSRIGHTS]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_ACCESSRIGHTS](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MenuId] [bigint] NOT NULL,
	[AccessId] [bigint] NOT NULL,
	[PRead] [bit] NOT NULL,
	[PWrite] [bit] NOT NULL,
	[PExecute] [bit] NOT NULL,
	[InsertedOn] [datetime] NOT NULL,
	[InsertedBy] [bigint] NOT NULL,
 CONSTRAINT [PK_SMSTACCESSRIGHTS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SMS_ACCESSRIGHTS] ON 

INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (244, 2, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.093' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (245, 3, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.093' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (246, 80, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.093' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (247, 90, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.093' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (248, 4, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.093' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (249, 6, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.097' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (250, 5, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.097' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (251, 7, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.097' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (252, 15, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.097' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (253, 23, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.097' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (254, 25, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.097' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (255, 27, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.097' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (256, 26, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.100' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (257, 136, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.100' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (258, 9, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.100' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (259, 35, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.100' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (260, 126, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.100' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (261, 201, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.100' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (262, 20205, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.100' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (263, 20207, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.100' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (264, 20208, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.100' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (265, 20217, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.100' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (266, 20219, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.103' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (267, 20220, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.103' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (268, 20221, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.103' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (269, 20223, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.103' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (270, 12, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.103' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (271, 28, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.103' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (272, 14, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.103' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (273, 30, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.103' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (274, 39, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.107' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (275, 34, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.107' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (276, 37, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.107' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (277, 40, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.107' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (278, 38, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.107' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (279, 79, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.107' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (280, 31, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.107' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (281, 33, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.110' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (282, 152, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.110' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (283, 20224, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.110' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (284, 20225, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.110' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (285, 20226, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.110' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (286, 189, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.110' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (287, 61, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.110' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (288, 10205, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.110' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (289, 139, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.113' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (290, 20206, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.113' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (291, 20209, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.113' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (292, 50, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.113' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (293, 51, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.113' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (294, 132, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.113' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (295, 43, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.117' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (296, 52, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.117' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (297, 77, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.117' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (298, 119, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.117' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (299, 133, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.117' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (300, 53, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.120' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (301, 160, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.120' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (302, 62, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.120' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (303, 63, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.120' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (304, 64, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.120' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (305, 67, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.120' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (306, 74, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.120' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (307, 115, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.120' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (308, 117, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.120' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (309, 156, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.123' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (310, 121, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.123' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (311, 166, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.123' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (312, 179, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.123' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (313, 186, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.123' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (314, 10204, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.123' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (315, 20213, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.127' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (316, 187, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.127' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (317, 20214, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.127' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (318, 20215, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.127' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (319, 20216, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.127' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (320, 195, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.127' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (321, 20218, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.130' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (322, 20222, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.130' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (323, 168, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.130' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (324, 169, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.130' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (325, 170, 3, 1, 1, 1, CAST(N'2022-10-06T15:05:22.130' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (326, 2, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.210' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (327, 3, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.210' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (328, 80, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.210' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (329, 90, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.210' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (330, 4, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.210' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (331, 6, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.213' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (332, 5, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.213' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (333, 7, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.213' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (334, 15, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.213' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (335, 23, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.217' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (336, 25, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.217' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (337, 27, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.217' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (338, 26, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.217' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (339, 136, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.217' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (340, 9, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.220' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (341, 35, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.220' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (342, 126, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.220' AS DateTime), 3)
GO
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (343, 201, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.220' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (344, 20205, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.220' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (345, 20207, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.220' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (346, 20208, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.223' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (347, 20217, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.223' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (348, 20219, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.223' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (349, 20220, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.223' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (350, 20221, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.223' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (351, 20223, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.227' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (352, 12, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.227' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (353, 28, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.227' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (354, 14, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.227' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (355, 30, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.227' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (356, 39, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.230' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (357, 34, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.230' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (358, 37, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.230' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (359, 40, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.230' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (360, 38, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.230' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (361, 79, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.230' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (362, 31, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.230' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (363, 33, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.233' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (364, 152, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.233' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (365, 20224, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.233' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (366, 20225, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.233' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (367, 20226, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.237' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (368, 189, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.237' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (369, 61, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.237' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (370, 10205, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.237' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (371, 139, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.237' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (372, 20206, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.240' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (373, 20209, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.240' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (374, 50, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.240' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (375, 51, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.240' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (376, 132, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.240' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (377, 43, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.240' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (378, 52, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.240' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (379, 77, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.243' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (380, 119, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.243' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (381, 133, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.243' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (382, 53, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.243' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (383, 160, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.243' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (384, 62, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.247' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (385, 63, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.247' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (386, 64, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.247' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (387, 67, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.247' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (388, 74, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.247' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (389, 115, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.250' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (390, 117, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.250' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (391, 156, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.250' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (392, 121, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.250' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (393, 166, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.250' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (394, 179, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.250' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (395, 186, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.250' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (396, 10204, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.253' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (397, 20213, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.253' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (398, 187, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.253' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (399, 20214, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.253' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (400, 20215, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.253' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (401, 20216, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.257' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (402, 195, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.257' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (403, 20218, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.257' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (404, 20222, 4, 0, 0, 0, CAST(N'2023-06-06T14:05:59.257' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (405, 168, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.257' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (406, 169, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.260' AS DateTime), 3)
INSERT [dbo].[SMS_ACCESSRIGHTS] ([Id], [MenuId], [AccessId], [PRead], [PWrite], [PExecute], [InsertedOn], [InsertedBy]) VALUES (407, 170, 4, 1, 1, 1, CAST(N'2023-06-06T14:05:59.260' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[SMS_ACCESSRIGHTS] OFF
GO
ALTER TABLE [dbo].[SMS_ACCESSRIGHTS] ADD  CONSTRAINT [DF_SMS_ACCESSRIGHTS_PRead]  DEFAULT ((1)) FOR [PRead]
GO
ALTER TABLE [dbo].[SMS_ACCESSRIGHTS] ADD  CONSTRAINT [DF_SMS_ACCESSRIGHTS_PWrite]  DEFAULT ((0)) FOR [PWrite]
GO
ALTER TABLE [dbo].[SMS_ACCESSRIGHTS] ADD  CONSTRAINT [DF_SMS_ACCESSRIGHTS_PExecute]  DEFAULT ((0)) FOR [PExecute]
GO
ALTER TABLE [dbo].[SMS_ACCESSRIGHTS]  WITH CHECK ADD  CONSTRAINT [FK_SMS_ACCESSRIGHTS_SMS_ACCESS] FOREIGN KEY([AccessId])
REFERENCES [dbo].[SMS_ACCESS] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SMS_ACCESSRIGHTS] CHECK CONSTRAINT [FK_SMS_ACCESSRIGHTS_SMS_ACCESS]
GO
ALTER TABLE [dbo].[SMS_ACCESSRIGHTS]  WITH CHECK ADD  CONSTRAINT [FK_SMS_ACCESSRIGHTS_SMS_MENU] FOREIGN KEY([MenuId])
REFERENCES [dbo].[SMS_MENU] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SMS_ACCESSRIGHTS] CHECK CONSTRAINT [FK_SMS_ACCESSRIGHTS_SMS_MENU]
GO
