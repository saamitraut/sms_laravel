USE [MNSMS]
GO
/****** Object:  Table [dbo].[smst_status_CatVision]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smst_status_CatVision](
	[status_lastdate] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[smst_status_CatVision] ([status_lastdate]) VALUES (CAST(N'2019-04-01T13:34:27.270' AS DateTime))
GO
