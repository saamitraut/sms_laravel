USE [MNSMS]
GO
/****** Object:  Table [dbo].[cp_online_payment]    Script Date: 2023-11-10 06:13:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cp_online_payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[payment_id] [varchar](50) NULL,
	[reference_id] [varchar](50) NULL,
	[transaction_id] [varchar](50) NULL,
	[subscriber_id] [bigint] NULL,
	[customer_id] [varchar](50) NULL,
	[account_id] [bigint] NULL,
	[request_id] [bigint] NULL,
	[mobile] [varchar](20) NULL,
	[amount] [decimal](10, 2) NULL,
	[payment_type] [varchar](50) NULL,
	[payment_provider] [int] NULL,
	[remark] [varchar](500) NULL,
	[pg_epg_txn_id] [varchar](50) NULL,
	[pg_status_code] [varchar](50) NULL,
	[pg_status_id] [varchar](50) NULL,
	[pg_resp_code] [varchar](50) NULL,
	[pg_response_message] [varchar](500) NULL,
	[pg_request_param] [text] NULL,
	[pg_response_param] [text] NULL,
	[pg_verify_request_param] [text] NULL,
	[pg_verify_response_param] [text] NULL,
	[pg_request_on] [datetime] NULL,
	[pg_response_on] [datetime] NULL,
	[added_on] [datetime] NULL,
	[added_by] [int] NULL,
	[modified_on] [datetime] NULL,
	[modified_by] [int] NULL,
	[session_id] [varchar](255) NULL,
	[send_status] [int] NULL,
	[status] [int] NULL,
	[device_type] [char](1) NULL,
	[pg_payment_mode] [varchar](20) NULL,
	[pg_payment_method] [varchar](20) NULL,
	[pg_payment_method_type] [varchar](20) NULL,
	[gateway_rate] [decimal](10, 2) NULL,
	[gateway_charge] [decimal](10, 2) NULL,
	[total_amount] [decimal](10, 2) NULL,
	[gateway_gst_rate] [decimal](10, 2) NULL,
 CONSTRAINT [PK__cp_onlin__3213E83F342B16A7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cp_online_payment] ADD  CONSTRAINT [DF__cp_online__send___37AECE90]  DEFAULT ((0)) FOR [send_status]
GO
ALTER TABLE [dbo].[cp_online_payment] ADD  CONSTRAINT [DF__cp_online__statu__38A2F2C9]  DEFAULT ((0)) FOR [status]
GO
