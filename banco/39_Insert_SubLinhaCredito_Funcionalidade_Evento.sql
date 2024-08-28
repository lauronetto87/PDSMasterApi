/*
=================================================================================================================================================

	Objeto:			Tabela [Funcionalidade] e [Evento]
	Data Cria��o:	19/01/2017
	Desenvolvedor:	Igor Santos
	Descri��o:		Script de insert nas tabelas de funcionalidade e evento para a interface de Sub-Linha de Cr�dito
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/
USE [HomBD_Portal_Servico]

declare @fcd_id int

insert into dbo.Funcionalidade
	(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
	values
	('Interface de Sub-Linha de Cr�dito', 'SubLinhaCredito', 'A', 'admin', getdate(), 0)

set @fcd_id = @@IDENTITY

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Sub-Linhas de Cr�dito', 'Index', 'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Obter Sub-Linhas de Cr�dito por Linha de Cr�dito', 'ObterSubLinhasCreditoPorLinha', 
		'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Obter Sub-Linha de Cr�dito por Id', 'ObterSubLinhaCreditoPorId', 'A', 'admin', 
		getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Manter Sub-Linhas de Cr�dito', 'SalvarSubLinhaCredito', 'A', 'admin', getdate(), 0)

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Excluir Sub-Linha de Cr�dito', 'ExcluirSubLinhaCredito', 'A', 'admin', getdate(), 0)