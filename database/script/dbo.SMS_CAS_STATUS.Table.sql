USE [MNSMS]
GO
/****** Object:  Table [dbo].[SMS_CAS_STATUS]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS_CAS_STATUS](
	[status_lastdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[SMS_CAS_STATUS] ([status_lastdate]) VALUES (CAST(N'2019-04-15T14:55:23.953' AS DateTime))
GO
