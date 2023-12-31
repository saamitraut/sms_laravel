USE [MNSMS]
GO
/****** Object:  Table [dbo].[SLA_CORRECTIONREQUEST]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLA_CORRECTIONREQUEST](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SubscriberId] [bigint] NOT NULL,
	[Complaintid] [bigint] NOT NULL,
	[SocietyId] [bigint] NULL,
	[FName] [varchar](100) NULL,
	[LName] [varchar](100) NULL,
	[Mname] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[MobileNo] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[DOB] [date] NULL,
	[OCCUPATION] [varchar](350) NULL,
	[Gender] [varchar](6) NULL,
	[FlatNo] [varchar](100) NULL,
	[FloorNo] [varchar](100) NULL,
	[Wing] [varchar](100) NULL,
	[Building] [varchar](100) NULL,
	[Address] [varchar](350) NULL,
	[Zipcode] [varchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[Deleted] [bit] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_SLA_CORRECTIONREQUEST] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SLA_CORRECTIONREQUEST] ADD  CONSTRAINT [DF_SLA_CORRECTIONREQUEST_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SLA_CORRECTIONREQUEST]  WITH CHECK ADD  CONSTRAINT [FK_SLA_CORRECTIONREQUEST_SLA_COMPLAINT] FOREIGN KEY([Complaintid])
REFERENCES [dbo].[SLA_COMPLAINT] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SLA_CORRECTIONREQUEST] CHECK CONSTRAINT [FK_SLA_CORRECTIONREQUEST_SLA_COMPLAINT]
GO
