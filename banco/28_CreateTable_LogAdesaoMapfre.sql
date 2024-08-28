/*
=================================================================================================================================================

	Objeto:			Table [LogAdesaoMapfre]
	Data Criação:	06/12/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Tabela para logar arquivos gerados de adesão da Mapfre
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
USE [HomBD_Portal_Servico]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogAdesaoMapfre](
	[lam_id] [int] IDENTITY(1,1) NOT NULL,
	[lam_nome_arquivo] [varchar](200) NOT NULL,
	[lam_qtd_registros] [int] NOT NULL,
	[lam_caminho_arquivo] [varchar](200) NOT NULL,
	[lam_data_geracao] [datetime] NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LogAdesaoMapfre] PRIMARY KEY CLUSTERED 
(
	[lam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[LogAdesaoMapfre]  WITH CHECK ADD  CONSTRAINT [FK_LogAdesaoMapfre_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[LogAdesaoMapfre] CHECK CONSTRAINT [FK_LogAdesaoMapfre_Usuario]
GO