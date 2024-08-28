/*
=================================================================================================================================================

	Objeto:			Tabela [Usuario]
	Data Criação:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert na tabela de usuários
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

declare @pfl_id int, @usu_login varchar(50), @usu_nome varchar(250), @usu_cpf_cnpj varchar(20), @usu_senha varchar(100), 
	@usu_ddi varchar(4), @usu_ddd varchar(4), @usu_celular varchar(20), @usu_email varchar(100), @usu_status char(1), @usu_tent_login int, 
	@usu_alt_senha bit, @usu_flag_excluido bit

set @pfl_id = 1;
set @usu_login = 'admin';
set @usu_nome = 'Administrador';
set @usu_cpf_cnpj = '';
set @usu_senha = '61eb4d7e04fa1b626fb29d28ba40e65c8e0eb9a57479c856c9348f2cb11d5b2a';
set @usu_ddi = '';
set @usu_ddd = '';
set @usu_celular = '';
set @usu_email = 'noreply@ma9.com.br';
set @usu_status = 'A';
set @usu_tent_login = 0;
set @usu_alt_senha = 0;
set @usu_flag_excluido = 0;

insert into dbo.Usuario
(pfl_id, uad_id, usu_login, usu_nome, usu_cpf_cnpj, usu_senha, usu_ddi, usu_ddd, usu_celular, usu_email, usu_status, usu_tent_login, usu_token, 
	usu_val_token, usu_alt_senha, usu_flag_excluido)
values
(@pfl_id, NULL, @usu_login, @usu_nome, @usu_cpf_cnpj, @usu_senha, @usu_ddi, @usu_ddd, @usu_celular, @usu_email, @usu_status, @usu_tent_login, 
	NULL, NULL, @usu_alt_senha, @usu_flag_excluido);

select * from dbo.Usuario;