/*
=================================================================================================================================================

	Objeto:			Table [Beneficiario]
	Data Criação:	03/02/2017
	Desenvolvedor:	Lauro Daniel
	Descrição:		Alteração na tabela de Beneficiario para inserção de um campo
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/

USE [HomBD_Portal_Servico]

ALTER TABLE dbo.Beneficiario
	ADD bnf_data_nascimento DateTime NULL;
