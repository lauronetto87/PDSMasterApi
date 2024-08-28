USE [HomBD_Portal_Servico]
GO

/****** Object:  Table [dbo].[CabecalhoSCC]    Script Date: 01/12/2016 14:58:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CabecalhoSCC](
	[csc_id] [int] IDENTITY(1,1) NOT NULL,
	[csc_tipo_registro] [int] NOT NULL,
	[csc_sequencial_registro] [varchar](6) NOT NULL,
	[csc_nome_arquivo] [varchar](9) NOT NULL,
	[csc_data_processamento] [varchar](8) NOT NULL,
	[csc_codigo_banco] [varchar](3) NOT NULL,
	[csc_diario_mensal] [varchar](1) NOT NULL,
 CONSTRAINT [PK_CabecarioSCC] PRIMARY KEY CLUSTERED 
(
	[csc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


