USE [HomBD_Portal_Servico]
GO

/****** Object:  Table [dbo].[ArquivoContrato]    Script Date: 06/12/2016 09:57:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ArquivoContrato](
	[arc_id] [int] IDENTITY(1,1) NOT NULL,
	[ctt_id] [int] NOT NULL,
	[arc_nome_arquivo] [varchar](max) NOT NULL,
	[arc_caminho] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ArquivContrato] PRIMARY KEY CLUSTERED 
(
	[arc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


