/*
=================================================================================================================================================

	Objeto:			Table [LogArquivoBoleto]
	Data Cria��o:	27/01/2017
	Desenvolvedor:	Lauro Daniel
	Descri��o:		Altera��o na tabela de logarquivoboleto para inser��o de dois novos campos
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/

USE [HomBD_Portal_Servico]

ALTER TABLE dbo.LogArquivoBoleto
	ADD lab_mensagem varchar(100) NOT NULL,
	    lab_upload bit NOT NULL;
