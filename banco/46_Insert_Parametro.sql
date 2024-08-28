/*
=================================================================================================================================================

	Objeto:			Tabela [Parametro]
	Data Cria��o:	24/01/2017
	Desenvolvedor:	Igor Santos
	Descri��o:		Script de insert nas tabela de parametro para setar a quantidade de minutos que o usu�rio ficar� bloqueado e a quantidade de 
					tentativas para futuro bloqueio do usu�rio
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

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