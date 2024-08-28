USE [HomBD_Portal_Servico]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
==================================================================================================================================================

	Objeto:			Procedure [prestamista].[ProcessarLinhaArquivoSCC]
	Data Criação:	06/01/2017
	Desenvolvedor:	Igor Santos
	Descrição:		Processar linha do arquivo SCC
	Alterações:
		[Data] - [Desenvolvedor]: [Comentário]

==================================================================================================================================================
*/
CREATE PROCEDURE prestamista.ProcessarLinhaArquivoSCC @num_linha int, @info_linha varchar(max), @usu_login varchar(50) 
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @data_atual datetime, @pct_id bigint, 
		@li_tipo_reg char(1), @li_sequencial char(6), @li_chave_operacao char(13), @li_cod_sublinha char(6), @li_cod_convenio char(6), 
		@li_cod_agencia_cli char(4), @li_num_conta_cli char(9), @li_cic_cli char(17), @li_nome_cli char(35), @li_data_nasc_cli char(8), 
		@li_valor_contrato char(10), @li_data_liberacao char(8), @li_data_vencimento char(8), @li_data_liquidacao char(8), @li_status char(1), 
		@li_status_seguro char(1), @li_dia_util_debito char(2), @li_qtd_parcelas char(3), @li_origem_contratacao char(1), @li_cod_regra char(6), 
		@li_valor_taxa char(10), @li_valor_premio char(10), @li_parcela_unica char(1)

	set @data_atual		= getdate()
	set @li_tipo_reg	= substring(@info_linha, 1, 1)

	/* Verificando se o tipo de registro passado corresponde a linha */
	if (@li_tipo_reg = '1')
	begin
		/* ========================================================= LEITURA DA LINHA ========================================================= */
		set @li_sequencial			= substring(@info_linha, 2, 6)
		set @li_chave_operacao		= substring(@info_linha, 8, 13)
		set @li_cod_sublinha		= substring(@info_linha, 21, 6)
		set @li_cod_convenio		= substring(@info_linha, 27, 6)
		set @li_cod_agencia_cli		= substring(@info_linha, 33, 4)
		set @li_num_conta_cli		= substring(@info_linha, 37, 9)
		set @li_cic_cli				= substring(@info_linha, 46, 17)
		set @li_nome_cli			= substring(@info_linha, 63, 35)
		set @li_data_nasc_cli		= substring(@info_linha, 98, 8)
		set @li_valor_contrato		= substring(@info_linha, 106, 10)
		set @li_data_liberacao		= substring(@info_linha, 116, 8)
		set @li_data_vencimento		= substring(@info_linha, 124, 8)
		set @li_data_liquidacao		= substring(@info_linha, 132, 8)
		set @li_status				= substring(@info_linha, 140, 1)
		set @li_status_seguro		= substring(@info_linha, 141, 1)
		set @li_dia_util_debito		= substring(@info_linha, 142, 2)
		set @li_qtd_parcelas		= substring(@info_linha, 144, 3)
		set @li_origem_contratacao	= substring(@info_linha, 147, 1)
		set @li_cod_regra			= substring(@info_linha, 148, 6)
		set @li_valor_taxa			= substring(@info_linha, 154, 10)
		set @li_valor_premio		= substring(@info_linha, 164, 10)
		set @li_parcela_unica		= substring(@info_linha, 174, 1)
		/* ==================================================================================================================================== */

		/* ============================================================= CONTRATO ============================================================= */
		/* Apenas é processado clientes do tipo pessoa física e novos contratos */
		if (substring(@li_cic_cli, 10, 4) = '0000' and @li_status_seguro = 'S' and @li_status = '0')
		begin
			declare @data_nasc_cli datetime, @data_liberacao datetime, @data_vencimento datetime, @data_liquidacao datetime, @status_seguro bit,
				@valor_contrato decimal(9, 2), @valor_taxa decimal(9, 2), @valor_premio decimal(9, 2), @parcela_unica bit, @existe_contrato int
		
			set @data_nasc_cli		= null
			set @data_liberacao		= null
			set @data_vencimento	= null
			set @data_liquidacao	= null
			set @status_seguro		= 0
			set @valor_contrato		= convert(decimal(9, 2), substring(@li_valor_contrato, 1, 8) + '.' + substring(@li_valor_contrato, 9, 2))
			set @valor_taxa			= convert(decimal(9, 2), substring(@li_valor_taxa, 1, 8) + '.' + substring(@li_valor_taxa, 9, 2))
			set @valor_premio		= convert(decimal(9, 2), substring(@li_valor_premio, 1, 8) + '.' + substring(@li_valor_premio, 9, 2))
			set @parcela_unica		= 0

			/* Tratando a data de nascimento quando não vier preenchida */
			if (@li_data_nasc_cli != '00000000')
				set @data_nasc_cli = convert(datetime, @li_data_nasc_cli)

			/* Tratando a data da liberação quando não vier preenchida */
			if (@li_data_liberacao != '00000000')
				set @data_liberacao = convert(datetime, @li_data_liberacao)

			/* Tratando a data de vencimento quando não vier preenchida */
			if (@li_data_vencimento != '00000000')
				set @data_vencimento = convert(datetime, @li_data_vencimento)

			/* Tratando a data de liquidação quando não vier preenchida */
			if (@li_data_liquidacao != '00000000')
				set @data_liquidacao = convert(datetime, @li_data_liquidacao)

			/* Tratando a origem de contratação quando não vier preenchida */
			if (@li_origem_contratacao = ' ')
				set @li_origem_contratacao = null

			/* Fazendo a conversão do campo de status do seguro de 'S' para 'True' */
			if (@li_status_seguro = 'S')
				set @status_seguro = 1

			/* Fazendo a conversão do campo de parcela unica de 'S' para 'True' */
			if (@li_parcela_unica = 'S')
				set @parcela_unica = 1
			
			insert into prestamista.Contrato
				(pct_chave_operacao, pct_cod_sublinha, pct_cod_convenio, pct_cod_agencia_cli, pct_num_conta_cli, pct_cic_cli, pct_nome_cli, 
					pct_data_nasc_cli, pct_valor_contrato, pct_data_liberacao, pct_data_vencimento, pct_data_liquidacao, pct_status, 
					pct_status_seguro, pct_dia_util_debito, pct_qtd_parcelas, pct_origem_contratacao, pct_cod_regra, pct_valor_taxa, 
					pct_valor_premio, pct_parcela_unica, usu_login_cad, pct_data_cad, usu_login_alt, pct_data_alt)
				values
				(@li_chave_operacao, @li_cod_sublinha, @li_cod_convenio, @li_cod_agencia_cli, @li_num_conta_cli, @li_cic_cli, @li_nome_cli, 
					@data_nasc_cli, @valor_contrato, @data_liberacao, @data_vencimento, @data_liquidacao, 'A', @status_seguro, @li_dia_util_debito, 
					@li_qtd_parcelas, @li_origem_contratacao, @li_cod_regra, @valor_taxa, @valor_premio, @parcela_unica, @usu_login, @data_atual,
					null, null)

			set @pct_id = @@identity
			
			/* ===================================================== PARCELAS DO CONTRATO ===================================================== */
			declare @num_parcela int

			set @num_parcela = 1

			if (@parcela_unica = 1)
			begin
				/* Inserir parcela já paga */
				insert into prestamista.ContratoParcela
					(pct_id, pcp_num_parcela, pcp_valor, pcp_data_venc, pcp_status, pcp_valor_pago, pcp_data_pag, usu_login_cad, pcp_data_cad, 
						usu_login_alt, pcp_data_alt)
					values
					(@pct_id, 1, @valor_premio, @data_liberacao, 'P', null, null, @usu_login, @data_atual, null, null)
			end
			else begin
				/* Inserir parcelas do contrato, sendo que a primeira já paga */
				while (@num_parcela <= @li_qtd_parcelas)
				begin
					if (@num_parcela = 1)
					begin
						insert into prestamista.ContratoParcela
							(pct_id, pcp_num_parcela, pcp_valor, pcp_data_venc, pcp_status, pcp_valor_pago, pcp_data_pag, usu_login_cad, 
								pcp_data_cad, usu_login_alt, pcp_data_alt)
							values
							(@pct_id, @num_parcela, @valor_premio, @data_liberacao, 'P', null, null, @usu_login, @data_atual, null, null)
					end
					else begin
						insert into prestamista.ContratoParcela
							(pct_id, pcp_num_parcela, pcp_valor, pcp_data_venc, pcp_status, pcp_valor_pago, pcp_data_pag, usu_login_cad, 
								pcp_data_cad, usu_login_alt, pcp_data_alt)
							values
							(@pct_id, @num_parcela, @valor_premio, dateadd(month, @num_parcela - 1, @data_liberacao), 'A', null, null, 
								@usu_login, @data_atual, null, null)
					end

					set @num_parcela = @num_parcela + 1
				end
			end
			/* ================================================================================================================================ */
		end
		else begin
			/* ================================================== CANCELAMENTO DE CONTRATOS EXISTENTES ======================================== */
			if (@li_status = '9')
			begin
				/* Salvando histórico */
				insert into prestamista.ContratoHist
					select * 
						from prestamista.Contrato
						where pct_chave_operacao = @li_chave_operacao

				/* Cancelando contrato */
				update prestamista.Contrato
					set pct_status = 'C',
						usu_login_alt = @usu_login,
						pct_data_alt = @data_atual
					where pct_chave_operacao = @li_chave_operacao
			end
			/* ================================================================================================================================ */
		end
	end
END
GO
