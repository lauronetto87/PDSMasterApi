/*
=================================================================================================================================================

	Objeto:			Table [Beneficiario]
	Data Cria��o:	03/02/2017
	Desenvolvedor:	Lauro Daniel
	Descri��o:		Altera��o na tabela de Beneficiario para inser��o de um campo
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/

USE [HomBD_Portal_Servico]

ALTER TABLE dbo.Beneficiario
	ADD bnf_data_nascimento DateTime NULL;
