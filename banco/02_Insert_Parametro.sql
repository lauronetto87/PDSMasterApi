/*
=================================================================================================================================================

	Objeto:			Tabela [Parametro]
	Data Criação:	18/11/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Script de insert na tabela de parâmetros
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('APP_ANDROID_VERSION', '0.1');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('APP_IOS_VERSION', '0.1');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('API_VERSION', '0.1');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_ABS_IMG_PRODUTO', 'Z:\pdsmedia\produto\imagem');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_ABS_VID_PRODUTO', 'Z:\pdsmedia\produto\video');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_ABS_BANNER', 'Z:\pdsmedia\banner');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_REMESSA_BOLETO', 'Z:\pdsmedia\remessaboleto');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_REL_IMG_PRODUTO', 'http://ma9chrome.intranet.ma9.local/produto/imagem');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_REL_VID_PRODUTO', 'http://ma9chrome.intranet.ma9.local/produto/video');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_REL_BANNER', 'http://ma9chrome.intranet.ma9.local/banner');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_REL_REMESSA_BOLETO', 'http://ma9chrome.intranet.ma9.local/remessaboleto');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('TELEFONE', '557932344250');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('ENDERECO', 'Av. Dr. Roosewelt Dantas Cardoso de Menezes (antiga Av. Gonçalo Prado Rollemberg), 1146 - Centro - CEP 49010-410 - Aracaju-SE');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('EMAIL', 'contato@banesecorretora.com.br');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('LATITUDE', '-10.9168062');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('LONGITUDE', '-37.0574743');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_ABS_ARQUIVOS_CONTRATO', 'Z:\pdsmedia\arquivoscontrato');

insert into dbo.Parametro
(prt_chave, prt_valor)
values
('CAMINHO_REL_ARQUIVOS_CONTRATO', 'http://ma9chrome.intranet.ma9.local/arquivoscontrato');

select * from dbo.Parametro;