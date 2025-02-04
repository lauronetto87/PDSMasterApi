/*
=================================================================================================================================================

	Objeto:			Tabela [ParametroBoleto]
	Data Criação:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert na tabela de parametros para o boleto
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.ParametroBoleto
(pbl_cod_emp, pbl_nome_emp, pbl_cod_inscricao, pbl_inscricao, pbl_seq_remessa, pbl_ult_remessa, pbl_seq_retorno, pbl_ult_retorno, pbl_status, 
	pbl_carteira, pbl_cnpj, pbl_agencia, pbl_conta, pbl_digito_conta, pbl_codigo_cedente, pbl_codigo_banco, pbl_tipo_conta)
values
('001', 'Banese Corretora de Seguros', '01', 'Incricao', 56, NULL, 0, NULL, 'A', 'Carteira', '06325790000161', '14', '101904', '6', '000', 47, '03')

select * from dbo.ParametroBoleto