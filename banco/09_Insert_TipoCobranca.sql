/*
=================================================================================================================================================

	Objeto:			Tabela [TipoCobranca]
	Data Criação:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert na tabela de tipos de cobrança
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.TipoCobranca
(tcc_descricao, tcc_status, tcc_data_cad, usu_login, tcc_flag_excluido)
values
('Débito Automático', 'A', getdate(), 'admin', 0);

insert into dbo.TipoCobranca
(tcc_descricao, tcc_status, tcc_data_cad, usu_login, tcc_flag_excluido)
values
('Boleto Banese', 'A', getdate(), 'admin', 0);

insert into dbo.TipoCobranca
(tcc_descricao, tcc_status, tcc_data_cad, usu_login, tcc_flag_excluido)
values
('Banese Card', 'A', getdate(), 'admin', 0);

select * from dbo.TipoCobranca;