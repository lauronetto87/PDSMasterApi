/*
=================================================================================================================================================

	Objeto:			Tabela [Usuario]
	Data Cria��o:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descri��o:		Script de cria��o de chave extrangeira com a tabela de [Perfil]
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/
USE [HomBD_Portal_Servico]

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
ALTER TABLE dbo.Perfil SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
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
ALTER TABLE dbo.Usuario SET (LOCK_ESCALATION = TABLE)
GO
COMMIT