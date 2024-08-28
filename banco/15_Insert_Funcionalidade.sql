/*
=================================================================================================================================================

	Objeto:			Tabela [Funcionalidade]
	Data Cria��o:	21/11/2016
	Desenvolvedor:	Igor Santos
	Descri��o:		Script de insert na tabela de funcionalidades
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface Inicial', 'Home', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Funcionalidades', 'Funcionalidade', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Eventos', 'Evento', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Perfil', 'Perfil', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Usu�rios', 'Usuario', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Permiss�es', 'Permissao', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Clientes', 'Cliente', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Telefones', 'Telefone', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Endere�os', 'Endereco', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Produto', 'Produto', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface Contrato', 'Contrato', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Produtor', 'Produtor', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Produtor Usu�rio', 'ProdutorUsuario', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Impress�o de PDF', 'ImprimirPDF', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Comissionamento', 'Comissionamento', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Extrato de Comissionamento', 'ExtratoComissionamento', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Comissionamento Parcelas', 'ComissionamentoParcela', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface Arquivo Remessa Boleto', 'RemessaBoleto', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface Arquivo Retorno Boleto', 'RetornoBoleto', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Extrato de Pontua��o', 'ExtratoPontuacao', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface Arquivo Remessa Debito Automatico', 'RemessaDebitoAutomatico', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface Arquivo Retorno Debito Automatico', 'RetornoDebitoAutomatico', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface de Rankeamento', 'Rankeamento', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Consulta de Contratos', 'RelContratosPorSeguradora', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Interface Arquivo SCC Prestamista', 'ArquivoSCCPrestamista', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Gera��o de Arquivo de Ades�o da Mapfre', 'ArquivoAdesaoMapfre', 'A', 'admin', getdate(), 0);

insert into dbo.Funcionalidade
(fcd_descricao, fcd_controller, fcd_status, usu_login, fcd_data_cad, fcd_flag_excluido)
values
('Painel de Gest�o', 'PainelGestao', 'A', 'admin', getdate(), 0);

select * from dbo.Funcionalidade