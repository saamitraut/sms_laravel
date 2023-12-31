USE [MNSMS]
GO
/****** Object:  Table [dbo].[migrations]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[migration] [nvarchar](255) NOT NULL,
	[batch] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[migrations] ON 

INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (1, N'2014_10_12_000000_create_users_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (2, N'2014_10_12_100000_create_password_resets_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (3, N'2023_10_12_174347_create_states_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (4, N'2023_10_13_090000_create_prp_accounttransaction_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (5, N'2023_10_13_153334_create_colors_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (6, N'2023_10_13_153717_create_students_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (7, N'2023_10_13_162908_create_STBs_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (8, N'2023_10_19_064153_add_broadcaster_id_prp_bouques', 2)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (9, N'2023_10_19_133731_create_package_types_table', 3)
SET IDENTITY_INSERT [dbo].[migrations] OFF
GO
