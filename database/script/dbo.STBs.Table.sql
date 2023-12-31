USE [MNSMS]
GO
/****** Object:  Table [dbo].[STBs]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STBs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[STBNo] [nvarchar](255) NOT NULL,
	[SmartcardNo] [nvarchar](255) NOT NULL,
	[amount] [int] NOT NULL,
	[DeactivationDate] [nvarchar](255) NOT NULL,
	[accountid] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[STBs] ADD  DEFAULT ('0') FOR [status]
GO
