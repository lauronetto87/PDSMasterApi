/*
=================================================================================================================================================

	Objeto:			Tabela [RegraApolice]
	Data Criação:	23/01/2017
	Desenvolvedor:	Igor Santos
	Descrição:		Script de criação da tabela de regra de apólice
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
CREATE TABLE [prestamista].[RegraApolice](
	[pra_id] [int] IDENTITY(1,1) NOT NULL,
	[pap_id] [int] NOT NULL,
	[pra_descricao] [varchar](250) NOT NULL,
	[pra_grupo] [varchar](10) NOT NULL,
	[pra_val_inicial] [decimal](9, 2) NOT NULL,
	[pra_val_final] [decimal](9, 2) NOT NULL,
	[pra_taxa] [decimal](9, 2) NOT NULL,
	[pra_prazo_mes] [int] NOT NULL,
	[pra_prazo_dia] [int] NULL,
	[pra_lim_idade_ano] [int] NOT NULL,
	[pra_lim_idade_mes] [int] NULL,
	[pra_cobranca] [char](1) NOT NULL,
	[pra_com_banco] [decimal](9, 2) NOT NULL,
	[pra_com_corretora] [decimal](9, 2) NOT NULL,
	[pra_agencia] [int] NULL,
	[pra_conta] [int] NULL,
	[pra_validade_inicial] [datetime] NULL,
	[pra_validade_final] [datetime] NULL,
	[pra_func_banco] [bit] NOT NULL,
	[pra_status] [char](1) NOT NULL,
	[pra_arquivo] [varchar](max) NULL,
	[pra_exem_val] [decimal](9, 2) NULL,
	[pra_exem_qtd_parc] [int] NULL,
	[pra_exem_seguro] [decimal](9, 2) NULL,
	[pra_exem_total] [decimal](9, 2) NULL,
	[pra_data_cad] [datetime] NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[pra_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK_RegrasApolice] PRIMARY KEY CLUSTERED 
(
	[pra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [prestamista].[RegraApolice]  WITH CHECK ADD  CONSTRAINT [FK_RegrasApolice_Apolice] FOREIGN KEY([pap_id])
REFERENCES [prestamista].[Apolice] ([pap_id])
GO
ALTER TABLE [prestamista].[RegraApolice] CHECK CONSTRAINT [FK_RegrasApolice_Apolice]
GO
ALTER TABLE [prestamista].[RegraApolice]  WITH CHECK ADD  CONSTRAINT [FK_RegrasApolice_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [prestamista].[RegraApolice] CHECK CONSTRAINT [FK_RegrasApolice_Usuario]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição da regra' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_descricao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Grupo da regra' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_grupo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor inicial da regra' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_val_inicial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor final da regra' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_val_final'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Taxa da regra' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_taxa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prazo da regra em meses' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_prazo_mes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prazo da regra em dias' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_prazo_dia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Limite de idade da regra em anos' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_lim_idade_ano'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Limite de idade da regra em meses' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_lim_idade_mes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cobrança da regra: M - Mensal, U - Única' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_cobranca'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Comissionamento do banco' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_com_banco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Comissionamento da corretora' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_com_corretora'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Agencia' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_agencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conta' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_conta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Início da validade da regra' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_validade_inicial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Final da validade da regra' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_validade_final'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicador de funcionário do banco' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_func_banco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Situação da regra' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Arquivo da regra' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_arquivo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor de exemplo' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_exem_val'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade de parcelas de exemplo' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_exem_qtd_parc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor do seguro de exemplo' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_exem_seguro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor total do seguro de exemplo' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_exem_total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de cadastro da regra' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_data_cad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuário de cadastro da regra' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'usu_login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Exclusão lógica da regra' , @level0type=N'SCHEMA',@level0name=N'prestamista', @level1type=N'TABLE',@level1name=N'RegraApolice', @level2type=N'COLUMN',@level2name=N'pra_flag_excluido'
GO