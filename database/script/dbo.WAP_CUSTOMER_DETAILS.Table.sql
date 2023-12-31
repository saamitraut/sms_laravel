USE [MNSMS]
GO
/****** Object:  Table [dbo].[WAP_CUSTOMER_DETAILS]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WAP_CUSTOMER_DETAILS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CID] [varchar](100) NOT NULL,
	[CustomerId] [varchar](100) NOT NULL,
	[ReferenceId] [varchar](100) NULL,
	[OperatorId] [int] NULL,
	[Remark] [varchar](255) NULL,
	[AddedBy] [varchar](50) NULL,
	[AddedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WAP_CUSTOMER_DETAILS] ADD  DEFAULT ((1)) FOR [Status]
GO
