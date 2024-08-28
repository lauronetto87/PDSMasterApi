/*
=================================================================================================================================================

	Objeto:			Table [LogArquivoSCC]
	Data Criação:	27/01/2017
	Desenvolvedor:	Lauro Daniel
	Descrição:		Alteração na tabela de logarquivoscc para inserção de dois novos campos
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/

USE [HomBD_Portal_Servico]

ALTER TABLE dbo.LogArquivoSCC
	ADD las_mensagem varchar(100) NOT NULL,
	    las_upload bit NOT NULL;
