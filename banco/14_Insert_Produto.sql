/*
=================================================================================================================================================
=																																				=
=	Objeto:			Tabela [Produto]																											=
=	Data Criação:	21/11/2016																													=
=	Desenvolvedor:	Igor Santos																													=
=	Descrição:		Script de insert na tabela de produtos																						=
=	Alterações:																																	=
=		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]
		25/01/2017 - Lauro Daniel: Inserção do Produto Banese Amigo																									=
=																																				=
=================================================================================================================================================
*/
use [HomBD_Portal_Servico]

insert into dbo.Produto
(ram_id, seg_id, com_id, pro_nome, pro_descricao, pro_categoria, pro_min_parc, pro_max_parc, pro_cod_na_segur, pro_tipo_premio, pro_data_cad, 
	pro_status, usu_login, pro_meses_cobert, pro_imagem, pro_introducao, pro_coberturas, pro_beneficios, pro_comissionamento, pro_video, 
	pro_rodape, pro_imagem_mob, pro_flag_excluido)
values
(1, 1, NULL, 'AP BANESE PREMIADO', 'AP BANESE PREMIADO', 'S', 1, 1, '001', 1, getdate(), 'A', 'admin', 12, NULL, 
	'<p>A vida não precisa ser complicada. Mas isso não significa que você não se preocupe com o futuro.</p><p>Para pessoas como você, a MAPFRE criou um seguro de vida objetivo, simples e descomplicado.', 
	'<ul><li><strong>Morte:</strong> é a garantia do pagamento de indenização ao beneficiário do seguro de 100% do capital segurado contratado para esta cobertura por morte natural ou acidental do segurado, observada as condições contratuais, desde que não se trate de risco expressamente excluído.</li><li><strong>IPA - Invalidez Permanente Total ou Parcial por Acidente:</strong> pagamento de até 100% do capital segurado da cobertura de morte, determinado em função do grau de invalidez constatado, em caso de invalidez decorrente de acidente.</li><li><strong>Decessos:</strong> garante a prestação do serviço ou o reembolso dos gastos com o sepultamento ou a cremação (onde existir este serviço no município de moradia habitual do segurado), até o limite do capital segurado contratado para esta cobertura, em caso de falecimento do segurado.</li><li><b>Antecipação de Indenização: </b>em caso de fase terminal decorrente de doença ou acidente, serão adiantados 100% do capital segurado contratado para a cobertura de morte, obedecendo a uma carência de 120 dias, contados a partir da data do início da vigência individual do seguro. Após o pagamento da Antecipação, o seguro será automaticamente extinto.</li><li><b>Google</b> <a href="http://www.google.com">link</a><br></li></ul>', 
	'<ul><li>Prêmio mínimo para cobrança mensal a partir de R$ 20,00 mensais, independente da periodicidade.</li><li>Sorteio mensal de R$ 20 mil, dos quais será deduzido Imposto de Renda.</li><li>Adesão sem preenchimento de DPSA.</li></ul>', 
	'Modelo de comissionamento para o Produto:<ul><li>O Produtor receberá 50% da comissão devida na primeira parcela.</li></ul>', NULL, 
	'Um produto da MAPFRE Vida S.A., CNPJ 54.484.753/0001-49. Processo SUSEP nº 15414.004008/2008-16. O registro deste plano na SUSEP não implica, por parte da Autarquia, incentivo ou recomendação à sua comercialização.</p>', 
	NULL, 0);

insert into dbo.Produto
(ram_id, seg_id, com_id, pro_nome, pro_descricao, pro_categoria, pro_min_parc, pro_max_parc, pro_cod_na_segur, pro_tipo_premio, pro_data_cad, 
	pro_status, usu_login, pro_meses_cobert, pro_imagem, pro_introducao, pro_coberturas, pro_beneficios, pro_comissionamento, pro_video, 
	pro_rodape, pro_imagem_mob, pro_flag_excluido)
values
(2, 2, NULL, 'BANESE CAP UNIQUE', 'BANESE CAP UNIQUE', 'C', 1, 5, '002', 1, getdate(), 'A', 'admin', 60, NULL, NULL, NULL, NULL, NULL, 
	NULL, NULL, NULL, 0);

insert into dbo.Produto
(ram_id, seg_id, com_id, pro_nome, pro_descricao, pro_categoria, pro_min_parc, pro_max_parc, pro_cod_na_segur, pro_tipo_premio, pro_data_cad, 
	pro_status, usu_login, pro_meses_cobert, pro_imagem, pro_introducao, pro_coberturas, pro_beneficios, pro_comissionamento, pro_video, 
	pro_rodape, pro_imagem_mob, pro_flag_excluido)
values
(3, 1, NULL, 'BANESE SEGURO RESIDENCIAL', 'BANESE SEGURO RESIDENCIAL', 'S', 1, 1, '000254', 1, getdate(), 'A', 'admin', 12, NULL, NULL, NULL, 
	NULL, NULL, NULL, NULL, NULL, 0);

insert into dbo.Produto
(ram_id, seg_id, com_id, pro_nome, pro_descricao, pro_categoria, pro_min_parc, pro_max_parc, pro_cod_na_segur, pro_tipo_premio, pro_data_cad, 
	pro_status, usu_login, pro_meses_cobert, pro_imagem, pro_introducao, pro_coberturas, pro_beneficios, pro_comissionamento, pro_video, 
	pro_rodape, pro_imagem_mob, pro_flag_excluido)
values
(2, 2, NULL, 'BANESE CAP PREMIUM', 'BANESE CAP PREMIUM', 'C', 1, 1, '001', 1, getdate(), 'A', 'admin', 58, NULL, NULL, NULL, NULL, NULL, 
	NULL, NULL, NULL, 0);

insert into dbo.Produto
(ram_id, seg_id, com_id, pro_nome, pro_descricao, pro_categoria, pro_min_parc, pro_max_parc, pro_cod_na_segur, pro_tipo_premio, pro_data_cad, 
	pro_status, usu_login, pro_meses_cobert, pro_imagem, pro_introducao, pro_coberturas, pro_beneficios, pro_comissionamento, pro_video, 
	pro_rodape, pro_imagem_mob, pro_flag_excluido)
values
(2, 2, NULL, 'Banese Cap + Bônus', 'Banese cap + Bônus', 'C', 84, 84, '001', 1, getdate(), 'A', 'admin', 84, NULL, NULL, NULL, NULL, NULL, 
	NULL, NULL, NULL, 0);
	
insert into dbo.Produto
(ram_id, seg_id, com_id, pro_nome, pro_descricao, pro_categoria, pro_min_parc, pro_max_parc, pro_cod_na_segur, pro_tipo_premio, pro_data_cad, 
	pro_status, usu_login, pro_meses_cobert, pro_imagem, pro_introducao, pro_coberturas, pro_beneficios, pro_comissionamento, pro_video, 
	pro_rodape, pro_imagem_mob, pro_flag_excluido)
values
(2, 2, NULL, 'Banese Cap + Prêmio', 'Banese cap + Prêmio', 'C', 36, 36, '001', 1, getdate(), 'A', 'admin', 36, NULL, NULL, NULL, NULL, NULL, 
	NULL, NULL, NULL, 0);
	
insert into dbo.Produto
(ram_id, seg_id, com_id, pro_nome, pro_descricao, pro_categoria, pro_min_parc, pro_max_parc, pro_cod_na_segur, pro_tipo_premio, pro_data_cad, 
	pro_status, usu_login, pro_meses_cobert, pro_imagem, pro_introducao, pro_coberturas, pro_beneficios, pro_comissionamento, pro_video, 
	pro_rodape, pro_imagem_mob, pro_flag_excluido)
values
(2, 2, NULL, 'Banese Cap + Vida', 'Banese cap + Vida', 'C', 120, 120, '001', 1, getdate(), 'A', 'admin', 120, NULL, NULL, NULL, NULL, NULL, 
	NULL, NULL, NULL, 0);

insert into dbo.Produto
(ram_id, seg_id, com_id, pro_nome, pro_descricao, pro_categoria, pro_min_parc, pro_max_parc, pro_cod_na_segur, pro_tipo_premio, pro_data_cad, 
	pro_status, usu_login, pro_meses_cobert, pro_imagem, pro_introducao, pro_coberturas, pro_beneficios, pro_comissionamento, pro_video, 
	pro_rodape, pro_imagem_mob, pro_flag_excluido)
values
(1, 1, NULL, 'BANESE AMIGO', 'BANESE AMIGO', 'S', 1, 1, '001', 1, getdate(), 'A', 'admin', 12,NULL, NULL, NULL, NULL, NULL, 
	NULL, NULL, NULL, 0);

select * from dbo.Produto