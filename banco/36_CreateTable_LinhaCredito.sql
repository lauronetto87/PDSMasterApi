/*
=================================================================================================================================================

	Objeto:			Tabela [LinhaCredito]
	Data Criação:	18/01/2017
	Desenvolvedor:	Igor Santos
	Descrição:		Script de criação da tabela de linha de crédito
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
CREATE TABLE [prestamista].[LinhaCredito](
	[plc_id] [int] IDENTITY(1,1) NOT NULL,
	[plc_codigo] [varchar](50) NOT NULL,
	[plc_descricao] [varchar](150) NOT NULL,
	[plc_status] [char](1) NOT NULL,
	[plc_data_cad] [datetime] NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[plc_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK_LinhaCredito] PRIMARY KEY CLUSTERED 
(
	[plc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [prestamista].[LinhaCredito]  WITH CHECK ADD  CONSTRAINT [FK_LinhaCredito_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [prestamista].[LinhaCredito] CHECK CONSTRAINT [FK_LinhaCredito_Usuario]
GO