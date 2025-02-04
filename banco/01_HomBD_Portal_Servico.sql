/*
=================================================================================================================================================

	Objeto:			Banco de Dados [HomBD_Portal_Servico]
	Data Criação:	17/11/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Script de criação do banco de dados do Portal de Serviços
	Alterações:
		14/12/2016 - Lauro - Inserção de campos na tabela ContratoParcela(cpl_flag_comissao_produtor e cp_flag_comissao_produtor_cancelada),
							 Inserção de campo na tabela Contrato(ctt_flag_pontuacao, ctt_flag_pontuacao_cancelada e 
							 ctt_valor_comissionamento_produtor).

=================================================================================================================================================
*/
USE [master]
ALTER DATABASE [HomBD_Portal_Servico] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
ALTER DATABASE [HomBD_Portal_Servico] SET SINGLE_USER
GO
DROP DATABASE [HomBD_Portal_Servico]
GO
CREATE DATABASE [HomBD_Portal_Servico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomBD_Portal_Servico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HomBD_Portal_Servico.mdf', SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HomBD_Portal_Servico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HomBD_Portal_Servico_log.ldf', SIZE = 112384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HomBD_Portal_Servico] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomBD_Portal_Servico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomBD_Portal_Servico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET RECOVERY FULL 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET  MULTI_USER 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomBD_Portal_Servico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HomBD_Portal_Servico] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HomBD_Portal_Servico]
GO
/****** Object:  Table [dbo].[Banco]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banco](
	[ban_id] [int] IDENTITY(1,1) NOT NULL,
	[ban_codigo] [int] NOT NULL,
	[ban_nome] [varchar](250) NOT NULL,
	[ban_sigla] [varchar](100) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[ban_data_cad] [datetime] NOT NULL,
	[ban_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK_Banco] PRIMARY KEY CLUSTERED 
(
	[ban_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Boleto]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Boleto](
	[blt_id] [bigint] IDENTITY(1,1) NOT NULL,
	[pbl_id] [int] NOT NULL,
	[cpl_id] [bigint] NOT NULL,
	[blt_nosso_numero] [varchar](20) NULL,
	[blt_linha_digitavel] [varchar](100) NULL,
	[blt_data_emissao] [varchar](6) NULL,
	[blt_data_vencimento] [varchar](6) NULL,
	[blt_data_pagamento] [varchar](6) NULL,
	[blt_valor_titulo] [numeric](15, 2) NULL,
	[blt_valor_pago] [numeric](15, 2) NULL,
	[blt_status] [varchar](1) NULL,
	[usu_login] [varchar](50) NULL,
	[blt_codigo_registro] [int] NULL,
	[blt_codigo_inscricao] [varchar](2) NULL,
	[blt_numero_cpf_cnpj] [varchar](14) NULL,
	[blt_codigo_empresa] [varchar](20) NULL,
	[blt_uso_empresa] [varchar](25) NULL,
	[blt_codigo_operacao] [varchar](1) NULL,
	[blt_codigo_ocorrencia] [varchar](2) NULL,
	[blt_seu_numero] [varchar](10) NULL,
	[blt_banco_cobrador] [varchar](3) NULL,
	[blt_agencia_cobradora] [varchar](5) NULL,
	[blt_codigo_especie] [varchar](2) NULL,
	[blt_aceite] [varchar](1) NULL,
	[blt_instrucao] [varchar](2) NULL,
	[blt_taxa_juros] [numeric](15, 2) NULL,
	[blt_instrucao2] [varchar](2) NULL,
	[blt_data_desconto] [varchar](6) NULL,
	[blt_valor_desconto] [numeric](15, 2) NULL,
	[blt_taxa_desconto] [numeric](15, 2) NULL,
	[blt_codigo_sacado] [varchar](2) NULL,
	[blt_numero_sacado] [varchar](14) NULL,
	[blt_nome_sacado] [varchar](40) NULL,
	[blt_endereco_sacado] [varchar](40) NULL,
	[blt_bairro_sacado] [varchar](12) NULL,
	[blt_cep_sacado] [varchar](8) NULL,
	[blt_cidade_sacado] [varchar](15) NULL,
	[blt_estado_sacado] [varchar](2) NULL,
	[blt_moeda] [varchar](2) NULL,
	[blt_sequencia] [varchar](6) NULL,
	[blt_enviado] [varchar](1) NULL,
	[blt_data_envio] [datetime] NULL,
	[blt_nome_arquivo] [varchar](50) NULL,
 CONSTRAINT [PK__Boleto__C5AF44D466B53B20] PRIMARY KEY CLUSTERED 
(
	[blt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CabecalhoRetornoBoleto]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CabecalhoRetornoBoleto](
	[hrb_id] [int] IDENTITY(1,1) NOT NULL,
	[hrb_codigo_registro] [varchar](1) NULL,
	[hrb_codigo_retorno] [varchar](1) NULL,
	[hrb_literal_retorno] [varchar](7) NULL,
	[hrb_codigo_servico] [varchar](13) NULL,
	[hrb_literal_servico] [varchar](15) NULL,
	[hrb_codigo_empresa] [varchar](20) NULL,
	[hrb_nome_empresa] [varchar](30) NULL,
	[hrb_codigo_banco] [varchar](3) NULL,
	[hrb_nome_banco] [varchar](15) NULL,
	[hrb_data_gravacao] [varchar](6) NULL,
	[hrb_codigo_inscricao_empresa] [varchar](2) NULL,
	[hrb_inscricao_empresa] [varchar](14) NULL,
	[hrb_numero_sequencial] [int] NULL,
	[hrb_sequencia] [varchar](6) NULL,
	[hrb_data_leitura] [datetime] NULL,
 CONSTRAINT [PK_CabecalhoRetornoBoleto] PRIMARY KEY CLUSTERED 
(
	[hrb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CabecalhoRetornoDebito]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CabecalhoRetornoDebito](
	[crd_id] [int] IDENTITY(1,1) NOT NULL,
	[crd_codigo_registro] [varchar](1) NULL,
	[crd_codigo_remessa] [varchar](1) NULL,
	[crd_codigo_convenio] [varchar](20) NULL,
	[crd_nome_empresa] [varchar](20) NULL,
	[crd_codigo_banco] [varchar](3) NULL,
	[crd_nome_banco] [varchar](20) NULL,
	[crd_data_geracao] [varchar](8) NULL,
	[crd_numero_sequencial] [int] NULL,
	[crd_versao_layout] [varchar](2) NULL,
	[crd_identificacao_servico] [varchar](17) NULL,
	[crd_data_leitura] [datetime] NULL,
 CONSTRAINT [PK_CabecalhoRetornoDebito] PRIMARY KEY CLUSTERED 
(
	[crd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[cli_id] [int] IDENTITY(1,1) NOT NULL,
	[cli_tipo] [char](1) NOT NULL,
	[cli_cpf_cnpj] [varchar](20) NOT NULL,
	[cli_nome] [varchar](100) NOT NULL,
	[cli_sexo] [char](1) NULL,
	[cli_data_nasc] [datetime] NULL,
	[cli_estado_civil] [char](1) NULL,
	[cli_email] [varchar](100) NULL,
	[cli_status] [char](1) NOT NULL CONSTRAINT [DF_Cliente_cli_status]  DEFAULT ('A'),
	[cli_num_filhos] [int] NULL,
	[cli_identidade] [varchar](20) NULL,
	[cli_orgao_emissor] [varchar](20) NULL,
	[cli_uf_emissao] [varchar](2) NULL,
	[cli_data_emissao] [datetime] NULL,
	[ban_id] [int] NULL,
	[cli_agencia] [varchar](4) NULL,
	[cli_conta] [varchar](10) NULL,
	[usu_login] [varchar](50) NOT NULL,
	[cli_data_cad] [datetime] NOT NULL,
	[cli_flag_excluido] [bit] NOT NULL CONSTRAINT [DF_Cliente_cli_flag_excluido]  DEFAULT ((0)),
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[cli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comissionamento]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comissionamento](
	[com_id] [int] IDENTITY(1,1) NOT NULL,
	[com_descricao] [varchar](100) NOT NULL,
	[com_seg_fixo] [decimal](9, 2) NULL,
	[com_seg_perc] [decimal](9, 2) NULL,
	[com_cor_fixo] [decimal](9, 2) NULL,
	[com_cor_perc] [decimal](9, 2) NULL,
	[com_prod_fixo] [decimal](9, 2) NULL,
	[com_prod_perc] [decimal](9, 2) NULL,
	[com_status] [char](1) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[com_data_cad] [datetime] NOT NULL,
	[com_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK_Comissionamento] PRIMARY KEY CLUSTERED 
(
	[com_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComissionamentoParcela]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ComissionamentoParcela](
	[cop_id] [int] IDENTITY(1,1) NOT NULL,
	[com_id] [int] NOT NULL,
	[cop_parc_ini] [int] NOT NULL,
	[cop_parc_fim] [int] NOT NULL,
	[cop_seg_fixo] [decimal](9, 2) NOT NULL,
	[cop_seg_perc] [decimal](9, 2) NOT NULL,
	[cop_cor_fixo] [decimal](9, 2) NOT NULL,
	[cop_cor_perc] [decimal](9, 2) NOT NULL,
	[cop_prod_fixo] [decimal](9, 2) NOT NULL,
	[cop_prod_perc] [decimal](9, 2) NOT NULL,
	[cop_status] [char](1) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[cop_data_cad] [datetime] NOT NULL,
	[cop_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK_comissionamento_parcela] PRIMARY KEY CLUSTERED 
(
	[cop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contrato]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contrato](
	[ctt_id] [bigint] IDENTITY(1,1) NOT NULL,
	[cli_id] [int] NOT NULL,
	[pdr_id] [int] NOT NULL,
	[pro_id] [int] NOT NULL,
	[ppl_id] [int] NULL,
	[ctt_val_seg] [numeric](15, 2) NULL,
	[ctt_qtd_prest] [int] NULL,
	[ctt_val_prest] [numeric](15, 2) NULL,
	[ctt_data_adesao] [datetime] NULL,
	[ctt_qtd_mes_seg] [int] NULL,
	[ctt_inicio_cobert] [datetime] NULL,
	[ctt_fim_cobert] [datetime] NULL,
	[ctt_valor_segurado] [numeric](15, 2) NULL,
	[ctt_status] [char](1) NULL,
	[ctt_data_cadastro] [datetime] NULL CONSTRAINT [DF__Contrato__Contra__4A18FC72]  DEFAULT (getdate()),
	[usu_login] [varchar](50) NULL,
	[ctt_flag_aceito] [bit] NULL,
	[ctt_flag_pago] [bit] NULL,
	[ctt_flag_enviado] [bit] NULL,
	[ctt_agencia_debito] [varchar](5) NULL,
	[ctt_conta_debito] [varchar](12) NULL,
	[ctt_val_contratado] [numeric](15, 2) NULL,
	[ctt_status_seguro] [char](1) NULL,
	[ctt_chave_operacao] [varchar](13) NULL,
	[ctt_cod_sublinha] [varchar](6) NULL,
	[ctt_cod_convenio] [varchar](6) NULL,
	[ctt_dt_liquidacao] [datetime] NULL,
	[ctt_dia_util_debito] [int] NULL,
	[ctt_origem_contratacao] [char](1) NULL,
	[ctt_cd_regra_seguro] [int] NULL,
	[ctt_vl_taxa_seguro] [numeric](15, 4) NULL,
	[ctt_flag_parc_unica] [char](1) NULL,
	[ctt_quantidade_titulos] [int] NULL,
	[ctt_valor_titulo] [numeric](15, 2) NULL,
	[ctt_valor_total] [numeric](15, 2) NULL,
	[ctt_flag_atual] [bit] NULL,
	[ctt_flag_pontuacao] [bit] NULL,
	[ctt_flag_pontuacao_cancelada] [bit] NULL,
	[ctt_valor_comissionamento_produtor] [numeric] (15,2) null
 CONSTRAINT [PK__Contrato__B238E9734830B400] PRIMARY KEY CLUSTERED 
(
	[ctt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContratoHistorico]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContratoHistorico](
	[cht_id] [bigint] IDENTITY(1,1) NOT NULL,
	[ctt_id] [bigint] NOT NULL,
	[cht_descricao] [varchar](100) NOT NULL,
	[cht_status] [char](1) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[cht_data_cad] [datetime] NOT NULL,
	[cht_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK__Contrato__2567A72A4FD1D5C8] PRIMARY KEY CLUSTERED 
(
	[cht_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContratoParcela]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContratoParcela](
	[cpl_id] [bigint] IDENTITY(1,1) NOT NULL,
	[tcc_id] [int] NOT NULL,
	[ctt_id] [bigint] NOT NULL,
	[cpl_num_parc] [int] NULL,
	[cpl_data_venc] [datetime] NULL,
	[cpl_data_pag] [datetime] NULL,
	[cpl_valor] [numeric](15, 2) NULL,
	[cpl_status] [char](1) NOT NULL,
	[cpl_data_cad] [datetime] NOT NULL CONSTRAINT [DF__ContratoP__Contr__5C37ACAD]  DEFAULT (getdate()),
	[usu_login] [varchar](50) NOT NULL,
	[cpl_val_pag] [numeric](15, 2) NULL,
	[cpl_flag_comissao_produtor] [bit] NULL,
	[cpl_flag_comissao_produtor_cancelada] [bit] NULL,
 CONSTRAINT [PK__Contrato__E1421A0F5A4F643B] PRIMARY KEY CLUSTERED 
(
	[cpl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContratoPlano]    Script Date: 22/11/2016 14:19:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContratoPlano](
	[ctp_id] [bigint] IDENTITY(1,1) NOT NULL,
	[ctt_id] [bigint] NOT NULL,
	[pro_id] [int] NOT NULL,
	[ppl_id] [int] NOT NULL,
	[ctp_quantidade_prestacao] [int] NOT NULL,
	[ctp_valor_prestacao] [numeric](15, 2) NULL,
	[ctp_quantidade_titulos] [int] NULL,
	[ctp_valor_titulo] [numeric](15, 2) NULL,
	[ctp_valor_total] [numeric](15, 2) NULL,
 CONSTRAINT [PK_ContratoPlanos] PRIMARY KEY CLUSTERED 
(
	[ctp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DebitoAutomatico]    Script Date: 22/11/2016 14:19:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DebitoAutomatico](
	[dau_id] [bigint] IDENTITY(1,1) NOT NULL,
	[cpl_id] [bigint] NOT NULL,
	[dau_data_envio] [datetime] NULL,
	[dau_ident_cliente] [varchar](20) NULL,
	[dau_agencia] [varchar](4) NULL,
	[dau_data_vencimento] [datetime] NULL,
	[dau_valor] [numeric](15, 2) NULL,
	[dau_status] [char](1) NOT NULL,
	[dau_data_cad] [datetime] NOT NULL CONSTRAINT [DF__DebitoAut__Debit__62E4AA3C]  DEFAULT (getdate()),
	[usu_login] [varchar](50) NOT NULL,
	[dau_conta_cliente] [varchar](9) NULL,
	[dau_data_resumida] [datetime] NULL,
	[dau_cpf_cnpj] [varchar](14) NULL,
	[dau_data_pagamento] [varchar](8) NULL,
	[dau_valor_pago] [decimal](15, 2) NULL,
 CONSTRAINT [PK__DebitoAu__DFBA142360FC61CA] PRIMARY KEY CLUSTERED 
(
	[dau_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalheRetornoBoleto]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalheRetornoBoleto](
	[drb_id] [int] IDENTITY(1,1) NOT NULL,
	[drb_codigo_registro] [varchar](1) NULL,
	[drb_codigo_inscricao] [varchar](2) NULL,
	[drb_numero_inscricao_empresa] [varchar](14) NULL,
	[drb_codigo_empresa] [varchar](20) NULL,
	[drb_uso_empresa] [varchar](25) NULL,
	[drb_nosso_numero] [varchar](20) NULL,
	[drb_brancos] [varchar](25) NULL,
	[drb_codigo_operacao] [varchar](1) NULL,
	[drb_codigo_ocorrencia] [varchar](2) NULL,
	[drb_data_ocorrencia] [varchar](6) NULL,
	[drb_seu_numero] [varchar](10) NULL,
	[drb_brancos_2] [varchar](20) NULL,
	[drb_data_vencimento] [varchar](6) NULL,
	[drb_valor_titulo] [varchar](13) NULL,
	[drb_banco_recebedor] [varchar](3) NULL,
	[drb_agencia_recebedora] [varchar](5) NULL,
	[drb_codigo_especie] [varchar](2) NULL,
	[drb_tarifa_cobranca] [varchar](13) NULL,
	[drb_outras_despesas] [varchar](13) NULL,
	[drb_juros_descontados] [varchar](13) NULL,
	[drb_valor_iof] [varchar](13) NULL,
	[drb_abatimento] [varchar](13) NULL,
	[drb_valor_desconto] [varchar](13) NULL,
	[drb_valor_pago] [varchar](13) NULL,
	[drb_juros_mora] [varchar](13) NULL,
	[drb_outros_creditos] [varchar](13) NULL,
	[drb_brancos_3] [varchar](9) NULL,
	[drb_confirmacao_codigo_mora] [varchar](1) NULL,
	[drb_confirmacao_mora_acobrar] [varchar](12) NULL,
	[drb_confirmacao_desconto] [varchar](6) NULL,
	[drb_confirmacao_valor_desconto] [varchar](13) NULL,
	[drb_confirmacao_instrucao_1] [varchar](2) NULL,
	[drb_confirmacao_instrucao_2] [varchar](2) NULL,
	[drb_brancos_4] [varchar](54) NULL,
	[drb_confirmacao_protesto_baixa_automatica] [varchar](2) NULL,
	[drb_codigo_moeda] [varchar](1) NULL,
	[drb_sequencia] [varchar](6) NULL,
	[drb_numero_retorno] [varchar](6) NULL,
 CONSTRAINT [PK_DetalheRetornoBoleto] PRIMARY KEY CLUSTERED 
(
	[drb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalheRetornoDebito]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalheRetornoDebito](
	[drd_id] [int] IDENTITY(1,1) NOT NULL,
	[drd_codigo_registro] [varchar](1) NULL,
	[drd_identificacao_cliente_empresa] [varchar](25) NULL,
	[drd_agencia_debito] [varchar](4) NULL,
	[drd_identificacao_cliente_banco] [varchar](14) NULL,
	[drd_data_vencimento] [varchar](8) NULL,
	[drd_valor_debitado] [varchar](15) NULL,
	[drd_codigo_retorno] [varchar](2) NULL,
	[drd_uso_empresa] [varchar](60) NULL,
	[drd_tipo_identificacao] [varchar](1) NULL,
	[drd_identificacao] [varchar](15) NULL,
	[drd_codigo_movimento] [varchar](1) NULL,
	[drd_numero_sequencial] [varchar](6) NULL,
 CONSTRAINT [PK_DetalheRetornoDebito] PRIMARY KEY CLUSTERED 
(
	[drd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Endereco](
	[end_id] [int] IDENTITY(1,1) NOT NULL,
	[cli_id] [int] NOT NULL,
	[end_tipo] [char](1) NOT NULL,
	[end_cep] [varchar](8) NULL,
	[end_logradouro] [varchar](70) NULL,
	[end_num] [varchar](10) NULL,
	[end_complemento] [varchar](70) NULL,
	[end_bairro] [varchar](25) NULL,
	[end_cidade] [varchar](35) NULL,
	[end_uf] [varchar](2) NULL,
	[end_flag_atual] [bit] NOT NULL,
	[end_status] [char](1) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[end_data_cad] [datetime] NOT NULL CONSTRAINT [DF__Endereco__Endere__3EA749C6]  DEFAULT (getdate()),
	[end_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK__Endereco__B9D946CF3CBF0154] PRIMARY KEY CLUSTERED 
(
	[end_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Evento](
	[evt_id] [int] IDENTITY(1,1) NOT NULL,
	[fcd_id] [int] NOT NULL,
	[evt_descricao] [varchar](150) NOT NULL,
	[evt_acao] [varchar](150) NOT NULL,
	[evt_status] [char](1) NOT NULL CONSTRAINT [DF__Evento__EventoSt__1DB06A4F]  DEFAULT ('A'),
	[usu_login] [varchar](50) NOT NULL,
	[evt_data_cad] [datetime] NOT NULL,
	[evt_flag_excluido] [bit] NOT NULL CONSTRAINT [DF_Evento_evt_flag_excluido]  DEFAULT ((0)),
 CONSTRAINT [PK__Evento__1EEB59211BC821DD] PRIMARY KEY CLUSTERED 
(
	[evt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExtratoComissionamento]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExtratoComissionamento](
	[exc_id] [int] IDENTITY(1,1) NOT NULL,
	[ctt_id] [bigint] NOT NULL,
	[exc_num_parc] [int] NOT NULL,
	[com_id] [int] NOT NULL,
	[pdr_id] [int] NOT NULL,
	[exc_tipo] [char](1) NOT NULL,
	[exc_val_seg] [decimal](9, 2) NULL,
	[exc_val_prod] [decimal](9, 2) NULL,
	[exc_val_cor] [decimal](9, 2) NULL,
	[exc_data_geracao] [datetime] NOT NULL,
	[exc_data_repasse] [datetime] NULL,
	[usu_login] [varchar](50) NOT NULL,
	[exc_data_cad] [datetime] NOT NULL,
 CONSTRAINT [PK_ExtratoComissionamento] PRIMARY KEY CLUSTERED 
(
	[exc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExtratoPontuacao]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExtratoPontuacao](
	[exp_id] [int] IDENTITY(1,1) NOT NULL,
	[ctt_id] [bigint] NOT NULL,
	[pdr_id] [int] NOT NULL,
	[exp_tipo] [char](1) NOT NULL,
	[exp_pontuacao] [decimal](9, 2) NOT NULL,
	[exp_data_geracao] [datetime] NOT NULL,
	[exp_data_expiracao] [datetime] NOT NULL,
	[exp_data_cad] [datetime] NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ExtratoPontuacao] PRIMARY KEY CLUSTERED 
(
	[exp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Funcionalidade]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Funcionalidade](
	[fcd_id] [int] IDENTITY(1,1) NOT NULL,
	[fcd_descricao] [varchar](50) NOT NULL,
	[fcd_controller] [varchar](100) NOT NULL,
	[fcd_status] [char](1) NOT NULL CONSTRAINT [DF__Funcional__Funci__1332DBDC]  DEFAULT ('A'),
	[usu_login] [varchar](50) NOT NULL,
	[fcd_data_cad] [datetime] NOT NULL,
	[fcd_flag_excluido] [bit] NOT NULL CONSTRAINT [DF_Funcionalidade_fcd_flag_excluido]  DEFAULT ((0)),
 CONSTRAINT [PK__Funciona__FA2A83A5114A936A] PRIMARY KEY CLUSTERED 
(
	[fcd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Imagem]    Script Date: 22/11/2016 14:19:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Imagem](
	[img_id] [int] IDENTITY(1,1) NOT NULL,
	[img_tipo] [char](1) NOT NULL,
	[img_nome] [varchar](100) NOT NULL,
	[img_descricao] [varchar](200) NULL,
	[img_caminho] [varchar](150) NOT NULL,
	[img_ordem] [int] NULL,
	[img_status] [char](1) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[img_dat_cad] [datetime] NOT NULL,
	[img_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK_Imagem] PRIMARY KEY CLUSTERED 
(
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InfoMobile]    Script Date: 22/11/2016 14:19:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InfoMobile](
	[ifb_id] [int] IDENTITY(1,1) NOT NULL,
	[ust_id] [int] NOT NULL,
	[ifb_modelo] [varchar](250) NOT NULL,
	[ifb_plataforma] [varchar](250) NOT NULL,
	[ifb_uuid] [varchar](300) NULL,
	[ifb_serial] [varchar](300) NULL,
	[ifb_versao_so] [varchar](200) NOT NULL,
	[ifb_fabricante] [varchar](200) NOT NULL,
	[ifb_token_push] [varchar](300) NOT NULL,
	[ifb_virtual] [bit] NOT NULL,
 CONSTRAINT [PK_InfoMobile] PRIMARY KEY CLUSTERED 
(
	[ifb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogRemessaBoleto]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogRemessaBoleto](
	[lrb_id] [int] IDENTITY(1,1) NOT NULL,
	[lrb_nome_arquivo] [varchar](50) NOT NULL,
	[lrb_quantidade_registro] [int] NOT NULL,
	[lrb_caminho_arquivo] [varchar](100) NOT NULL,
	[lrb_data_geracao] [datetime] NOT NULL,
	[lrb_data_geracao_resumida] [datetime] NULL,
 CONSTRAINT [PK_LogRemessaBoleto] PRIMARY KEY CLUSTERED 
(
	[lrb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogRemessaDebito]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogRemessaDebito](
	[lrd_id] [int] IDENTITY(1,1) NOT NULL,
	[lrd_nome_arquivo] [varchar](50) NULL,
	[lrd_quantidade_registros] [int] NULL,
	[lrd_caminho_arquivo] [varchar](100) NULL,
	[lrd_data_geracao] [datetime] NULL,
	[lrd_data_geracao_resumida] [datetime] NULL,
 CONSTRAINT [PK_LogRemessaDebito] PRIMARY KEY CLUSTERED 
(
	[lrd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[men_id] [int] IDENTITY(1,1) NOT NULL,
	[men_titulo] [varchar](50) NOT NULL,
	[evt_id] [int] NULL,
	[men_pai] [int] NULL,
	[men_ordem] [int] NOT NULL,
	[men_icon] [varchar](100) NULL,
	[men_status] [char](1) NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[men_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parametro]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parametro](
	[prt_id] [int] IDENTITY(1,1) NOT NULL,
	[prt_chave] [varchar](50) NOT NULL,
	[prt_valor] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Parametro] PRIMARY KEY CLUSTERED 
(
	[prt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ParametroBoleto]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParametroBoleto](
	[pbl_id] [int] IDENTITY(1,1) NOT NULL,
	[pbl_cod_emp] [varchar](20) NULL,
	[pbl_nome_emp] [varchar](100) NULL,
	[pbl_cod_inscricao] [varchar](2) NULL,
	[pbl_inscricao] [varchar](20) NULL,
	[pbl_seq_remessa] [int] NULL,
	[pbl_ult_remessa] [datetime] NULL,
	[pbl_seq_retorno] [int] NULL,
	[pbl_ult_retorno] [datetime] NULL,
	[pbl_status] [char](1) NULL,
	[pbl_carteira] [varchar](10) NULL,
	[pbl_cnpj] [varchar](18) NULL,
	[pbl_agencia] [varchar](3) NULL,
	[pbl_conta] [varchar](7) NULL,
	[pbl_digito_conta] [varchar](1) NULL,
	[pbl_codigo_cedente] [varchar](3) NULL,
	[pbl_codigo_banco] [int] NULL,
	[pbl_tipo_conta] [varchar](2) NULL,
 CONSTRAINT [PK__Parametr__43E67E811E3A7A34] PRIMARY KEY CLUSTERED 
(
	[pbl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ParametrosBaneseCard]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParametrosBaneseCard](
	[pbc_LojistaNumero] [int] NOT NULL,
	[pbc_LojistaChave] [varchar](100) NOT NULL,
	[pbc_PortadorIndicador] [int] NOT NULL,
	[pbc_PedidoMoeda] [int] NOT NULL,
	[pbc_PedidoIdioma] [char](2) NOT NULL,
	[pbc_FormaPagamentoBandeira] [varchar](50) NOT NULL,
	[pbc_Autorizar] [int] NOT NULL,
	[pbc_Capturar] [varchar](10) NOT NULL,
	[pbc_Bin] [int] NOT NULL,
	[pbc_GerarToken] [varchar](10) NOT NULL,
	[pbc_Versao] [varchar](5) NOT NULL,
	[pbc_Xmlns] [nchar](50) NOT NULL,
	[pbc_Codigo] [int] NOT NULL,
	[pbc_URL] [varchar](100) NULL,
 CONSTRAINT [PK_ParametrosBaneseCard] PRIMARY KEY CLUSTERED 
(
	[pbc_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ParametrosDebitoAutomatico]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParametrosDebitoAutomatico](
	[pda_id] [int] IDENTITY(1,1) NOT NULL,
	[pda_codigo_convenio] [varchar](20) NULL,
	[pda_nome_empresa] [varchar](20) NULL,
	[pda_codigo_banco] [varchar](3) NULL,
	[pda_nome_banco] [varchar](20) NULL,
	[pda_numero_sequencial] [int] NULL,
	[pda_numero_sequencial_retorno] [int] NULL,
 CONSTRAINT [PK_ParametrosDebitoAutomatico] PRIMARY KEY CLUSTERED 
(
	[pda_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfil](
	[pfl_id] [int] IDENTITY(1,1) NOT NULL,
	[pfl_nome] [varchar](20) NOT NULL,
	[pfl_status] [char](1) NOT NULL CONSTRAINT [DF__Perfil__PerfilSt__0E6E26BF]  DEFAULT ('A'),
	[usu_login] [varchar](50) NOT NULL,
	[pfl_data_cad] [datetime] NOT NULL,
	[pfl_flag_excluido] [bit] NOT NULL CONSTRAINT [DF_Perfil_pfl_flag_excluido]  DEFAULT ((0)),
 CONSTRAINT [PK__Perfil__0C005B060C85DE4D] PRIMARY KEY CLUSTERED 
(
	[pfl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PerfilEvento]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilEvento](
	[pev_id] [int] IDENTITY(1,1) NOT NULL,
	[pfl_id] [int] NOT NULL,
	[evt_id] [int] NOT NULL,
 CONSTRAINT [PK_PerfilEvento] PRIMARY KEY CLUSTERED 
(
	[pev_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Produto]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produto](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[ram_id] [int] NOT NULL,
	[seg_id] [int] NOT NULL,
	[com_id] [int] NULL,
	[pro_nome] [varchar](100) NULL,
	[pro_descricao] [varchar](1000) NULL,
	[pro_categoria] [char](1) NULL,
	[pro_min_parc] [int] NULL,
	[pro_max_parc] [int] NULL,
	[pro_cod_na_segur] [varchar](10) NULL,
	[pro_tipo_premio] [char](1) NULL,
	[pro_data_cad] [datetime] NOT NULL,
	[pro_status] [char](1) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[pro_meses_cobert] [int] NULL,
	[pro_imagem] [varchar](max) NULL,
	[pro_introducao] [varchar](max) NULL,
	[pro_coberturas] [varchar](max) NULL,
	[pro_beneficios] [varchar](max) NULL,
	[pro_comissionamento] [varchar](max) NULL,
	[pro_video] [varchar](max) NULL,
	[pro_rodape] [varchar](max) NULL,
	[pro_imagem_mob] [varchar](max) NULL,
	[pro_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK__Produto__9C8800E34277DAAA] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProdutoPlano]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProdutoPlano](
	[ppl_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_id] [int] NOT NULL,
	[ppl_numero] [int] NULL,
	[ppl_val_morte] [numeric](15, 2) NULL,
	[ppl_val_invalidez] [numeric](15, 2) NULL,
	[ppl_premio] [numeric](15, 2) NULL,
	[ppl_valor_titulo] [numeric](15, 2) NULL,
	[ppl_pontuacao] [decimal](9, 2) NOT NULL,
	[ppl_data_cad] [datetime] NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[ppl_flag_excluido] [bit] NOT NULL,
	[ppl_valor_minimo] [numeric](15, 2) NULL,
	[ppl_valor_maximo] [numeric](15, 2) NULL,
 CONSTRAINT [PK__ProdutoP__9AFB04BE558AAF1E] PRIMARY KEY CLUSTERED 
(
	[ppl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produtor]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produtor](
	[pdr_id] [int] IDENTITY(1,1) NOT NULL,
	[uad_id] [int] NOT NULL,
	[pdr_nome] [varchar](60) NOT NULL,
	[pdr_matricula] [varchar](10) NULL,
	[pdr_cpf_cnpj] [varchar](20) NULL,
	[pdr_agencia] [varchar](4) NULL,
	[pdr_conta] [varchar](10) NULL,
	[pdr_identidade] [varchar](20) NULL,
	[pdr_email] [varchar](100) NULL,
	[pdr_ddd] [varchar](4) NULL,
	[pdr_telefone] [varchar](20) NULL,
	[pdr_status] [char](1) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[pdr_data_cad] [datetime] NOT NULL CONSTRAINT [DF__Produtor__Produt__3335971A]  DEFAULT (getdate()),
	[pdr_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK__Produtor__3F1A4D68314D4EA8] PRIMARY KEY CLUSTERED 
(
	[pdr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProdutorUsuario]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProdutorUsuario](
	[pdu_id] [int] IDENTITY(1,1) NOT NULL,
	[pdr_id] [int] NOT NULL,
	[usu_id] [int] NOT NULL,
	[pdu_padrao] [bit] NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[pdu_data_cad] [datetime] NOT NULL,
 CONSTRAINT [PK_ProdutorUsuario] PRIMARY KEY CLUSTERED 
(
	[pdu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ramo]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ramo](
	[ram_id] [int] IDENTITY(1,1) NOT NULL,
	[ram_nome] [varchar](50) NOT NULL,
	[ram_status] [char](1) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[ram_data_cad] [datetime] NOT NULL,
	[ram_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK__Ramo__D6FF43031A69E950] PRIMARY KEY CLUSTERED 
(
	[ram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RequisicaoTransacao]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequisicaoTransacao](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Lojista_Numero] [nvarchar](max) NULL,
	[Lojista_Chave] [nvarchar](max) NULL,
	[Portador_Numero] [nvarchar](max) NULL,
	[Portador_Validade] [nvarchar](max) NULL,
	[Portador_Indicador] [nvarchar](max) NULL,
	[Portador_CodigoSeguranca] [nvarchar](max) NULL,
	[Portador_NomePortador] [nvarchar](max) NULL,
	[Pedido_Numero] [bigint] NULL,
	[Pedido_Valor] [decimal](18, 2) NULL,
	[Pedido_Moeda] [nvarchar](max) NULL,
	[Pedido_DataHora] [datetime2](7) NULL,
	[Pedido_Idioma] [nvarchar](max) NULL,
	[Pedido_SoftDescriptor] [nvarchar](max) NULL,
	[FormaPagamento_Bandeira] [nvarchar](max) NULL,
	[FormaPagamento_Produto] [nvarchar](max) NULL,
	[FormaPagamento_Parcelas] [nvarchar](max) NULL,
	[Autorizar] [nvarchar](max) NULL,
	[Capturar] [nvarchar](max) NULL,
	[CampoLivre] [nvarchar](max) NULL,
	[Bin] [nvarchar](max) NULL,
	[GerarToken] [nvarchar](max) NULL,
	[Versao] [nvarchar](max) NULL,
	[Xmlns] [nvarchar](max) NULL,
	[TidRetorno] [nvarchar](max) NULL,
	[StatusRetorno] [nvarchar](max) NULL,
	[ParcelaID] [bigint] NULL,
 CONSTRAINT [PK_dbo.RequisicaoTransacaos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RetornoRequisicao]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RetornoRequisicao](
	[RetornoId] [bigint] IDENTITY(1,1) NOT NULL,
	[Tid] [nvarchar](max) NULL,
	[Pedido_Numero] [nvarchar](max) NULL,
	[Pedido_Valor] [decimal](18, 2) NULL,
	[Pedido_Moeda] [nvarchar](max) NULL,
	[Pedido_DataHora] [datetime2](7) NULL,
	[Pedido_Idioma] [nvarchar](max) NULL,
	[Pedido_SoftDescriptor] [nvarchar](max) NULL,
	[FormaPagamento_Bandeira] [nvarchar](max) NULL,
	[FormaPagamento_Produto] [nvarchar](max) NULL,
	[FormaPagamento_Parcela] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Autorizacao_Codigo] [nvarchar](max) NULL,
	[Autorizacao_Mensagem] [nvarchar](max) NULL,
	[Autorizacao_DataHora] [datetime2](7) NULL,
	[Autorizacao_Valor] [decimal](18, 2) NULL,
	[Autorizacao_Nsu] [nvarchar](max) NULL,
	[Captura_Codigo] [nvarchar](max) NULL,
	[Captura_Mensagem] [nvarchar](max) NULL,
	[Captura_DataHora] [datetime2](7) NULL,
	[Captura_Valor] [decimal](18, 2) NULL,
	[ErroRequisicao_Codigo] [nvarchar](max) NULL,
	[ErroRequisicao_Mensagem] [nvarchar](max) NULL,
	[ErroRequisicao_DataHora] [datetime2](7) NULL,
	[RequisicaoId] [bigint] NULL,
 CONSTRAINT [PK_RetornoRequisicao] PRIMARY KEY CLUSTERED 
(
	[RetornoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seguradora]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seguradora](
	[seg_id] [int] IDENTITY(1,1) NOT NULL,
	[seg_nome] [varchar](100) NULL,
	[seg_nome_abrev] [varchar](20) NULL,
	[seg_status] [char](1) NOT NULL,
	[seg_data_cad] [datetime] NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[seg_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK__Segurado__6B6BF6D5220B0B18] PRIMARY KEY CLUSTERED 
(
	[seg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Senha]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Senha](
	[sen_id] [int] IDENTITY(1,1) NOT NULL,
	[usu_id] [int] NOT NULL,
	[sen_valor] [varchar](100) NOT NULL,
	[sen_validade] [datetime] NOT NULL,
	[sen_status] [char](1) NOT NULL,
	[sen_alt_senha] [bit] NOT NULL,
	[sen_token] [varchar](10) NULL,
	[sen_validade_token] [datetime] NULL,
 CONSTRAINT [PK_Senha] PRIMARY KEY CLUSTERED 
(
	[sen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Telefone]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Telefone](
	[tel_id] [int] IDENTITY(1,1) NOT NULL,
	[cli_id] [int] NOT NULL,
	[tel_tipo] [char](1) NOT NULL,
	[tel_ddi] [varchar](4) NOT NULL,
	[tel_ddd] [varchar](4) NOT NULL,
	[tel_numero] [varchar](20) NOT NULL,
	[tel_flag_sms] [bit] NOT NULL,
	[tel_principal] [bit] NOT NULL,
	[tel_status] [char](1) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[tel_data_cad] [datetime] NOT NULL CONSTRAINT [DF__Telefone__Telefo__38EE7070]  DEFAULT (getdate()),
	[tel_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK_Telefone] PRIMARY KEY CLUSTERED 
(
	[tel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoCobranca]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoCobranca](
	[tcc_id] [int] IDENTITY(1,1) NOT NULL,
	[tcc_descricao] [varchar](50) NOT NULL,
	[tcc_status] [char](1) NOT NULL,
	[tcc_data_cad] [datetime] NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[tcc_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK__TipoCobr__41BE2EFC29AC2CE0] PRIMARY KEY CLUSTERED 
(
	[tcc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UnidadeAdministrativa]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UnidadeAdministrativa](
	[uad_id] [int] IDENTITY(1,1) NOT NULL,
	[uad_codigo] [int] NOT NULL,
	[uad_nome] [varchar](60) NOT NULL,
	[uad_cod_contabil] [int] NULL,
	[uad_email] [varchar](100) NULL,
	[uad_cnpj] [varchar](20) NULL,
	[uad_status] [char](1) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[uad_data_cad] [datetime] NOT NULL,
	[uad_flag_excluido] [bit] NOT NULL,
 CONSTRAINT [PK_UnidadeAdministrativa] PRIMARY KEY CLUSTERED 
(
	[uad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[usu_id] [int] IDENTITY(1,1) NOT NULL,
	[pfl_id] [int] NOT NULL,
	[uad_id] [int] NULL,
	[usu_login] [varchar](50) NOT NULL,
	[usu_nome] [varchar](50) NOT NULL,
	[usu_cpf_cnpj] [varchar](20) NOT NULL,
	[usu_senha] [varchar](100) NOT NULL,
	[usu_ddi] [varchar](4) NULL,
	[usu_ddd] [varchar](4) NULL,
	[usu_celular] [varchar](20) NULL,
	[usu_email] [varchar](100) NOT NULL,
	[usu_status] [char](1) NOT NULL CONSTRAINT [DF__Usuario__Usuario__17F790F9]  DEFAULT ('A'),
	[usu_tent_login] [int] NULL CONSTRAINT [DF_Usuario_usu_tent_login]  DEFAULT ((0)),
	[usu_token] [varchar](10) NULL,
	[usu_val_token] [datetime] NULL,
	[usu_alt_senha] [bit] NOT NULL CONSTRAINT [DF_Usuario_usu_novo]  DEFAULT ((1)),
	[usu_flag_excluido] [bit] NOT NULL CONSTRAINT [DF_Usuario_usu_flag_excluido]  DEFAULT ((0)),
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[usu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioToken]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioToken](
	[ust_id] [int] IDENTITY(1,1) NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[ust_token] [varchar](100) NULL,
	[ust_data_login] [datetime] NOT NULL,
	[ust_data_val] [datetime] NULL,
	[ust_status] [char](1) NOT NULL,
	[ust_tpo_acesso] [char](1) NULL,
	[ust_ip_interno] [varchar](15) NULL,
	[ust_ip_externo] [varchar](15) NULL,
	[ust_maquina] [varchar](50) NULL,
	[ust_sucesso] [bit] NOT NULL,
	[ust_navegador] [varchar](250) NULL,
	[ust_pais] [varchar](250) NULL,
	[ust_estado] [varchar](250) NULL,
	[ust_municipio] [varchar](250) NULL,
 CONSTRAINT [PK_UsuarioToken] PRIMARY KEY CLUSTERED 
(
	[ust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [Boleto_FKContratoParcela]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [Boleto_FKContratoParcela] ON [dbo].[Boleto]
(
	[cpl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Boleto_FKParametroBoleto]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [Boleto_FKParametroBoleto] ON [dbo].[Boleto]
(
	[pbl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Cliente]    Script Date: 17/11/2016 17:16:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cliente] ON [dbo].[Cliente]
(
	[cli_cpf_cnpj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Contrato_FKCliente]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [Contrato_FKCliente] ON [dbo].[Contrato]
(
	[cli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Contrato_FKProduto]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [Contrato_FKProduto] ON [dbo].[Contrato]
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Contrato_FKProdutor]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [Contrato_FKProdutor] ON [dbo].[Contrato]
(
	[pdr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ContratoHistorico_FKContrato]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [ContratoHistorico_FKContrato] ON [dbo].[ContratoHistorico]
(
	[ctt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ContratoParcela_FKContrato]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [ContratoParcela_FKContrato] ON [dbo].[ContratoParcela]
(
	[ctt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ContratoParcela_FKTipoCobranca]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [ContratoParcela_FKTipoCobranca] ON [dbo].[ContratoParcela]
(
	[tcc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [DebitoAutomatico_FKContratoParcela]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [DebitoAutomatico_FKContratoParcela] ON [dbo].[DebitoAutomatico]
(
	[cpl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Endereco_FKCliente]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [Endereco_FKCliente] ON [dbo].[Endereco]
(
	[cli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Evento_FKFuncionalidade]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [Evento_FKFuncionalidade] ON [dbo].[Evento]
(
	[fcd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_RelFuncionalidadeEvento]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [IFK_RelFuncionalidadeEvento] ON [dbo].[Evento]
(
	[fcd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Parametro]    Script Date: 17/11/2016 17:16:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Parametro] ON [dbo].[Parametro]
(
	[prt_chave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_RelEventoPerfil]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [IFK_RelEventoPerfil] ON [dbo].[PerfilEvento]
(
	[evt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_RelPerfilEvento]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [IFK_RelPerfilEvento] ON [dbo].[PerfilEvento]
(
	[pfl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PerfilEvento_FKEvento]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [PerfilEvento_FKEvento] ON [dbo].[PerfilEvento]
(
	[evt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PerfilEvento_FKPerfil]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [PerfilEvento_FKPerfil] ON [dbo].[PerfilEvento]
(
	[pfl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Produto_FKRamo]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [Produto_FKRamo] ON [dbo].[Produto]
(
	[ram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Produto_FKSeguradora]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [Produto_FKSeguradora] ON [dbo].[Produto]
(
	[seg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ProdutoPlano_FKProduto]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [ProdutoPlano_FKProduto] ON [dbo].[ProdutoPlano]
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Produtor_FKUnidade]    Script Date: 17/11/2016 17:16:46 ******/
CREATE NONCLUSTERED INDEX [Produtor_FKUnidade] ON [dbo].[Produtor]
(
	[uad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Usuario_CpfCnpj]    Script Date: 17/11/2016 17:16:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Usuario_CpfCnpj] ON [dbo].[Usuario]
(
	[usu_cpf_cnpj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Usuario_Email]    Script Date: 17/11/2016 17:16:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Usuario_Email] ON [dbo].[Usuario]
(
	[usu_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Usuario_Login]    Script Date: 17/11/2016 17:16:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Usuario_Login] ON [dbo].[Usuario]
(
	[usu_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Banco]  WITH CHECK ADD  CONSTRAINT [FK_Banco_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Banco] CHECK CONSTRAINT [FK_Banco_Usuario]
GO
ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK__Boleto__Parametr__6991A7CB] FOREIGN KEY([pbl_id])
REFERENCES [dbo].[ParametroBoleto] ([pbl_id])
GO
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK__Boleto__Parametr__6991A7CB]
GO
ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Contrato] FOREIGN KEY([cpl_id])
REFERENCES [dbo].[ContratoParcela] ([cpl_id])
GO
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Contrato]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Banco] FOREIGN KEY([ban_id])
REFERENCES [dbo].[Banco] ([ban_id])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Banco]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Usuario]
GO
ALTER TABLE [dbo].[Comissionamento]  WITH CHECK ADD  CONSTRAINT [FK_Comissionamento_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Comissionamento] CHECK CONSTRAINT [FK_Comissionamento_Usuario]
GO
ALTER TABLE [dbo].[ComissionamentoParcela]  WITH CHECK ADD  CONSTRAINT [FK_comissionamento_parcela_Comissionamento] FOREIGN KEY([com_id])
REFERENCES [dbo].[Comissionamento] ([com_id])
GO
ALTER TABLE [dbo].[ComissionamentoParcela] CHECK CONSTRAINT [FK_comissionamento_parcela_Comissionamento]
GO
ALTER TABLE [dbo].[ComissionamentoParcela]  WITH CHECK ADD  CONSTRAINT [FK_comissionamento_parcela_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[ComissionamentoParcela] CHECK CONSTRAINT [FK_comissionamento_parcela_Usuario]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [FK_Contrato_Produto] FOREIGN KEY([pro_id])
REFERENCES [dbo].[Produto] ([pro_id])
GO
ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [FK_Contrato_Produto]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [FK_Contrato_ProdutoPlano] FOREIGN KEY([ppl_id])
REFERENCES [dbo].[ProdutoPlano] ([ppl_id])
GO
ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [FK_Contrato_ProdutoPlano]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [FK_Contrato_Produtor] FOREIGN KEY([pdr_id])
REFERENCES [dbo].[Produtor] ([pdr_id])
GO
ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [FK_Contrato_Produtor]
GO
ALTER TABLE [dbo].[ContratoHistorico]  WITH CHECK ADD  CONSTRAINT [FK_ContratoHistorico_Contrato] FOREIGN KEY([ctt_id])
REFERENCES [dbo].[Contrato] ([ctt_id])
GO
ALTER TABLE [dbo].[ContratoHistorico] CHECK CONSTRAINT [FK_ContratoHistorico_Contrato]
GO
ALTER TABLE [dbo].[ContratoHistorico]  WITH CHECK ADD  CONSTRAINT [FK_ContratoHistorico_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[ContratoHistorico] CHECK CONSTRAINT [FK_ContratoHistorico_Usuario]
GO
ALTER TABLE [dbo].[ContratoParcela]  WITH CHECK ADD  CONSTRAINT [FK_ContratoParcela_Contrato] FOREIGN KEY([ctt_id])
REFERENCES [dbo].[Contrato] ([ctt_id])
GO
ALTER TABLE [dbo].[ContratoParcela] CHECK CONSTRAINT [FK_ContratoParcela_Contrato]
GO
ALTER TABLE [dbo].[ContratoParcela]  WITH CHECK ADD  CONSTRAINT [FK_ContratoParcela_TipoCobranca] FOREIGN KEY([tcc_id])
REFERENCES [dbo].[TipoCobranca] ([tcc_id])
GO
ALTER TABLE [dbo].[ContratoParcela] CHECK CONSTRAINT [FK_ContratoParcela_TipoCobranca]
GO
ALTER TABLE [dbo].[ContratoParcela]  WITH CHECK ADD  CONSTRAINT [FK_ContratoParcela_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[ContratoParcela] CHECK CONSTRAINT [FK_ContratoParcela_Usuario]
GO
ALTER TABLE [dbo].[DebitoAutomatico]  WITH CHECK ADD  CONSTRAINT [FK_DebitoAutomatico_ContratoParcela] FOREIGN KEY([cpl_id])
REFERENCES [dbo].[ContratoParcela] ([cpl_id])
GO
ALTER TABLE [dbo].[DebitoAutomatico] CHECK CONSTRAINT [FK_DebitoAutomatico_ContratoParcela]
GO
ALTER TABLE [dbo].[DebitoAutomatico]  WITH CHECK ADD  CONSTRAINT [FK_DebitoAutomatico_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[DebitoAutomatico] CHECK CONSTRAINT [FK_DebitoAutomatico_Usuario]
GO
ALTER TABLE [dbo].[Endereco]  WITH CHECK ADD  CONSTRAINT [FK_Endereco_Cliente] FOREIGN KEY([cli_id])
REFERENCES [dbo].[Cliente] ([cli_id])
GO
ALTER TABLE [dbo].[Endereco] CHECK CONSTRAINT [FK_Endereco_Cliente]
GO
ALTER TABLE [dbo].[Endereco]  WITH CHECK ADD  CONSTRAINT [FK_Endereco_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Endereco] CHECK CONSTRAINT [FK_Endereco_Usuario]
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Funcionalidade] FOREIGN KEY([fcd_id])
REFERENCES [dbo].[Funcionalidade] ([fcd_id])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Funcionalidade]
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Usuario]
GO
ALTER TABLE [dbo].[ExtratoComissionamento]  WITH CHECK ADD  CONSTRAINT [FK_ExtratoComissionamento_Comissionamento] FOREIGN KEY([com_id])
REFERENCES [dbo].[Comissionamento] ([com_id])
GO
ALTER TABLE [dbo].[ExtratoComissionamento] CHECK CONSTRAINT [FK_ExtratoComissionamento_Comissionamento]
GO
ALTER TABLE [dbo].[ExtratoComissionamento]  WITH CHECK ADD  CONSTRAINT [FK_ExtratoComissionamento_Contrato] FOREIGN KEY([ctt_id])
REFERENCES [dbo].[Contrato] ([ctt_id])
GO
ALTER TABLE [dbo].[ExtratoComissionamento] CHECK CONSTRAINT [FK_ExtratoComissionamento_Contrato]
GO
ALTER TABLE [dbo].[ExtratoComissionamento]  WITH CHECK ADD  CONSTRAINT [FK_ExtratoComissionamento_Produtor] FOREIGN KEY([pdr_id])
REFERENCES [dbo].[Produtor] ([pdr_id])
GO
ALTER TABLE [dbo].[ExtratoComissionamento] CHECK CONSTRAINT [FK_ExtratoComissionamento_Produtor]
GO
ALTER TABLE [dbo].[ExtratoComissionamento]  WITH CHECK ADD  CONSTRAINT [FK_ExtratoComissionamento_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[ExtratoComissionamento] CHECK CONSTRAINT [FK_ExtratoComissionamento_Usuario]
GO
ALTER TABLE [dbo].[ExtratoPontuacao]  WITH CHECK ADD  CONSTRAINT [FK_ExtratoPontuacao_Contrato] FOREIGN KEY([ctt_id])
REFERENCES [dbo].[Contrato] ([ctt_id])
GO
ALTER TABLE [dbo].[ExtratoPontuacao] CHECK CONSTRAINT [FK_ExtratoPontuacao_Contrato]
GO
ALTER TABLE [dbo].[ExtratoPontuacao]  WITH CHECK ADD  CONSTRAINT [FK_ExtratoPontuacao_Produtor] FOREIGN KEY([pdr_id])
REFERENCES [dbo].[Produtor] ([pdr_id])
GO
ALTER TABLE [dbo].[ExtratoPontuacao] CHECK CONSTRAINT [FK_ExtratoPontuacao_Produtor]
GO
ALTER TABLE [dbo].[ExtratoPontuacao]  WITH CHECK ADD  CONSTRAINT [FK_ExtratoPontuacao_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[ExtratoPontuacao] CHECK CONSTRAINT [FK_ExtratoPontuacao_Usuario]
GO
ALTER TABLE [dbo].[Funcionalidade]  WITH CHECK ADD  CONSTRAINT [FK_Funcionalidade_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Funcionalidade] CHECK CONSTRAINT [FK_Funcionalidade_Usuario]
GO
ALTER TABLE [dbo].[Imagem]  WITH CHECK ADD  CONSTRAINT [FK_Imagem_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Imagem] CHECK CONSTRAINT [FK_Imagem_Usuario]
GO
ALTER TABLE [dbo].[InfoMobile]  WITH CHECK ADD  CONSTRAINT [FK_InfoMobile_UsuarioToken] FOREIGN KEY([ust_id])
REFERENCES [dbo].[UsuarioToken] ([ust_id])
GO
ALTER TABLE [dbo].[InfoMobile] CHECK CONSTRAINT [FK_InfoMobile_UsuarioToken]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Evento] FOREIGN KEY([evt_id])
REFERENCES [dbo].[Evento] ([evt_id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Evento]
GO
ALTER TABLE [dbo].[Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Perfil] CHECK CONSTRAINT [FK_Perfil_Usuario]
GO
ALTER TABLE [dbo].[PerfilEvento]  WITH CHECK ADD  CONSTRAINT [FK_PerfilEvento_Evento] FOREIGN KEY([evt_id])
REFERENCES [dbo].[Evento] ([evt_id])
GO
ALTER TABLE [dbo].[PerfilEvento] CHECK CONSTRAINT [FK_PerfilEvento_Evento]
GO
ALTER TABLE [dbo].[PerfilEvento]  WITH CHECK ADD  CONSTRAINT [FK_PerfilEvento_Perfil] FOREIGN KEY([pfl_id])
REFERENCES [dbo].[Perfil] ([pfl_id])
GO
ALTER TABLE [dbo].[PerfilEvento] CHECK CONSTRAINT [FK_PerfilEvento_Perfil]
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Comissionamento] FOREIGN KEY([com_id])
REFERENCES [dbo].[Comissionamento] ([com_id])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_Comissionamento]
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Ramo] FOREIGN KEY([ram_id])
REFERENCES [dbo].[Ramo] ([ram_id])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_Ramo]
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Seguradora] FOREIGN KEY([seg_id])
REFERENCES [dbo].[Seguradora] ([seg_id])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_Seguradora]
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_Usuario]
GO
ALTER TABLE [dbo].[ProdutoPlano]  WITH CHECK ADD  CONSTRAINT [FK_ProdutoPlano_Produto] FOREIGN KEY([pro_id])
REFERENCES [dbo].[Produto] ([pro_id])
GO
ALTER TABLE [dbo].[ProdutoPlano] CHECK CONSTRAINT [FK_ProdutoPlano_Produto]
GO
ALTER TABLE [dbo].[ProdutoPlano]  WITH CHECK ADD  CONSTRAINT [FK_ProdutoPlano_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[ProdutoPlano] CHECK CONSTRAINT [FK_ProdutoPlano_Usuario]
GO
ALTER TABLE [dbo].[Produtor]  WITH CHECK ADD  CONSTRAINT [FK_Produtor_UnidadeAdministrativa] FOREIGN KEY([uad_id])
REFERENCES [dbo].[UnidadeAdministrativa] ([uad_id])
GO
ALTER TABLE [dbo].[Produtor] CHECK CONSTRAINT [FK_Produtor_UnidadeAdministrativa]
GO
ALTER TABLE [dbo].[Produtor]  WITH CHECK ADD  CONSTRAINT [FK_Produtor_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Produtor] CHECK CONSTRAINT [FK_Produtor_Usuario]
GO
ALTER TABLE [dbo].[ProdutorUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ProdutorUsuario_Produtor] FOREIGN KEY([pdr_id])
REFERENCES [dbo].[Produtor] ([pdr_id])
GO
ALTER TABLE [dbo].[ProdutorUsuario] CHECK CONSTRAINT [FK_ProdutorUsuario_Produtor]
GO
ALTER TABLE [dbo].[ProdutorUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ProdutorUsuario_Usuario] FOREIGN KEY([usu_id])
REFERENCES [dbo].[Usuario] ([usu_id])
GO
ALTER TABLE [dbo].[ProdutorUsuario] CHECK CONSTRAINT [FK_ProdutorUsuario_Usuario]
GO
ALTER TABLE [dbo].[ProdutorUsuario]  WITH CHECK ADD  CONSTRAINT [FK_ProdutorUsuario_UsuarioLogin] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[ProdutorUsuario] CHECK CONSTRAINT [FK_ProdutorUsuario_UsuarioLogin]
GO
ALTER TABLE [dbo].[Ramo]  WITH CHECK ADD  CONSTRAINT [FK_Ramo_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Ramo] CHECK CONSTRAINT [FK_Ramo_Usuario]
GO
ALTER TABLE [dbo].[Seguradora]  WITH CHECK ADD  CONSTRAINT [FK_Seguradora_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Seguradora] CHECK CONSTRAINT [FK_Seguradora_Usuario]
GO
ALTER TABLE [dbo].[Senha]  WITH CHECK ADD  CONSTRAINT [FK_Senha_Usuario] FOREIGN KEY([usu_id])
REFERENCES [dbo].[Usuario] ([usu_id])
GO
ALTER TABLE [dbo].[Senha] CHECK CONSTRAINT [FK_Senha_Usuario]
GO
ALTER TABLE [dbo].[Telefone]  WITH CHECK ADD  CONSTRAINT [FK_Telefone_Cliente] FOREIGN KEY([cli_id])
REFERENCES [dbo].[Cliente] ([cli_id])
GO
ALTER TABLE [dbo].[Telefone] CHECK CONSTRAINT [FK_Telefone_Cliente]
GO
ALTER TABLE [dbo].[Telefone]  WITH CHECK ADD  CONSTRAINT [FK_Telefone_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[Telefone] CHECK CONSTRAINT [FK_Telefone_Usuario]
GO
ALTER TABLE [dbo].[TipoCobranca]  WITH CHECK ADD  CONSTRAINT [FK_TipoCobranca_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[TipoCobranca] CHECK CONSTRAINT [FK_TipoCobranca_Usuario]
GO
ALTER TABLE [dbo].[UnidadeAdministrativa]  WITH CHECK ADD  CONSTRAINT [FK_UnidadeAdministrativa_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [dbo].[UnidadeAdministrativa] CHECK CONSTRAINT [FK_UnidadeAdministrativa_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_UnidadeAdministrativa] FOREIGN KEY([uad_id])
REFERENCES [dbo].[UnidadeAdministrativa] ([uad_id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_UnidadeAdministrativa]
GO
/****** Object:  Trigger [dbo].[cliente_ai]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[cliente_ai]
on [dbo].[Cliente]
for insert
as
begin
	declare @data_atual datetime, @cli_id int

	set @data_atual = GETDATE();

	select @cli_id = cli_id 
		from inserted;
	
	update dbo.cliente
		set cli_data_cad = @data_atual,
			cli_status = 'A',
			cli_flag_excluido = 0
		where cli_id = @cli_id;
end
GO
/****** Object:  Trigger [dbo].[endereco_ai]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[endereco_ai]
on [dbo].[Endereco]
for insert
as
begin
	declare @data_atual datetime, @end_id int, @cli_id int, @end_flag_atual bit

	set @data_atual = GETDATE();

	select @end_id = end_id, @cli_id = cli_id, @end_flag_atual = end_flag_atual
		from inserted;

	update dbo.endereco
		set end_data_cad = @data_atual,
			end_flag_excluido = 0,
			end_status = 'A'
		where end_id = @end_id;

	if (@end_flag_atual = 1) begin
		update dbo.endereco
			set end_flag_atual = 0
			where cli_id = @cli_id 
				and end_id <> @end_id;
	end

end

GO
/****** Object:  Trigger [dbo].[endereco_au]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[endereco_au]
on [dbo].[Endereco]
for update
as
begin
	declare @end_id int, @cli_id int, @end_flag_atual bit

	select @end_id = end_id, @cli_id = cli_id, @end_flag_atual = end_flag_atual
		from inserted;

	if (@end_flag_atual = 1) begin
		update dbo.endereco
			set end_flag_atual = 0
			where cli_id = @cli_id 
				and end_id <> @end_id;
	end
end

GO
/****** Object:  Trigger [dbo].[telefone_ai]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[telefone_ai]
on [dbo].[Telefone]
for insert
as
begin
	declare @data_atual datetime, @tel_id int, @cli_id int, @tel_principal bit, 
			@tel_tipo char(1), @tel_flag_sms bit

	set @data_atual = GETDATE();

	select @tel_id = tel_id, @cli_id = cli_id, @tel_principal = tel_principal, 
		   @tel_tipo = tel_tipo, @tel_flag_sms = tel_flag_sms 
		from inserted;

	if (@tel_tipo = 'F' and @tel_flag_sms = 1) begin
		set @tel_flag_sms = 0;
	end

	update dbo.telefone
		set tel_data_cad = @data_atual,
			tel_flag_excluido = 0,
			tel_status = 'A',
			tel_flag_sms = @tel_flag_sms
		where tel_id = @tel_id;

	if (@tel_principal = 1) begin
		update dbo.telefone
			set tel_principal = 0
			where cli_id = @cli_id 
				and tel_id <> @tel_id;
	end

end

GO
/****** Object:  Trigger [dbo].[telefone_au]    Script Date: 17/11/2016 17:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[telefone_au]
on [dbo].[Telefone]
for update
as
begin
	declare @tel_id int, @cli_id int, @tel_principal bit

	select @tel_id = tel_id, @cli_id = cli_id, @tel_principal = tel_principal 
		from inserted;

	if (@tel_principal = 1) begin
		update dbo.telefone
			set tel_principal = 0
			where cli_id = @cli_id 
				and tel_id <> @tel_id;
	end
end

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'P - Pago, A - Aguardando Pagamento, N - Não Autorizado, C - Cancelado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Boleto', @level2type=N'COLUMN',@level2name=N'blt_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'F - Fisica, J - Juridica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'cli_tipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'M - Masculino, F - Feminino' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'cli_sexo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'S - Solteiro(a), C - Casado(a), D - Divorciado(a), V - Viúvo(a), P - Separado(a)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'cli_estado_civil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A - Ativo, I - Inativo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'cli_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'P-Paga, A-Em Aberto, E-Estornada, C-Cancelada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContratoParcela', @level2type=N'COLUMN',@level2name=N'cpl_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'P - Pago, A - Aguardando Pagamento, N - Não Autorizado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DebitoAutomatico', @level2type=N'COLUMN',@level2name=N'dau_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'R - Residencial, T - Trabalho' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Endereco', @level2type=N'COLUMN',@level2name=N'end_tipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador do extrato de comissionamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExtratoComissionamento', @level2type=N'COLUMN',@level2name=N'exc_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contrato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExtratoComissionamento', @level2type=N'COLUMN',@level2name=N'ctt_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Comissionamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExtratoComissionamento', @level2type=N'COLUMN',@level2name=N'com_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Produtor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExtratoComissionamento', @level2type=N'COLUMN',@level2name=N'pdr_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo do repasse: C - Crédito, D - Débito' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExtratoComissionamento', @level2type=N'COLUMN',@level2name=N'exc_tipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor do repasse para seguradora' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExtratoComissionamento', @level2type=N'COLUMN',@level2name=N'exc_val_seg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor do repasse para produtor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExtratoComissionamento', @level2type=N'COLUMN',@level2name=N'exc_val_prod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor do repasse para corretora' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExtratoComissionamento', @level2type=N'COLUMN',@level2name=N'exc_val_cor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de geração' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExtratoComissionamento', @level2type=N'COLUMN',@level2name=N'exc_data_geracao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data do repasse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExtratoComissionamento', @level2type=N'COLUMN',@level2name=N'exc_data_repasse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuário de inclusão' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExtratoComissionamento', @level2type=N'COLUMN',@level2name=N'usu_login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de inclusão' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExtratoComissionamento', @level2type=N'COLUMN',@level2name=N'exc_data_cad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo da imagem: B - Banner' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Imagem', @level2type=N'COLUMN',@level2name=N'img_tipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status da imagem: A - Ativo, I - Inativo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Imagem', @level2type=N'COLUMN',@level2name=N'img_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InfoMobile', @level2type=N'COLUMN',@level2name=N'ifb_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador da tabela UsuarioToken' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InfoMobile', @level2type=N'COLUMN',@level2name=N'ust_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Modelo do dispositivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InfoMobile', @level2type=N'COLUMN',@level2name=N'ifb_modelo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Plataforma do dispositivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InfoMobile', @level2type=N'COLUMN',@level2name=N'ifb_plataforma'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador do dispositivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InfoMobile', @level2type=N'COLUMN',@level2name=N'ifb_uuid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador do dispositivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InfoMobile', @level2type=N'COLUMN',@level2name=N'ifb_serial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Versão do sistema operacional' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InfoMobile', @level2type=N'COLUMN',@level2name=N'ifb_versao_so'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fabricante do dispositivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InfoMobile', @level2type=N'COLUMN',@level2name=N'ifb_fabricante'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Token para envio de push' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InfoMobile', @level2type=N'COLUMN',@level2name=N'ifb_token_push'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Verifica se o aplicativo esta sendo emulado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InfoMobile', @level2type=N'COLUMN',@level2name=N'ifb_virtual'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C - Capitalização, S - Seguro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Produto', @level2type=N'COLUMN',@level2name=N'pro_categoria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A - Ativo, B - Bloqueado, I - Inativo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Produtor', @level2type=N'COLUMN',@level2name=N'pdr_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'F - Fixo, M - Móvel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Telefone', @level2type=N'COLUMN',@level2name=N'tel_tipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'usu_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id do Perfil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'pfl_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'usu_login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'usu_nome'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CPF/CNPJ do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'usu_cpf_cnpj'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Senha do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'usu_senha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Celular do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'usu_celular'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'usu_email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Situação do usuário: A - Ativo, I - Inativo, B - Bloqueado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'usu_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tentativas de login do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'usu_tent_login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Token gerado para alteração da senha do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'usu_token'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Validade do token de alteração da senha do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'usu_val_token'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Flag para obrigar a alteração da senha do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'usu_alt_senha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Flag de exclusão lógica dp usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'usu_flag_excluido'
GO
USE [master]
GO
ALTER DATABASE [HomBD_Portal_Servico] SET  READ_WRITE 
GO
