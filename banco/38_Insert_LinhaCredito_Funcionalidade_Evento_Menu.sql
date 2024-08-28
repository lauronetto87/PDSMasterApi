/*
=================================================================================================================================================

	Objeto:			Tabela [Funcionalidade], [Evento], [Menu]
	Data Cria��o:	18/01/2017
	Desenvolvedor:	Igor Santos
	Descri��o:		Script de insert nas tabelas de funcionalidade, evento e menu para a interface de Linha de Cr�dito
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/
USE [HomBD_Portal_Servico]

declare @fcd_id int, @evt_id int, @ordem_menu int, @men_id int

insert into dbo.Funcionalidade
	(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
	values
	('Interface de Linha de Cr�dito', 'LinhaCredito', 'A', 'admin', getdate(), 0)

set @fcd_id = @@IDENTITY

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Linhas de Cr�dito', 'Index', 'A', 'admin', getdate(), 0)

set @evt_id = @@IDENTITY

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Pesquisar Linhas de Cr�dito', 'PesquisarLinhasDeCredito', 'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Obter Linha Cr�dito por Id', 'ObterLinhaCreditoPorId', 'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Manter Linha de Cr�dito', 'SalvarLinhaCredito', 'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Excluir Linha de Cr�dito', 'ExcluirLinhaCredito', 'A', 'admin', getdate(), 0)

set @ordem_menu = (select count(*) from dbo.Menu where men_pai is null)

insert into dbo.Menu
	(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
	values
	('Prestamista', NULL, NULL, @ordem_menu, 'local_atm', 'A')

set @men_id = @@IDENTITY

update dbo.Menu
	set men_ordem = @ordem_menu + 1
	where men_titulo = 'Administra��o'

insert into dbo.Menu
	(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
	values
	('Linhas de Cr�dito', @evt_id, @men_id, 1, NULL, 'A')