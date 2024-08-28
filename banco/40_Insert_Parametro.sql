/*
=================================================================================================================================================

	Objeto:			Tabela [Parametro]
	Data Cria��o:	23/01/2017
	Desenvolvedor:	Igor Santos
	Descri��o:		Script de insert na tabela de par�metros
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_ABS_APOLICE', 'Z:\pdsmedia\apolice')

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_ABS_REGRAAPOLICE', 'Z:\pdsmedia\regraapolice')

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_REL_APOLICE', 'http://ma9chrome.intranet.ma9.local/apolice')

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_REL_REGRAAPOLICE', 'http://ma9chrome.intranet.ma9.local/regraapolice')