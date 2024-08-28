/*
=================================================================================================================================================

	Objeto:			Table [[LogArquivoBoleto]]
	Data Criação:	27/01/2017
	Desenvolvedor:	Lauro Daniel
	Descrição:		Criação da Tabela LogArquivoBoleto
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/

USE [HomBD_Portal_Servico]
GO
/****** Object:  Table [dbo].[LogArquivoBoleto]    Script Date: 27/01/2017 16:24:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogArquivoBoleto](
	[lab_id] [int] IDENTITY(1,1) NOT NULL,
	[lab_nome_arquivo] [varchar](50) NOT NULL,
	[lab_caminho_arquivo] [varchar](100) NULL,
	[lab_data_leitura] [datetime] NOT NULL,
	[lab_nome_arquivo_modificado] [varchar](100) NULL,
	[usu_login] [varchar](50) NULL,
	[lab_mensagem] [varchar](100) NULL,
	[las_upload] [bit] NULL,
 CONSTRAINT [PK_LogArquivoBoleto] PRIMARY KEY CLUSTERED 
(
	[lab_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
