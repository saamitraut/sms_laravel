USE [MNSMS]
GO
/****** Object:  Table [dbo].[RequestHeaders]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestHeaders](
	[HeaderKey] [varchar](650) NULL,
	[HeaderValue] [varchar](6000) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[RequestHeaders] ([HeaderKey], [HeaderValue]) VALUES (N'Cache-Control', N'no-cache')
INSERT [dbo].[RequestHeaders] ([HeaderKey], [HeaderValue]) VALUES (N'Pragma', N'no-cach')
GO
