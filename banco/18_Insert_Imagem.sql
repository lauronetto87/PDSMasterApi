/*
=================================================================================================================================================

	Objeto:			Tabela [Imagem]
	Data Criação:	22/11/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert na tabela de imagens
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.Imagem
(img_tipo, img_nome, img_descricao, img_caminho, img_ordem, img_status, usu_login, img_dat_cad, img_flag_excluido)
values
('B','Banner 01', NULL, 'banner1.jpg', 1, 'A', 'admin', getdate(), 0);

insert into dbo.Imagem
(img_tipo, img_nome, img_descricao, img_caminho, img_ordem, img_status, usu_login, img_dat_cad, img_flag_excluido)
values
('B','Banner 02', NULL, 'banner2.jpg', 2, 'A', 'admin', getdate(), 0);

select * from dbo.Imagem;