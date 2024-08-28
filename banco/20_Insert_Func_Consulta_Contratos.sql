use [HomBD_Portal_Servico]

declare @fcd_id int, @evt_id int, @men_id int

insert into dbo.Funcionalidade
	(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
	values
	('Consulta de Contratos', 'RelContratosPorSeguradora', 'A',	'admin', getdate(),	0);

set @fcd_id = SCOPE_IDENTITY();

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Consulta de Contratos', 'Index', 'A', 'admin', getdate(), 0);

set @evt_id = SCOPE_IDENTITY();

insert into dbo.Evento
	(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
	values
	(@fcd_id, 'Obter Contratos Periodo de Contratacao', 'ObterContratosPorSeguradoraEPeriodoContratacao', 
		'A', 'admin', getdate(), 0);

update dbo.Menu
	set men_ordem = 6
	where men_id = 5;

update dbo.Menu
	set men_ordem = 5
	where men_id = 4;

insert into dbo.Menu
	(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
	values
	('Seguradora', NULL, NULL, 4, 'home', 'A');

set @men_id = SCOPE_IDENTITY();

insert into dbo.Menu
	(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
	values
	('Consulta de Contratos', @evt_id, @men_id, 1, NULL, 'A');