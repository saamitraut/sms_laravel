USE [MNSMS]
GO
/****** Object:  Table [dbo].[smst_status]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smst_status](
	[status_lastdate] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[smst_status] ([status_lastdate]) VALUES (CAST(N'2023-10-15T16:15:49.023' AS DateTime))
GO
