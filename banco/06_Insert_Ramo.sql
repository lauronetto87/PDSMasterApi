/*
=================================================================================================================================================

	Objeto:			Tabela [Ramo]
	Data Cria��o:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descri��o:		Script de insert na tabela de ramos
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

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
('Capitaliza��o', 'A', 'admin', getdate(), 0)

insert into dbo.Ramo
(ram_nome, ram_status, usu_login, ram_data_cad, ram_flag_excluido)
values
('Residencial', 'A', 'admin', getdate(), 0)

select * from dbo.Ramo