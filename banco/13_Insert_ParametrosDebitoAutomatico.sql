/*
=================================================================================================================================================

	Objeto:			Tabela [ParametrosDebitoAutomatico]
	Data Criação:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert na tabela de parametros para débito automático
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.ParametrosDebitoAutomatico
(pda_codigo_convenio, pda_nome_empresa, pda_codigo_banco, pda_nome_banco, pda_numero_sequencial, pda_numero_sequencial_retorno)
values
('000255', 'BANESE CORRETORA', '047', 'BANESE', 16, 0);

select * from dbo.ParametrosDebitoAutomatico;