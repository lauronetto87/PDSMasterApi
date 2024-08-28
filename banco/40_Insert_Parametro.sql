/*
=================================================================================================================================================

	Objeto:			Tabela [Parametro]
	Data Criação:	23/01/2017
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert na tabela de parâmetros
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

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