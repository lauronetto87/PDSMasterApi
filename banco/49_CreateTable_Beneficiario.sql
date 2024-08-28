/*
=================================================================================================================================================

	Objeto:			Tabela [Beneficiario]
	Data Criação:	26/01/2017
	Desenvolvedor:	Igor Santos
	Descrição:		Script de criação da tabela de beneficiários
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
CREATE TABLE [dbo].[Beneficiario](
	[bnf_id] [int] IDENTITY(1,1) NOT NULL,
	[ctt_id] [bigint] NOT NULL,
	[gpt_id] [int] NOT NULL,
	[bnf_cpf] [varchar](11) NOT NULL,
	[bnf_nome] [varchar](250) NOT NULL,
	[bnf_perc] [decimal](5, 2) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[bnf_data_cad] [datetime] NOT NULL,
 CONSTRAINT [PK_Beneficiario] PRIMARY KEY CLUSTERED 
(
	[bnf_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Beneficiario]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiario_Contrato] FOREIGN KEY([ctt_id])
REFERENCES [dbo].[Contrato] ([ctt_id])
GO
ALTER TABLE [dbo].[Beneficiario] CHECK CONSTRAINT [FK_Beneficiario_Contrato]
GO
ALTER TABLE [dbo].[Beneficiario]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiario_GrauParentesco] FOREIGN KEY([gpt_id])
REFERENCES [dbo].[GrauParentesco] ([gpt_id])
GO
ALTER TABLE [dbo].[Beneficiario] CHECK CONSTRAINT [FK_Beneficiario_GrauParentesco]
GO
ALTER TABLE [dbo].[Beneficiario]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiario_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Beneficiario] CHECK CONSTRAINT [FK_Beneficiario_Usuario]
GO