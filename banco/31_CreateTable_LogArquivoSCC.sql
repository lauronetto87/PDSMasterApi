USE [HomBD_Portal_Servico]
GO

/****** Object:  Table [dbo].[LogArquivoSCC]    Script Date: 14/12/2016 15:31:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[LogArquivoSCC](
	[las_id] [int] IDENTITY(1,1) NOT NULL,
	[las_nome_arquivo] [varchar](50) NULL,
	[las_caminho_arquivo] [varchar](100) NULL,
	[las_quantidade_registro] [int] NULL,
	[las_data_leitura] [datetime] NULL,
	[usu_login] [varchar](50) NULL,
 CONSTRAINT [PK_LogArquivoSCC] PRIMARY KEY CLUSTERED 
(
	[las_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


