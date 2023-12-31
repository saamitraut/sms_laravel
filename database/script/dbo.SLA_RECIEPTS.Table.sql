USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_RECIEPTS]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_RECIEPTS](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RecieptNo] [varchar](150) NOT NULL,
	[RecieptDate] [date] NOT NULL,
	[RecieptAmount] [float] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SLA_RECIEPTS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SLA_RECIEPTS] ADD  CONSTRAINT [DF_SLA_RECIEPTS_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
