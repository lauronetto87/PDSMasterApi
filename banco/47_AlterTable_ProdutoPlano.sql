/*
=================================================================================================================================================

	Objeto:			Table [Usuario]
	Data Cria��o:	25/01/2017
	Desenvolvedor:	Lauro Daniel
	Descri��o:		Altera��o na tabela de produtoplano para inser��o de tr�s novos campos
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/

USE [HomBD_Portal_Servico]

ALTER TABLE dbo.ProdutoPlano
	ADD ppl_premio_anual_morte numeric(15,2) NULL,
	    ppl_premio_anual_invalidez numeric(15,2) NULL,
	    ppl_iof_total numeric(15,2) NULL;
