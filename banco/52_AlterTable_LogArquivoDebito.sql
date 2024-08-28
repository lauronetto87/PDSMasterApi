/*
=================================================================================================================================================

	Objeto:			Table [LogArquivoDebito]
	Data Criação:	27/01/2017
	Desenvolvedor:	Lauro Daniel
	Descrição:		Alteração na tabela de logarquivodebito para inserção de dois novos campos
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/

USE [HomBD_Portal_Servico]

ALTER TABLE dbo.LogArquivoDebito
	ADD lad_mensagem varchar(100) NOT NULL,
	    lad_upload bit NOT NULL;
