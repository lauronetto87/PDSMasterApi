/*
=================================================================================================================================================

	Objeto:			Tabela [Banco]
	Data Criação:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert na tabela de bancos
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.Banco
(ban_codigo, ban_nome, ban_sigla, usu_login, ban_data_cad, ban_flag_excluido)
values
('47', 'Banco do Estado de Sergipe', 'BANESE', 'admin', getdate(), 0)

select * from dbo.Banco