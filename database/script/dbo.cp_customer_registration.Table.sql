USE [MNSMS]
GO
/****** Object:  Table [dbo].[cp_customer_registration]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cp_customer_registration](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[mobile_no] [varchar](20) NOT NULL,
	[customer_id] [varchar](100) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[user_type] [char](1) NULL,
	[ip] [varchar](50) NULL,
	[useragent] [text] NULL,
	[session_id] [varchar](255) NULL,
	[addedon] [datetime] NULL,
	[modifiedon] [datetime] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cp_customer_registration] ADD  DEFAULT (NULL) FOR [user_type]
GO
ALTER TABLE [dbo].[cp_customer_registration] ADD  DEFAULT ((0)) FOR [status]
GO
