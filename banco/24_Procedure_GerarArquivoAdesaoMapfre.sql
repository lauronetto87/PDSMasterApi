/*
=================================================================================================================================================

	Objeto:					Procedure [GerarArquivoAdesaoMapfre]
	Data Criação:		01/12/2016
	Desenvolvedor:	Igor Santos
	Descrição:			Gerar informações para arquivo de adesão da Mapfre
	Alterações:
		05/12/2016 - Igor Santos: Realizando update no campo ctt_flag_enviado de contratos para true nos contratos listados no arquivo gerado

=================================================================================================================================================
*/
create procedure dbo.GerarArquivoAdesaoMapfre @usu_login varchar(50)
as
begin
	declare @data_atual datetime;
	declare @header char(2000), @trailer char(2000); 
	declare @h_tipo_registro char(2), @h_data_envio char(8), @h_numero_remessa char(6), @h_cod_seguradora char(4), 
		@h_filler01 char(24), @h_cod_empresa char(10), @h_filler02 char(1946);
	declare @adesao table 
	(
		tipo_registro char(2), cod_estipulante char(4), envio_retorno char(1), seq_registro char(6), filler01 char(5),
		cod_cli_corret_prest char(10), cod_ident_cliente char(20), cpf char(14), rg char(14), orgao_emissor char(10),
		uf_emissao char(2), data_emissao char(8), nome char(50), data_nasc char(8), sexo char(1), estado_civil char(1),
		endereco char(70), numero char(10), complemento char(70), bairro char(25), cidade char(35), cep char(8), uf char(2), 
		ddd char(4), telefone char(8), ramal char(6), filler02 char(6), num_seguro char(4), cod_produto char(4), cod_plano char(4),
		faixa_etaria char(4), cod_vigencia char(4), cod_nivel char(4), cod_campanha char(4), valor_seguro char(15), 
		dia_cobranca char(2), data_adesao char(8), valor_prestacao char(6), qtd_meses char(2), cod_vendedor char(10),
		filial char(10), inicio_garantia char(8), valor_segurado char(10), filler03 char(34), canal_vendas char(4),
		filler04 char(63), remessa_envio char(6), seq_envio char(6), aceitacao char(1), motivo_rejeicao char(4),
		descricao_rejeicao char(255), cartao_beneficio char(16), num_sorteio char(10), dados_variaveis char(1102),
		ctt_id int
	);
	declare @t_tipo_registro char(2), @t_total_reg_enviados char(9), @t_filler char(1989);

	/* ========================= HEADER ========================= */
	set @h_tipo_registro = '01';
	set @data_atual = getdate();
	set @h_data_envio = convert(char(8), @data_atual, 112);
	set @h_filler01 = '';
	set @h_filler02 = '';

	select @h_cod_seguradora = pam_cod_seg from dbo.ParametrosAdesaoMapfre;
	select @h_cod_empresa = pam_cod_empresa from dbo.ParametrosAdesaoMapfre;
	select @h_numero_remessa = dbo.PadLeft(pam_numero_remessa, '0', 6) from dbo.ParametrosAdesaoMapfre;

	set @header = @h_tipo_registro + @h_data_envio + @h_numero_remessa + @h_cod_seguradora + @h_filler01 + @h_cod_empresa + @h_filler02

	/* ========================= ADESAO ========================= */
	insert into @adesao
		select '02', '0000', 'E', convert(char(6), (row_number() over(order by ctt.ctt_data_adesao)) + 1), '', '', '', 
			cli.cli_cpf_cnpj, cli.cli_identidade, cli.cli_orgao_emissor, cli.cli_uf_emissao, convert(char(8), cli.cli_data_emissao, 112),
			cli.cli_nome, convert(char(8), cli.cli_data_nasc, 112), cli.cli_sexo, cli.cli_estado_civil, 
			case when e.end_logradouro is null then '' else e.end_logradouro end, 
			case when e.end_num is null then '' else e.end_num end, 
			case when e.end_complemento is null then '' else e.end_complemento end, 
			case when e.end_bairro is null then '' else e.end_bairro end, 
			case when e.end_cidade is null then '' else e.end_cidade end, 
			case when e.end_cep is null then '' else e.end_cep end, 
			case when e.end_uf is null then '' else e.end_uf end, 
			tel.tel_ddd, substring(tel.tel_numero, 2, datalength(tel.tel_numero)), 
			'', '', '', pro.pro_cod_na_segur, '', '', '', '', '', replace(ctt.ctt_val_seg, '.', ''), '', 
			convert(char(8), ctt.ctt_data_adesao, 112), replace(ctt.ctt_val_prest, '.', ''), convert(char(2), ctt.ctt_qtd_prest),
			'', --Verificar o código do vendedor
			'', --Verificar filial
			isnull((select top 1 convert(char(8), cpl.cpl_data_venc, 112)
								from dbo.ContratoParcela cpl 
								where cpl.ctt_id = ctt.ctt_id and cpl.cpl_num_parc = 1), ''),
			replace(ctt.ctt_valor_segurado, '.', ''), '',
			'', --Verificar canal de vendas
			'', '', '', '', '', '', '',
			'', --Verificar numero de sorteio
			'', --Verificar dados variáveis,
			ctt_id
			from dbo.Contrato ctt 
				join dbo.Produto pro on pro.pro_id = ctt.pro_id
				join dbo.Cliente cli on cli.cli_id = ctt.cli_id
				join dbo.Endereco e on e.cli_id = cli.cli_id
				join dbo.Telefone tel on tel.cli_id = cli.cli_id
			where exists (select 1 from dbo.Produto pro 
											where pro.seg_id = 1 and ctt.pro_id = pro.pro_id)
				and ctt.ctt_flag_enviado = 0
				and e.end_flag_atual = 1
			order by ctt.ctt_data_adesao;

	/* ========================= TRAILER ========================= */
	set @t_tipo_registro = '16';
	set @t_total_reg_enviados = (select count(*) from @adesao) + 2;
	set @t_filler = '';

	set @trailer = @t_tipo_registro + @t_total_reg_enviados + @t_filler;

	/* ==================== UPDATE FLAG ENVIADO ==================== */
	update dbo.Contrato
		set ctt_flag_enviado = 1
		where ctt_id in (select a.ctt_id from @adesao a);

	/* ============= REGISTRANDO LOG DE ARQUIVO GERADO ============= */
	insert into dbo.LogAdesaoMapfre
		(lam_nome_arquivo, lam_qtd_registros, lam_caminho_arquivo, lam_data_geracao, usu_login)
		values
		('ADESAOMAPFRE' + @h_data_envio, (select count(*) from @adesao), '/Media/AdesaoMapfre/', 
			@data_atual, @usu_login);

	/* ========================= RESULTADO ========================= */
	select 'S' sta_geracao, 1 sequencial, @header info
	union
	select 'S', seq_registro, 
		tipo_registro + cod_estipulante + envio_retorno + dbo.PadLeft(seq_registro, '0', 6) + filler01 + 
		cod_cli_corret_prest + cod_ident_cliente + cpf + rg + orgao_emissor + uf_emissao + data_emissao + nome + data_nasc + 
		sexo + estado_civil + endereco + numero + complemento + bairro + cidade + cep + uf + dbo.PadLeft(ddd, '0', 4) + 
		telefone + ramal + filler02 + num_seguro + cod_produto + cod_plano + faixa_etaria + cod_vigencia + cod_nivel + 
		cod_campanha + dbo.PadLeft(valor_seguro, '0', 15) + dia_cobranca + data_adesao + dbo.PadLeft(valor_prestacao, '0', 6) + 
		dbo.PadLeft(qtd_meses, '0', 2) + cod_vendedor + filial + case when inicio_garantia is null then '' else inicio_garantia end + 
		dbo.PadLeft(valor_segurado, '0', 10) + filler03 + canal_vendas + filler04 + remessa_envio + seq_envio + aceitacao + 
		motivo_rejeicao + descricao_rejeicao + cartao_beneficio + num_sorteio + dados_variaveis 
		from @adesao
	union 
	select 'S', @t_total_reg_enviados, @trailer
	union
	select 'E', null, 'Contrato: ' + convert(varchar(max), ctt.ctt_id) + ' | Cliente: [' + cli.cli_cpf_cnpj + '] ' + 
		cli.cli_nome + ' -> Cliente sem endereço padrão cadastrado.'
		from Contrato ctt
			join Cliente cli on cli.cli_id = ctt.cli_id
		where pro_id in (1, 3) 
			and not exists (select 1 from Endereco e 
												where e.cli_id = ctt.cli_id)
end