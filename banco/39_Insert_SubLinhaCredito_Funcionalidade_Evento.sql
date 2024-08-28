/*
=================================================================================================================================================

	Objeto:			Tabela [Funcionalidade] e [Evento]
	Data Criação:	19/01/2017
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert nas tabelas de funcionalidade e evento para a interface de Sub-Linha de Crédito
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
USE [HomBD_Portal_Servico]

declare @fcd_id int

insert into dbo.Funcionalidade
	(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
	values
	('Interface de Sub-Linha de Crédito', 'SubLinhaCredito', 'A', 'admin', getdate(), 0)

set @fcd_id = @@IDENTITY

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Sub-Linhas de Crédito', 'Index', 'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Obter Sub-Linhas de Crédito por Linha de Crédito', 'ObterSubLinhasCreditoPorLinha', 
		'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Obter Sub-Linha de Crédito por Id', 'ObterSubLinhaCreditoPorId', 'A', 'admin', 
		getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Manter Sub-Linhas de Crédito', 'SalvarSubLinhaCredito', 'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Excluir Sub-Linha de Crédito', 'ExcluirSubLinhaCredito', 'A', 'admin', getdate(), 0)