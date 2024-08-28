/*
=================================================================================================================================================

	Objeto:			Tabela [Seguradora]
	Data Cria��o:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descri��o:		Script de insert na tabela de seguradoras
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.Seguradora
(seg_nome, seg_nome_abrev, seg_status, seg_data_cad, usu_login, seg_flag_excluido)
values
('MAPFRE SEGURADORA S/A', 'MAPFRE', 'A', getdate(), 'admin', 0);

insert into dbo.Seguradora
(seg_nome, seg_nome_abrev, seg_status, seg_data_cad, usu_login, seg_flag_excluido)
values
('ICATU SEGUROS', 'ICATU', 'A', getdate(), 'admin', 0);

select * from dbo.Seguradora;