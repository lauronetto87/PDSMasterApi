/*
=================================================================================================================================================

	Objeto:			Tabela [Funcionalidade] e [Evento]
	Data Criação:	23/01/2017
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert nas tabelas de funcionalidade, evento e menu para a interface de apólice
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
USE [HomBD_Portal_Servico]

declare @fcd_id int

insert into dbo.Funcionalidade
	(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
	values
	('Interface de Regra de Apólices', 'RegraApolice', 'A', 'admin', getdate(), 0)

set @fcd_id = @@IDENTITY

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Regras de Apólice', 'Index', 'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Obter Regras de Apolice por Apólice', 'ObterRegrasDaApolice', 'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Obter Regra de Apolice por Id', 'ObterRegraApolicePorId', 'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Manter Regra de Apolice', 'SalvarRegraApolice', 'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Excluir Regra de Apolice', 'ExcluirRegraApolice', 'A', 'admin', getdate(), 0)