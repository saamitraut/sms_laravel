USE [MNSMS]
GO
/****** Object:  Table [dbo].[cp_payment_gateway]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cp_payment_gateway](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](20) NOT NULL,
	[pg_source] [varchar](20) NOT NULL,
	[descriptions] [varchar](255) NULL,
	[mobile_status] [int] NULL,
	[status] [int] NULL,
	[deleted] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cp_payment_gateway] ADD  DEFAULT ((0)) FOR [mobile_status]
GO
ALTER TABLE [dbo].[cp_payment_gateway] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[cp_payment_gateway] ADD  DEFAULT ((0)) FOR [deleted]
GO
