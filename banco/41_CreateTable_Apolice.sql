/*
=================================================================================================================================================

	Objeto:			Tabela [Apolice]
	Data Criação:	23/01/2017
	Desenvolvedor:	Igor Santos
	Descrição:		Script de criação da tabela de apólice
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
CREATE TABLE [prestamista].[Apolice](
	[pap_id] [int] IDENTITY(1,1) NOT NULL,
	[pap_codigo] [varchar](25) NOT NULL,
	[pap_descricao] [varchar](250) NOT NULL,
	[seg_id] [int] NOT NULL,
	[pro_id] [int] NOT NULL,
	[pap_val_inicial] [decimal](9, 2) NOT NULL,
	[pap_val_final] [decimal](9, 2) NOT NULL,
	[pap_lim_idade_ano] [int] NOT NULL,
	[pap_lim_idade_mes] [int] NULL,
	[pap_prazo_mes] [int] NOT NULL,
	[pap_prazo_dia] [int] NULL,
	[pap_status] [char](1) NOT NULL,
	[pap_arquivo] [varchar](max) NULL,
	[pap_data_cad] [datetime] NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[pap_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK_Apolice] PRIMARY KEY CLUSTERED 
(
	[pap_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
ALTER TABLE [prestamista].[Apolice]  WITH CHECK ADD  CONSTRAINT [FK_Apolice_Produto] FOREIGN KEY([pro_id])
REFERENCES [dbo].[Produto] ([pro_id])
GO
ALTER TABLE [prestamista].[Apolice] CHECK CONSTRAINT [FK_Apolice_Produto]
GO
ALTER TABLE [prestamista].[Apolice]  WITH CHECK ADD  CONSTRAINT [FK_Apolice_Seguradora] FOREIGN KEY([seg_id])
REFERENCES [dbo].[Seguradora] ([seg_id])
GO
ALTER TABLE [prestamista].[Apolice] CHECK CONSTRAINT [FK_Apolice_Seguradora]
GO
ALTER TABLE [prestamista].[Apolice]  WITH CHECK ADD  CONSTRAINT [FK_Apolice_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [prestamista].[Apolice] CHECK CONSTRAINT [FK_Apolice_Usuario]
GO