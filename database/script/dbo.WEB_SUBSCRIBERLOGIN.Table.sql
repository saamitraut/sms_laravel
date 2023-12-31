USE [MNSMS]
GO
/****** Object:  Table [dbo].[WEB_SUBSCRIBERLOGIN]    Script Date: 2023-11-10 06:13:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEB_SUBSCRIBERLOGIN](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[CustomerId] [varchar](20) NOT NULL,
	[Password] [varchar](150) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_WEB_SUBSCRIBERLOGIN] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WEB_SUBSCRIBERLOGIN] ADD  CONSTRAINT [DF_WEB_SUBSCRIBERLOGIN_Status]  DEFAULT ((0)) FOR [Status]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Pending
1-Approved
2-Suspended
3-Rejected
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEB_SUBSCRIBERLOGIN', @level2type=N'COLUMN',@level2name=N'Status'
GO
