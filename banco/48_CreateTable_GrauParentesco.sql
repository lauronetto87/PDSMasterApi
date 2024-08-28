/*
=================================================================================================================================================

	Objeto:			Tabela [GrauParentesco]
	Data Criação:	26/01/2017
	Desenvolvedor:	Igor Santos
	Descrição:		Script de criação da tabela de grau de parentesco
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
CREATE TABLE [dbo].[GrauParentesco](
	[gpt_id] [int] IDENTITY(1,1) NOT NULL,
	[gpt_descricao] [varchar](100) NOT NULL,
	[gpt_status] [char](1) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[gpt_data_cad] [datetime] NOT NULL,
	[gpt_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK_GrauParentesco] PRIMARY KEY CLUSTERED 
(
	[gpt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[GrauParentesco]  WITH CHECK ADD  CONSTRAINT [FK_GrauParentesco_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[GrauParentesco] CHECK CONSTRAINT [FK_GrauParentesco_Usuario]
GO