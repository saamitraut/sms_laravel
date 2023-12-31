USE [MNSMS]
GO
/****** Object:  Table [dbo].[package_types]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[package_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[status] [bit] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[package_types] ON 

INSERT [dbo].[package_types] ([id], [name], [status], [created_at], [updated_at]) VALUES (1, N'dpo', 0, NULL, NULL)
INSERT [dbo].[package_types] ([id], [name], [status], [created_at], [updated_at]) VALUES (2, N'broadcaster', 0, NULL, NULL)
INSERT [dbo].[package_types] ([id], [name], [status], [created_at], [updated_at]) VALUES (3, N'alacarte', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[package_types] OFF
GO
ALTER TABLE [dbo].[package_types] ADD  DEFAULT ('0') FOR [status]
GO
