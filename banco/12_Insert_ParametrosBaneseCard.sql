/*
=================================================================================================================================================

	Objeto:			Tabela [ParametrosBaneseCard]
	Data Criação:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert na tabela de parametros para o banese card
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.ParametrosBaneseCard
(pbc_LojistaNumero, pbc_LojistaChave, pbc_PortadorIndicador, pbc_PedidoMoeda, pbc_PedidoIdioma, pbc_FormaPagamentoBandeira, pbc_Autorizar, pbc_Capturar, 
	pbc_Bin, pbc_GerarToken, pbc_Versao, pbc_Xmlns, pbc_Codigo, pbc_URL)
values
(100129, 'f1b4c67e8bda91d897df2ac98bf9305cac65d11337edc896f0abc4e125829c06', 1, 76, 'PT', 'banesecard', 3, 'true', 636117, 'false', '1.0.0', 
	'http://www.banesecard.com.br', 1, 'https://200.199.122.218/Ecommerce/Mensagem/')

select * from dbo.ParametrosBaneseCard