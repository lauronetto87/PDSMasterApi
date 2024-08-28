/*
=================================================================================================================================================

	Objeto:			Tabela [Banco]
	Data Cria��o:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descri��o:		Script de insert na tabela de bancos
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.Banco
(ban_codigo, ban_nome, ban_sigla, usu_login, ban_data_cad, ban_flag_excluido)
values
('47', 'Banco do Estado de Sergipe', 'BANESE', 'admin', getdate(), 0)

select * from dbo.Banco