/*
=================================================================================================================================================

	Objeto:			Tabela [Ramo]
	Data Criação:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert na tabela de ramos
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.Ramo
(ram_nome, ram_status, usu_login, ram_data_cad, ram_flag_excluido)
values
('Vida', 'A', 'admin', getdate(), 0)

insert into dbo.Ramo
(ram_nome, ram_status, usu_login, ram_data_cad, ram_flag_excluido)
values
('Capitalização', 'A', 'admin', getdate(), 0)

insert into dbo.Ramo
(ram_nome, ram_status, usu_login, ram_data_cad, ram_flag_excluido)
values
('Residencial', 'A', 'admin', getdate(), 0)

select * from dbo.Ramo