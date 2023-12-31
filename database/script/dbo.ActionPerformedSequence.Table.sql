USE [MNSMS]
GO
/****** Object:  Table [dbo].[ActionPerformedSequence]    Script Date: 2023-11-10 06:13:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionPerformedSequence](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionPerformedId] [int] NOT NULL,
	[ActionPerformedName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActionPerformedSequence] ON 

INSERT [dbo].[ActionPerformedSequence] ([Id], [ActionPerformedId], [ActionPerformedName]) VALUES (1, 1, N'Bill Payment')
INSERT [dbo].[ActionPerformedSequence] ([Id], [ActionPerformedId], [ActionPerformedName]) VALUES (2, 2, N'Reply On Query')
INSERT [dbo].[ActionPerformedSequence] ([Id], [ActionPerformedId], [ActionPerformedName]) VALUES (3, 3, N'Allocated Bouque To Subscriber')
SET IDENTITY_INSERT [dbo].[ActionPerformedSequence] OFF
GO
