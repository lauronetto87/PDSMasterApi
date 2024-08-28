/*
=================================================================================================================================================

	Objeto:			Tabela [Parametro]
	Data Criação:	24/01/2017
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert nas tabela de parametro para setar a quantidade de minutos que o usuário ficará bloqueado e a quantidade de 
					tentativas para futuro bloqueio do usuário
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
USE [HomBD_Portal_Servico]

insert into dbo.Parametro
	(prt_chave, prt_valor)
	values
	('QTD_MIN_USU_BLOQUEADO', '120')

insert into dbo.Parametro
	(prt_chave, prt_valor)
	values
	('QTD_TENTATIVA_LOGIN', '5')