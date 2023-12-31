USE [MNSMS]
GO
/****** Object:  Table [dbo].[PRP_DEMOBOUQUE]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRP_DEMOBOUQUE](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BouqueCode] [varchar](50) NOT NULL,
	[BouqueName] [varchar](150) NOT NULL,
	[Duration] [int] NOT NULL,
	[BType] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_PRP_DEMOBOUQUE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PRP_DEMOBOUQUE]    Script Date: 2023-11-10 06:14:02 ******/
ALTER TABLE [dbo].[PRP_DEMOBOUQUE] ADD  CONSTRAINT [IX_PRP_DEMOBOUQUE] UNIQUE NONCLUSTERED 
(
	[BouqueCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRP_DEMOBOUQUE] ADD  CONSTRAINT [DF_PRP_DEMOBOUQUE_Rate]  DEFAULT ((0)) FOR [Duration]
GO
ALTER TABLE [dbo].[PRP_DEMOBOUQUE] ADD  CONSTRAINT [DF_PRP_DEMOBOUQUE_BType]  DEFAULT ((0)) FOR [BType]
GO
ALTER TABLE [dbo].[PRP_DEMOBOUQUE] ADD  CONSTRAINT [DF_PRP_DEMOBOUQUE_BType1]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[PRP_DEMOBOUQUE] ADD  CONSTRAINT [DF_PRP_DEMOBOUQUE_CreatedOn]  DEFAULT ((1)) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PRP_DEMOBOUQUE] ADD  CONSTRAINT [DF_PRP_DEMOBOUQUE_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'In DAys' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PRP_DEMOBOUQUE', @level2type=N'COLUMN',@level2name=N'Duration'
GO
