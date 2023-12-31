USE [MNSMS]
GO
/****** Object:  Table [dbo].[PaymentStatusCode]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStatusCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthStatus] [varchar](50) NULL,
	[Status] [int] NULL,
	[Description] [varchar](255) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PaymentStatusCode] ON 

INSERT [dbo].[PaymentStatusCode] ([Id], [AuthStatus], [Status], [Description], [CreatedOn], [CreatedBy]) VALUES (1, N'0001', 3, N'Error at BillDesk Cancel Transaction', CAST(N'2015-08-19T19:55:56.377' AS DateTime), 1)
INSERT [dbo].[PaymentStatusCode] ([Id], [AuthStatus], [Status], [Description], [CreatedOn], [CreatedBy]) VALUES (2, N'0002', 2, N'BillDesk is waiting for Response from Bank Pending Transaction', CAST(N'2015-08-19T19:55:56.377' AS DateTime), 1)
INSERT [dbo].[PaymentStatusCode] ([Id], [AuthStatus], [Status], [Description], [CreatedOn], [CreatedBy]) VALUES (3, N'0300', 1, N'Success Successful Transaction', CAST(N'2015-08-19T19:55:56.377' AS DateTime), 1)
INSERT [dbo].[PaymentStatusCode] ([Id], [AuthStatus], [Status], [Description], [CreatedOn], [CreatedBy]) VALUES (4, N'0399', 4, N'Invalid Authentication at Bank Cancel Transaction', CAST(N'2015-08-19T19:55:56.377' AS DateTime), 1)
INSERT [dbo].[PaymentStatusCode] ([Id], [AuthStatus], [Status], [Description], [CreatedOn], [CreatedBy]) VALUES (5, N'NA', 5, N'Invalid Input in the Request Message Cancel Transaction', CAST(N'2015-08-19T19:55:56.377' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PaymentStatusCode] OFF
GO
