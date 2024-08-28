/*
=================================================================================================================================================

	Objeto:			Tabela [Funcionalidade], [Evento], [Menu]
	Data Criação:	23/01/2017
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert nas tabelas de funcionalidade, evento e menu para a interface de apólice
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
USE [HomBD_Portal_Servico]

declare @fcd_id int, @evt_id int, @ordem_menu int, @men_id int

insert into dbo.Funcionalidade
	(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
	values
	('Interface de Apólices', 'Apolice', 'A', 'admin', getdate(), 0)

set @fcd_id = @@IDENTITY

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Apólices', 'Index', 'A', 'admin', getdate(), 0)

set @evt_id = @@IDENTITY

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Obter Apolice por Id', 'ObterApolicePorId', 'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Manter Apólice', 'SalvarApolice', 'A', 'admin', getdate(), 0)
	
insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Excluir Apólice', 'ExcluirApolice', 'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Pesquisar Apolices', 'PesquisarApolices', 'A', 'admin', getdate(), 0)

select @men_id = men_id 
	from dbo.Menu 
	where men_titulo = 'Prestamista'

insert into dbo.Menu
	(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
	values
	('Apólices', @evt_id, @men_id, 2, NULL, 'A')