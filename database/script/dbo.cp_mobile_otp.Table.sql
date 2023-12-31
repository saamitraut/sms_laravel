USE [MNSMS]
GO
/****** Object:  Table [dbo].[cp_mobile_otp]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cp_mobile_otp](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[mobile_no] [varchar](20) NULL,
	[otp_code] [varchar](10) NULL,
	[request_type] [varchar](50) NULL,
	[ip] [varchar](50) NULL,
	[useragent] [text] NULL,
	[session_id] [varchar](255) NULL,
	[addedon] [datetime] NULL,
	[modifiedon] [datetime] NULL,
	[status] [int] NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cp_mobile_otp] ADD  DEFAULT ((0)) FOR [status]
GO
