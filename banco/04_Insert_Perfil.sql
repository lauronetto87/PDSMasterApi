/*
=================================================================================================================================================

	Objeto:			Tabela [Perfil]
	Data Criação:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert na tabela de perfis
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.Perfil
(pfl_nome, pfl_status, usu_login, pfl_data_cad, pfl_flag_excluido)
values
('Administrador', 'A', 'admin', getdate(), 0);

insert into dbo.Perfil
(pfl_nome, pfl_status, usu_login, pfl_data_cad, pfl_flag_excluido)
values
('Seguradora', 'A', 'admin', getdate(), 0);

insert into dbo.Perfil
(pfl_nome, pfl_status, usu_login, pfl_data_cad, pfl_flag_excluido)
values
('Produtor', 'A', 'admin', getdate(), 0);

insert into dbo.Perfil
(pfl_nome, pfl_status, usu_login, pfl_data_cad, pfl_flag_excluido)
values
('Cliente', 'A', 'admin', getdate(), 0);

select * from dbo.Perfil;