/*
=================================================================================================================================================

	Objeto:			Tabela [Menu]
	Data Criação:	21/11/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert na tabela de menu
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Clientes', 25, NULL, 1, 'supervisor_account', 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Produto', NULL, NULL, 2, 'widgets', 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Produtor', NULL, NULL, 3, 'perm_identity', 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Integração', NULL, NULL, 4, 'archive', 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Administração', NULL, NULL, 5, 'build', 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Listagem', 32, 2, 1, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Comissionamento', 65, 2, 2, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Cadastro', 53, 3, 1, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Associar Usuário', 58, 3, 2, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Extrato de Comissão', 70, 3, 3, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Extrato de Pontuação', 80, 3, 4, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Rankeamento', 88, 3, 5, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Gerar Remessa Boleto', 75, 4, 1, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Ler Retorno Boleto', 78, 4, 2, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Gerar Remessa Débito', 84, 4, 3, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Ler Retorno Débito', 86, 4, 4, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Usuários', 17, 5, 1, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Perfis', 12, 5, 2, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Funcionalidades', 2, 5, 3, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Eventos', 7, 5, 4, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Permissões', 22, 5, 5, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Seguradora', NULL, NULL, 4, 'home', 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Consulta de Contratos', 89, 22, 1, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Ler Arquivo SCC', 91, 4, 5, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Gerar Arquivo Adesão Mapfre', 95, 4, 6, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Cargas de Pontuação e Comissão', 97, 5, 6, NULL, 'A');

insert into dbo.Menu
(men_titulo, evt_id, men_pai, men_ordem, men_icon, men_status)
values
('Painel de Gestão', 98, NULL, 6, 'trending_up', 'A');

select * from dbo.Menu