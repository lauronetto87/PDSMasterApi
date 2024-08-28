/*
=================================================================================================================================================

	Objeto:			Table [LogArquivoDebito]
	Data Cria��o:	27/01/2017
	Desenvolvedor:	Lauro Daniel
	Descri��o:		Altera��o na tabela de logarquivodebito para inser��o de dois novos campos
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/

USE [HomBD_Portal_Servico]

ALTER TABLE dbo.LogArquivoDebito
	ADD lad_mensagem varchar(100) NOT NULL,
	    lad_upload bit NOT NULL;
