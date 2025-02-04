/*
=================================================================================================================================================

	Objeto:			Table [Usuario]
	Data Criação:	24/01/2017
	Desenvolvedor:	Igor Santos
	Descrição:		Alteração na tabela de usuário para inclusão da coluna de data de bloqueio
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Usuario
	DROP CONSTRAINT DF__Usuario__Usuario__17F790F9
GO
ALTER TABLE dbo.Usuario
	DROP CONSTRAINT DF_Usuario_usu_tent_login
GO
ALTER TABLE dbo.Usuario
	DROP CONSTRAINT DF_Usuario_usu_novo
GO
ALTER TABLE dbo.Usuario
	DROP CONSTRAINT DF_Usuario_usu_flag_excluido
GO
CREATE TABLE dbo.Tmp_Usuario
	(
	usu_id int NOT NULL IDENTITY (1, 1),
	pfl_id int NOT NULL,
	uad_id int NULL,
	usu_login varchar(50) NOT NULL,
	usu_nome varchar(50) NOT NULL,
	usu_cpf_cnpj varchar(20) NOT NULL,
	usu_senha varchar(100) NOT NULL,
	usu_ddi varchar(4) NULL,
	usu_ddd varchar(4) NULL,
	usu_celular varchar(20) NULL,
	usu_email varchar(100) NOT NULL,
	usu_status char(1) NOT NULL,
	usu_tent_login int NULL,
	usu_data_bloqueio datetime NULL,
	usu_token varchar(10) NULL,
	usu_val_token datetime NULL,
	usu_alt_senha bit NOT NULL,
	usu_flag_excluido bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Usuario SET (LOCK_ESCALATION = TABLE)
GO
DECLARE @v sql_variant 
SET @v = N'Identificador'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'usu_id'
GO
DECLARE @v sql_variant 
SET @v = N'Id do Perfil'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'pfl_id'
GO
DECLARE @v sql_variant 
SET @v = N'Login do usuário'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'usu_login'
GO
DECLARE @v sql_variant 
SET @v = N'Nome do usuário'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'usu_nome'
GO
DECLARE @v sql_variant 
SET @v = N'CPF/CNPJ do usuário'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'usu_cpf_cnpj'
GO
DECLARE @v sql_variant 
SET @v = N'Senha do usuário'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'usu_senha'
GO
DECLARE @v sql_variant 
SET @v = N'Celular do usuário'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'usu_celular'
GO
DECLARE @v sql_variant 
SET @v = N'Email do usuário'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'usu_email'
GO
DECLARE @v sql_variant 
SET @v = N'Situação do usuário: A - Ativo, I - Inativo, B - Bloqueado'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'usu_status'
GO
DECLARE @v sql_variant 
SET @v = N'Tentativas de login do usuário'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'usu_tent_login'
GO
DECLARE @v sql_variant 
SET @v = N'Token gerado para alteração da senha do usuário'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'usu_token'
GO
DECLARE @v sql_variant 
SET @v = N'Validade do token de alteração da senha do usuário'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'usu_val_token'
GO
DECLARE @v sql_variant 
SET @v = N'Flag para obrigar a alteração da senha do usuário'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'usu_alt_senha'
GO
DECLARE @v sql_variant 
SET @v = N'Flag de exclusão lógica dp usuário'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Usuario', N'COLUMN', N'usu_flag_excluido'
GO
ALTER TABLE dbo.Tmp_Usuario ADD CONSTRAINT
	DF__Usuario__Usuario__17F790F9 DEFAULT ('A') FOR usu_status
GO
ALTER TABLE dbo.Tmp_Usuario ADD CONSTRAINT
	DF_Usuario_usu_tent_login DEFAULT ((0)) FOR usu_tent_login
GO
ALTER TABLE dbo.Tmp_Usuario ADD CONSTRAINT
	DF_Usuario_usu_novo DEFAULT ((1)) FOR usu_alt_senha
GO
ALTER TABLE dbo.Tmp_Usuario ADD CONSTRAINT
	DF_Usuario_usu_flag_excluido DEFAULT ((0)) FOR usu_flag_excluido
GO
SET IDENTITY_INSERT dbo.Tmp_Usuario ON
GO
IF EXISTS(SELECT * FROM dbo.Usuario)
	 EXEC('INSERT INTO dbo.Tmp_Usuario (usu_id, pfl_id, uad_id, usu_login, usu_nome, usu_cpf_cnpj, usu_senha, usu_ddi, usu_ddd, usu_celular, usu_email, usu_status, usu_tent_login, usu_token, usu_val_token, usu_alt_senha, usu_flag_excluido)
		SELECT usu_id, pfl_id, uad_id, usu_login, usu_nome, usu_cpf_cnpj, usu_senha, usu_ddi, usu_ddd, usu_celular, usu_email, usu_status, usu_tent_login, usu_token, usu_val_token, usu_alt_senha, usu_flag_excluido FROM dbo.Usuario WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Usuario OFF
GO
ALTER TABLE dbo.ContratoHistorico
	DROP CONSTRAINT FK_ContratoHistorico_Usuario
GO
ALTER TABLE prestamista.ErroArquivoSCC
	DROP CONSTRAINT FK_Erro_ArquivoSCC_Usuario
GO
ALTER TABLE dbo.ComissionamentoParcela
	DROP CONSTRAINT FK_comissionamento_parcela_Usuario
GO
ALTER TABLE dbo.Comissionamento
	DROP CONSTRAINT FK_Comissionamento_Usuario
GO
ALTER TABLE dbo.Cliente
	DROP CONSTRAINT FK_Cliente_Usuario
GO
ALTER TABLE prestamista.SubLinhaCredito
	DROP CONSTRAINT FK_SubLinhaCredito_Usuario
GO
ALTER TABLE dbo.Banco
	DROP CONSTRAINT FK_Banco_Usuario
GO
ALTER TABLE prestamista.HistImportacaoArquivo
	DROP CONSTRAINT FK_HistImportacaoArquivo_Usuario
GO
ALTER TABLE prestamista.LinhaCredito
	DROP CONSTRAINT FK_LinhaCredito_Usuario
GO
ALTER TABLE prestamista.RegraApolice
	DROP CONSTRAINT FK_RegrasApolice_Usuario
GO
ALTER TABLE dbo.Produtor
	DROP CONSTRAINT FK_Produtor_Usuario
GO
ALTER TABLE prestamista.Apolice
	DROP CONSTRAINT FK_Apolice_Usuario
GO
ALTER TABLE dbo.UnidadeAdministrativa
	DROP CONSTRAINT FK_UnidadeAdministrativa_Usuario
GO
ALTER TABLE dbo.Usuario
	DROP CONSTRAINT FK_Usuario_UnidadeAdministrativa
GO
ALTER TABLE dbo.TipoCobranca
	DROP CONSTRAINT FK_TipoCobranca_Usuario
GO
ALTER TABLE dbo.Telefone
	DROP CONSTRAINT FK_Telefone_Usuario
GO
ALTER TABLE dbo.Senha
	DROP CONSTRAINT FK_Senha_Usuario
GO
ALTER TABLE dbo.Seguradora
	DROP CONSTRAINT FK_Seguradora_Usuario
GO
ALTER TABLE prestamista.ContratoParcelaHist
	DROP CONSTRAINT FK_ContratoParcelaHist_Usuario_Alt
GO
ALTER TABLE prestamista.ContratoParcelaHist
	DROP CONSTRAINT FK_ContratoParcelaHist_Usuario_Cad
GO
ALTER TABLE dbo.Ramo
	DROP CONSTRAINT FK_Ramo_Usuario
GO
ALTER TABLE dbo.ProdutorUsuario
	DROP CONSTRAINT FK_ProdutorUsuario_Usuario
GO
ALTER TABLE dbo.ProdutorUsuario
	DROP CONSTRAINT FK_ProdutorUsuario_UsuarioLogin
GO
ALTER TABLE prestamista.ContratoParcela
	DROP CONSTRAINT FK_ContratoParcela_Usuario_Cad
GO
ALTER TABLE prestamista.ContratoParcela
	DROP CONSTRAINT FK_ContratoParcela_Usuario_Alt
GO
ALTER TABLE dbo.ProdutoPlano
	DROP CONSTRAINT FK_ProdutoPlano_Usuario
GO
ALTER TABLE dbo.Produto
	DROP CONSTRAINT FK_Produto_Usuario
GO
ALTER TABLE prestamista.ContratoHist
	DROP CONSTRAINT FK_ContratoHist_Usuario_Alt
GO
ALTER TABLE prestamista.ContratoHist
	DROP CONSTRAINT FK_ContratoHist_Usuario_Cad
GO
ALTER TABLE dbo.Perfil
	DROP CONSTRAINT FK_Perfil_Usuario
GO
ALTER TABLE dbo.Usuario
	DROP CONSTRAINT FK_Usuario_Perfil
GO
ALTER TABLE dbo.Imagem
	DROP CONSTRAINT FK_Imagem_Usuario
GO
ALTER TABLE dbo.Funcionalidade
	DROP CONSTRAINT FK_Funcionalidade_Usuario
GO
ALTER TABLE dbo.ExtratoPontuacao
	DROP CONSTRAINT FK_ExtratoPontuacao_Usuario
GO
ALTER TABLE prestamista.Contrato
	DROP CONSTRAINT FK_Contrato_Usuario_Cad
GO
ALTER TABLE prestamista.Contrato
	DROP CONSTRAINT FK_Contrato_Usuario_Alt
GO
ALTER TABLE dbo.ExtratoComissionamento
	DROP CONSTRAINT FK_ExtratoComissionamento_Usuario
GO
ALTER TABLE dbo.LogAdesaoMapfre
	DROP CONSTRAINT FK_LogAdesaoMapfre_Usuario
GO
ALTER TABLE dbo.Evento
	DROP CONSTRAINT FK_Evento_Usuario
GO
ALTER TABLE dbo.Endereco
	DROP CONSTRAINT FK_Endereco_Usuario
GO
ALTER TABLE dbo.DebitoAutomatico
	DROP CONSTRAINT FK_DebitoAutomatico_Usuario
GO
ALTER TABLE dbo.ContratoParcela
	DROP CONSTRAINT FK_ContratoParcela_Usuario
GO
DROP TABLE dbo.Usuario
GO
EXECUTE sp_rename N'dbo.Tmp_Usuario', N'Usuario', 'OBJECT' 
GO
ALTER TABLE dbo.Usuario ADD CONSTRAINT
	PK_Usuario PRIMARY KEY CLUSTERED 
	(
	usu_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE UNIQUE NONCLUSTERED INDEX IX_Usuario_CpfCnpj ON dbo.Usuario
	(
	usu_cpf_cnpj
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX IX_Usuario_Email ON dbo.Usuario
	(
	usu_email
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX IX_Usuario_Login ON dbo.Usuario
	(
	usu_login
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ContratoParcela ADD CONSTRAINT
	FK_ContratoParcela_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ContratoParcela SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.DebitoAutomatico ADD CONSTRAINT
	FK_DebitoAutomatico_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.DebitoAutomatico SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Endereco ADD CONSTRAINT
	FK_Endereco_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Endereco SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Evento ADD CONSTRAINT
	FK_Evento_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Evento SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LogAdesaoMapfre ADD CONSTRAINT
	FK_LogAdesaoMapfre_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.LogAdesaoMapfre SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ExtratoComissionamento ADD CONSTRAINT
	FK_ExtratoComissionamento_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ExtratoComissionamento SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE prestamista.Contrato ADD CONSTRAINT
	FK_Contrato_Usuario_Cad FOREIGN KEY
	(
	usu_login_cad
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.Contrato ADD CONSTRAINT
	FK_Contrato_Usuario_Alt FOREIGN KEY
	(
	usu_login_alt
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.Contrato SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ExtratoPontuacao ADD CONSTRAINT
	FK_ExtratoPontuacao_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ExtratoPontuacao SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Funcionalidade ADD CONSTRAINT
	FK_Funcionalidade_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Funcionalidade SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Imagem ADD CONSTRAINT
	FK_Imagem_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Imagem SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Perfil ADD CONSTRAINT
	FK_Perfil_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Usuario ADD CONSTRAINT
	FK_Usuario_Perfil FOREIGN KEY
	(
	pfl_id
	) REFERENCES dbo.Perfil
	(
	pfl_id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Perfil SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE prestamista.ContratoHist ADD CONSTRAINT
	FK_ContratoHist_Usuario_Alt FOREIGN KEY
	(
	usu_login_alt
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.ContratoHist ADD CONSTRAINT
	FK_ContratoHist_Usuario_Cad FOREIGN KEY
	(
	usu_login_cad
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.ContratoHist SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Produto ADD CONSTRAINT
	FK_Produto_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Produto SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProdutoPlano ADD CONSTRAINT
	FK_ProdutoPlano_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProdutoPlano SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE prestamista.ContratoParcela ADD CONSTRAINT
	FK_ContratoParcela_Usuario_Cad FOREIGN KEY
	(
	usu_login_cad
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.ContratoParcela ADD CONSTRAINT
	FK_ContratoParcela_Usuario_Alt FOREIGN KEY
	(
	usu_login_alt
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.ContratoParcela SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProdutorUsuario ADD CONSTRAINT
	FK_ProdutorUsuario_Usuario FOREIGN KEY
	(
	usu_id
	) REFERENCES dbo.Usuario
	(
	usu_id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProdutorUsuario ADD CONSTRAINT
	FK_ProdutorUsuario_UsuarioLogin FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProdutorUsuario SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Ramo ADD CONSTRAINT
	FK_Ramo_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Ramo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE prestamista.ContratoParcelaHist ADD CONSTRAINT
	FK_ContratoParcelaHist_Usuario_Alt FOREIGN KEY
	(
	usu_login_alt
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.ContratoParcelaHist ADD CONSTRAINT
	FK_ContratoParcelaHist_Usuario_Cad FOREIGN KEY
	(
	usu_login_cad
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.ContratoParcelaHist SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Seguradora ADD CONSTRAINT
	FK_Seguradora_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Seguradora SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Senha ADD CONSTRAINT
	FK_Senha_Usuario FOREIGN KEY
	(
	usu_id
	) REFERENCES dbo.Usuario
	(
	usu_id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Senha SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Telefone ADD CONSTRAINT
	FK_Telefone_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Telefone SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.TipoCobranca ADD CONSTRAINT
	FK_TipoCobranca_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.TipoCobranca SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.UnidadeAdministrativa ADD CONSTRAINT
	FK_UnidadeAdministrativa_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Usuario ADD CONSTRAINT
	FK_Usuario_UnidadeAdministrativa FOREIGN KEY
	(
	uad_id
	) REFERENCES dbo.UnidadeAdministrativa
	(
	uad_id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.UnidadeAdministrativa SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE prestamista.Apolice ADD CONSTRAINT
	FK_Apolice_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.Apolice SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Produtor ADD CONSTRAINT
	FK_Produtor_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Produtor SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE prestamista.RegraApolice ADD CONSTRAINT
	FK_RegrasApolice_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.RegraApolice SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE prestamista.LinhaCredito ADD CONSTRAINT
	FK_LinhaCredito_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.LinhaCredito SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE prestamista.HistImportacaoArquivo ADD CONSTRAINT
	FK_HistImportacaoArquivo_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.HistImportacaoArquivo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Banco ADD CONSTRAINT
	FK_Banco_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Banco SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE prestamista.SubLinhaCredito ADD CONSTRAINT
	FK_SubLinhaCredito_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.SubLinhaCredito SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Cliente ADD CONSTRAINT
	FK_Cliente_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Cliente SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Comissionamento ADD CONSTRAINT
	FK_Comissionamento_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Comissionamento SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ComissionamentoParcela ADD CONSTRAINT
	FK_comissionamento_parcela_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ComissionamentoParcela SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE prestamista.ErroArquivoSCC ADD CONSTRAINT
	FK_Erro_ArquivoSCC_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE prestamista.ErroArquivoSCC SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ContratoHistorico ADD CONSTRAINT
	FK_ContratoHistorico_Usuario FOREIGN KEY
	(
	usu_login
	) REFERENCES dbo.Usuario
	(
	usu_login
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ContratoHistorico SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
