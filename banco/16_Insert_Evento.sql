/*
=================================================================================================================================================

	Objeto:			Tabela [Evento]
	Data Cria��o:	21/11/2016
	Desenvolvedor:	Igor Santos
	Descri��o:		Script de insert na tabela de eventos
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(1, 'Interface Inicial', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(2, 'Funcionalidades', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(2, 'Pesquisar Funcionalidade', 'PesquisarFuncionalidade', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(2, 'Pesquisar Funcionalidade por Id', 'ObterFuncionalidadePorId', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(2, 'Manter Funcionalidade', 'SalvarFuncionalidade', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(2, 'Excluir Funcionalidade', 'ExcluirFuncionalidade', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(3, 'Eventos', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(3, 'Pesquisar Eventos', 'PesquisarEventos', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(3, 'Pesquisar Evento por Id', 'ObterEventoPorId', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(3, 'Manter Evento', 'SalvarEvento', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(3, 'Excluir Evento', 'ExcluirEvento', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(4, 'Perfis', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(4, 'Pesquisar Perfis', 'PesquisarPerfil', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(4, 'Pesquisar Perfil por Id', 'ObterPerfilPorId', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(4, 'Manter Perfil', 'SalvarPerfil', 'A', 'admin', getdate(), 0);
	
insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(4, 'Excluir Perfil', 'ExcluirPerfil', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(5, 'Usuarios', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(5, 'Pesquisar Usuario', 'PesquisarUsuario', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(5, 'Pesquisar Usuario por Id', 'ObterUsuarioPorId', 'A', 'admin', getdate(), 0);
	
insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(5, 'Manter Usu�rio', 'SalvarUsuario', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(5, 'Excluir Usu�rio', 'ExcluirUsuario', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(6, 'Permiss�es', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(6, 'Obter Eventos por Perfil e Funcionalidade', 'ObterEventosPorPerfilEFuncionalidade', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(6, 'Manter Permiss�o', 'SalvarPermissoes', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(7, 'Clientes', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(7, 'Pesquisar Cliente', 'PesquisarCliente', 'A', 'admin', getdate(), 0);
	
insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(7, 'Pesquisar Cliente por Id', 'ObterClientePorId', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(7, 'Manter Cliente', 'SalvarCliente', 'A', 'admin', getdate(), 0);
	
insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(7, 'Excluir Cliente', 'ExcluirCliente', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(8, 'Excluir Telefone', 'ExcluirTelefone', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(9, 'Excluir Endere�o', 'ExcluirEndereco', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(10, 'Interface de Produto', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(10, 'Listar Produtos', 'ListaDeProdutos', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(10, 'Detalhar Produto', 'ObterProdutoPorId', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(10, 'Obter Plano por ID', 'ObterPlanoPorId', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(10, 'Salvar Plano Produto', 'SalvarPlanoProduto', 'A', 'admin', getdate(), 0);
	
insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(10, 'Salvar Produto', 'SalvarProduto', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Lista de Contratos', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Permiss�o Todos Produtores', 'ObterTodosProdutores', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Permiss�o Produtores Unidade Adm', 'ObterProdutoresUnidadeAdm', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Cancelar Contrato', 'CancelarContrato', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Contratar Produto', 'SalvarContrato', 'A', 'admin', getdate(), 0);	
	
insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Lista de Contratos Cliente', 'ContratosDoCliente', 'A', 'admin', getdate(), 0);
	
insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Obter Cliente', 'ObterClientePorID', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Detalhar Contrato', 'DetalharContrato', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Boleto Banese', 'BoletoBanese', 'A', 'admin', getdate(), 0);
	
insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Visualizar Boleto', 'VisualizarBoleto', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Gerar PDF', 'GeraPDF', 'A', 'admin', getdate(), 0);
	
insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Pagamento Banese Card', 'PagamentoBaneseCard', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Efetuar Pagamento com Banese Card', 'EfetuarPagamentoBaneseCard', 'A', 'admin', getdate(), 0);
	
insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Selecionar Produto', 'SelecionarProduto', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(11, 'Selecionar Plano Produto', 'SelecionarPlanoProduto', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(12, 'Produtores', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(12, 'Pesquisar Produtor', 'PesquisarProdutor', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(12, 'Pesquisar Produtor Por Id', 'ObterProdutorPorId', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(12, 'Manter Produtor', 'SalvarProdutor', 'A', 'admin', getdate(), 0);
	
insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(12, 'Excluir Produtor', 'ExcluirProdutor', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(13, 'Produtor Usu�rio', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(14, 'Impress�o de PDF', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(14, 'Contrato de Acidentes Pessoais', 'ImprimirContratoAP', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(14, 'Contrato Banese Cap Unique', 'ContratoBaneseCapUnique', 'A', 'admin', getdate(), 0);
	
insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(14, 'Contrato Seguro Residencial', 'ImprimirContratoSeguroResidencial', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(14, 'Contrato Banese Cap Premium', 'ContratoBaneseCapPremium', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(14, 'Contrato Banese Cap Bonus', 'ContratoBaneseCapBonus', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(15, 'Comissionamentos', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(15, 'Pesquisar Comissionamentos', 'PesquisarComissionamentos', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(15, 'Pesquisar Comissionamento por Id', 'ObterComissionamentoPorId', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(15, 'Manter Comissionamento', 'SalvarComissionamento', 'A', 'admin', getdate(), 0);
	
insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(15, 'Excluir Comissionamento', 'ExcluirComissionamento', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(16, 'Extrato de Comissionamento', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(16, 'Pesquisar Extratos de Comiss�o', 'PesquisarExtratosComissao', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(16, 'Permiss�o Todos Produtores', 'ObterTodosProdutores', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(16, 'Permiss�o Produtores Unidade Adm', 'ObterProdutoresUnidadeAdm', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(17, 'Comissionamento Parcelas', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(18, 'Lista de Arquivos', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(18, 'Listar Arquivos Remessa Gerados', 'ListaArquivosGerados', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(18, 'Gerar Arquivo Remessa Boleto', 'GerarArquivoRemessa', 'A', 'admin', getdate(), 0);	

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(19, 'Upload Arquivo Retorno', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(19, 'Lista Arquivos Importados', 'ListaArquivosImportados', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(20, 'Extrato de Pontua��o', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(20, 'Pesquisar Extratos de Pontua��o', 'PesquisarExtratosPontuacao', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(20, 'Permiss�o Todos Produtores', 'ObterTodosProdutores', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(20, 'Permiss�o Produtores Unidade Adm', 'ObterProdutoresUnidadeAdm', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(21, 'Lista de Arquivos', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(21, 'Listar Arquivos Remessa Gerados', 'ListaArquivosGerados', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(22, 'Index Arquivo Retorno Debito Automatico', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(22, 'Lista Arquivos Importados', 'ListaArquivosImportados', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(23, 'Rankeamento', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(24, 'Consulta de Contratos', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(24, 'Obter Contratos Periodo de Contratacao', 'ObterContratosPorSeguradoraEPeriodoContratacao', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(25, 'Index', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(25, 'Upload Arquivo SCC', 'UploadArquivoSCC', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
('11', 'Listar Arquivos', 'ListarArquivos', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(26, 'Gerar Arquivo de Adesao da Mapfre', 'GerarArquivoAdesaoMapfre', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(26, 'Index', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(26, 'Obter Contratos com Critica', 'ObterContratosComCritica', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(20, 'Cargas de `Pontua��o e Comiss�o', 'PontuacaoComissao', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(27, 'Painel de Gest�o', 'Index', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(25, 'Listar Arquivos SCC', 'ListaArquivosSCC', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(10, 'Exibir Bot�o Editar', 'ExibirBotaoEditar', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(10, 'Exibir Bot�o Planos', 'ExibirBotaoPlanos', 'A', 'admin', getdate(), 0);

insert into dbo.Evento
(fcd_id, evt_descricao, evt_acao, evt_status, usu_login, evt_data_cad, evt_flag_excluido)
values
(10, 'Exibir Produtos Inativos', 'ExibirProdutosInativos', 'A', 'admin', getdate(), 0);

select * from dbo.Evento