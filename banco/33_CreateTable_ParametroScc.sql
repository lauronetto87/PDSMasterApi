USE [HomBD_Portal_Servico]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [prestamista].[ParametroScc](
	[psc_id] [int] IDENTITY(1,1) NOT NULL,
	[psc_dat_ult_proc] [datetime] NOT NULL,
 CONSTRAINT [PK_ParametroScc] PRIMARY KEY CLUSTERED 
(
	[psc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO