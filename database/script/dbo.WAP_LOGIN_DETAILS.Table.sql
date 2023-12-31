USE [MNSMS]
GO
/****** Object:  Table [dbo].[WAP_LOGIN_DETAILS]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WAP_LOGIN_DETAILS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Username] [varchar](100) NULL,
	[MPIN] [varchar](10) NULL,
	[UserType] [char](1) NULL,
	[Identifier] [varchar](500) NULL,
	[Authorization] [varchar](255) NULL,
	[AccessToken] [varchar](50) NULL,
	[DeviceOS] [varchar](255) NULL,
	[DeviceType] [char](1) NULL,
	[DeviceDesc] [varchar](255) NULL,
	[IMEI] [varchar](255) NULL,
	[IP] [varchar](100) NULL,
	[App] [varchar](100) NULL,
	[Mode] [varchar](100) NULL,
	[Version] [varchar](50) NULL,
	[LVersion] [varchar](50) NULL,
	[SessionId] [varchar](100) NULL,
	[UserAgent] [text] NULL,
	[LoggedOn] [datetime] NULL,
	[LogoutOn] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WAP_LOGIN_DETAILS] ON 

INSERT [dbo].[WAP_LOGIN_DETAILS] ([Id], [UserId], [Username], [MPIN], [UserType], [Identifier], [Authorization], [AccessToken], [DeviceOS], [DeviceType], [DeviceDesc], [IMEI], [IP], [App], [Mode], [Version], [LVersion], [SessionId], [UserAgent], [LoggedOn], [LogoutOn], [Status]) VALUES (1, 111, N'bhiwandicr', N'1234', N'O', N'2458b1092b12f1da', N'd2VheFA2TUtNdjl2OVp0NFRIbXY0TXhyUmxMRWltKzdHa2dvdCs5UFgvbENiL3hhTlFzd2I2S1l6UFdVWk93dmptRmw5bWgvWEdYVjhCdG5VYkpqOEtsc2Z0SW9tVTN2QjQ0MFZLVnVKSCtyOU5EaGVzL3dYZkJLWTZMV1hmMUI', N'1477570148', N'Android 4.4.2', N'A', N'XOLO Q1010i Android 4.4.2', N'2458b1092b12f1da', N'103.230.222.114:8080', N'operator', N'DEBUG', N'1.0.0', N'1.0.0', N'5837mcus5cltr8n5d0rtk69nn5', N'eyJIb3N0IjoiMTAzLjIzMC4yMjIuMTE0OjgwODAiLCJDb25uZWN0aW9uIjoia2VlcC1hbGl2ZSIsIkNvbnRlbnQtTGVuZ3RoIjoiMjgiLCJPcmlnaW4iOiJmaWxlOlwvXC8iLCJzZWNyZXRfa2V5IjoiVkhoQk1TOVVaMjA0UVc1MGRuQnFZblJuT0VSb09WSnlaVTlpYVc5a1RtaDJUbWRYUzBwVFRrRXJidyIsImFwcF92ZXJzaW9uIjoiMS4wLjAiLCJVc2VyLUFnZW50IjoiTW96aWxsYVwvNS4wIChMaW51eDsgQW5kcm9pZCA0LjQuMjsgUTEwMTBpIEJ1aWxkXC9LT1Q0OUgpIEFwcGxlV2ViS2l0XC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uXC80LjAgQ2hyb21lXC8zMC4wLjAuMCBNb2JpbGUgU2FmYXJpXC81MzcuMzYiLCJDb250ZW50LVR5cGUiOiJhcHBsaWNhdGlvblwveC13d3ctZm9ybS11cmxlbmNvZGVkIiwiRGV2aWNlQXV0aCI6IjI0NThiMTA5MmIxMmYxZGEiLCJkZXZpY2VvcyI6IkFuZHJvaWQgNC40LjIiLCJhcHBfbW9kZSI6IkRFQlVHIiwiaW1laSI6IjI0NThiMTA5MmIxMmYxZGEiLCJ4LXdhcC1wcm9maWxlIjoiaHR0cDpcL1wvd3d3Lm1zYWkuaW5cL3VhcHJvZlwvWE9MT1wvWE9MT19RMTAxMGkueG1sIiwiZGV2aWNlZGVzYyI6IlhPTE8gUTEwMTBpIEFuZHJvaWQgNC40LjIiLCJkZXZpY2V0eXBlIjoiQSIsIkFjY2VwdCI6IipcLyoiLCJBY2NlcHQtRW5jb2RpbmciOiJnemlwLGRlZmxhdGUiLCJBY2NlcHQtTGFuZ3VhZ2UiOiJlbi1VUyIsIlgtUmVxdWVzdGVkLVdpdGgiOiJjb20ucm9oaXQuc21wb3BlcmF0b3IifQ==', CAST(N'2016-10-27T17:39:08.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[WAP_LOGIN_DETAILS] OFF
GO
ALTER TABLE [dbo].[WAP_LOGIN_DETAILS] ADD  DEFAULT (NULL) FOR [UserType]
GO
ALTER TABLE [dbo].[WAP_LOGIN_DETAILS] ADD  DEFAULT ('M') FOR [DeviceType]
GO
ALTER TABLE [dbo].[WAP_LOGIN_DETAILS] ADD  DEFAULT ((1)) FOR [Status]
GO
