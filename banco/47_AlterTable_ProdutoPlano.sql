/*
=================================================================================================================================================

	Objeto:			Table [Usuario]
	Data Criação:	25/01/2017
	Desenvolvedor:	Lauro Daniel
	Descrição:		Alteração na tabela de produtoplano para inserção de três novos campos
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/

USE [HomBD_Portal_Servico]

ALTER TABLE dbo.ProdutoPlano
	ADD ppl_premio_anual_morte numeric(15,2) NULL,
	    ppl_premio_anual_invalidez numeric(15,2) NULL,
	    ppl_iof_total numeric(15,2) NULL;
