/*
=================================================================================================================================================

	Objeto:			Table [[LogArquivoDebito]]
	Data Criação:	27/01/2017
	Desenvolvedor:	Lauro Daniel
	Descrição:		Criação da Tabela LogArquivoDebito
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/

USE [HomBD_Portal_Servico]
GO
/****** Object:  Table [dbo].[LogArquivoDebito]    Script Date: 27/01/2017 16:24:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogArquivoDebito](
	[lad_id] [int] NOT NULL,
	[lad_nome_arquivo] [varchar](50) NOT NULL,
	[lad_caminho_arquivo] [varchar](100) NULL,
	[lad_data_leitura] [datetime] NOT NULL,
	[lad_nome_arquivo_modificado] [varchar](50) NULL,
	[usu_login] [varchar](50) NOT NULL,
	[lad_mensagem] [varchar](100) NULL,
	[lad_upload] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
