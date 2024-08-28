/*
=================================================================================================================================================

	Objeto:			Table [LogArquivoBoleto]
	Data Criação:	27/01/2017
	Desenvolvedor:	Lauro Daniel
	Descrição:		Alteração na tabela de logarquivoboleto para inserção de dois novos campos
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/

USE [HomBD_Portal_Servico]

ALTER TABLE dbo.LogArquivoBoleto
	ADD lab_mensagem varchar(100) NOT NULL,
	    lab_upload bit NOT NULL;
