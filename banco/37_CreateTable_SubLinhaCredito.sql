/*
=================================================================================================================================================

	Objeto:			Tabela [SubLinhaCredito]
	Data Criação:	18/01/2017
	Desenvolvedor:	Igor Santos
	Descrição:		Script de criação da tabela de sub-linha de crédito
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
CREATE TABLE [prestamista].[SubLinhaCredito](
	[psl_id] [int] IDENTITY(1,1) NOT NULL,
	[plc_id] [int] NOT NULL,
	[psl_codigo] [varchar](50) NOT NULL,
	[psl_descricao] [varchar](150) NOT NULL,
	[psl_status] [char](1) NOT NULL,
	[psl_data_cad] [datetime] NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[psl_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK_SubLinhaCredito] PRIMARY KEY CLUSTERED 
(
	[psl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [prestamista].[SubLinhaCredito]  WITH CHECK ADD  CONSTRAINT [FK_SubLinhaCredito_LinhaCredito] FOREIGN KEY([plc_id])
REFERENCES [prestamista].[LinhaCredito] ([plc_id])
GO
ALTER TABLE [prestamista].[SubLinhaCredito] CHECK CONSTRAINT [FK_SubLinhaCredito_LinhaCredito]
GO
ALTER TABLE [prestamista].[SubLinhaCredito]  WITH CHECK ADD  CONSTRAINT [FK_SubLinhaCredito_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [prestamista].[SubLinhaCredito] CHECK CONSTRAINT [FK_SubLinhaCredito_Usuario]
GO