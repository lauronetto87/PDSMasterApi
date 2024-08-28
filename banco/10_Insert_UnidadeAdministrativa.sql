/*
=================================================================================================================================================

	Objeto:			Tabela [UnidadeAdministrativa]
	Data Cria��o:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descri��o:		Script de insert na tabela de unidades administrativas
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.UnidadeAdministrativa
(uad_codigo, uad_nome, uad_cod_contabil, uad_email, uad_cnpj, uad_status, usu_login, uad_data_cad, uad_flag_excluido)
values
(99, 'Banese Corretora', 991, 'contato@banesecorretora.com.br', NULL, 'A', 'admin', getdate(), 0)

select * from dbo.UnidadeAdministrativa