USE [MNSMS]
GO
/****** Object:  Table [dbo].[WEB_Subscription]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEB_Subscription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [varchar](20) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderAmount] [float] NOT NULL,
	[IPaddress] [varchar](50) NOT NULL,
	[SubscriberId] [int] NOT NULL,
	[PackagePrice] [float] NOT NULL,
	[InsertedOn] [datetime] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_WEB_Subscription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_WEB_Subscription]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[WEB_Subscription] ADD  CONSTRAINT [IX_WEB_Subscription] UNIQUE NONCLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
