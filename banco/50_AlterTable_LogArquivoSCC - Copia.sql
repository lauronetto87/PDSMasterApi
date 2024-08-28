/*
=================================================================================================================================================

	Objeto:			Table [LogArquivoSCC]
	Data Cria��o:	27/01/2017
	Desenvolvedor:	Lauro Daniel
	Descri��o:		Altera��o na tabela de logarquivoscc para inser��o de dois novos campos
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/

USE [HomBD_Portal_Servico]

ALTER TABLE dbo.LogArquivoSCC
	ADD las_mensagem varchar(100) NOT NULL,
	    las_upload bit NOT NULL;
