USE [HomBD_Portal_Servico]
GO

/****** Object:  Table [dbo].[DetalheSCC]    Script Date: 01/12/2016 14:58:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DetalheSCC](
	[dsc_id] [int] NOT NULL,
	[dsc_tipo_registro] [varchar](1) NULL,
	[dsc_sequencial_registro] [int] NULL,
	[dsc_chave_operacao] [int] NULL,
	[dsc_codigo_sublinha] [int] NULL,
	[dsc_codigo_convenio] [int] NULL,
	[dsc_codigo_agencia_cliente] [int] NULL,
	[dsc_numero_conta] [int] NULL,
	[dsc_numero_cic_cliente] [int] NULL,
	[dsc_nome_cliente] [varchar](35) NULL,
	[dsc_data_nascimento_cliente] [varchar](8) NULL,
	[dsc_valor_contrato] [int] NULL,
	[dsc_data_liberacao_operacao] [varchar](8) NULL,
	[dsc_data_vencimento_operacao] [varchar](8) NULL,
	[dsc_data_liquidacao_operacao] [varchar](8) NULL,
	[dsc_status_contrato] [int] NULL,
	[dsc_status_seguro] [varchar](1) NULL,
	[dsc_dia_util_debito_seguro] [int] NULL,
	[dsc_quantidade_parcelas] [int] NULL,
	[dsc_origem_contratacao] [varchar](1) NULL,
	[dsc_codigo_regra_seguro] [int] NULL,
	[dsc_valor_taxa_seguro] [decimal](18, 2) NULL,
	[dsc_valor_premio] [decimal](18, 2) NULL,
	[dsc_parcela_unica] [varchar](1) NULL,
 CONSTRAINT [PK_DetlahesSCC] PRIMARY KEY CLUSTERED 
(
	[dsc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


