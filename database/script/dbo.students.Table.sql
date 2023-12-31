USE [MNSMS]
GO
/****** Object:  Table [dbo].[students]    Script Date: 2023-11-10 06:13:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[state_id] [int] NOT NULL,
	[color_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [students_color_id_foreign] FOREIGN KEY([color_id])
REFERENCES [dbo].[colors] ([id])
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [students_color_id_foreign]
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD  CONSTRAINT [students_state_id_foreign] FOREIGN KEY([state_id])
REFERENCES [dbo].[states] ([id])
GO
ALTER TABLE [dbo].[students] CHECK CONSTRAINT [students_state_id_foreign]
GO
