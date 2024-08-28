using pds.web.api.Models;
using pds.web.api.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace pds.web.api.Controllers
{
    /// <summary>
    /// Controller de parcelas de contrato
    /// </summary>
    [RoutePrefix("api/ContratosParcelas")]
    public class ContratosParcelasController : BaseController
    {
        /// <summary>
        /// Obtem as parcelas de um determinado contrato
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <param name="ctt_id">Id do contrato</param>
        /// <param name="pagina">Número da página</param>
        /// <param name="qtdItensPorPagina">Quantidade de itens na página</param>
        /// <returns>Retorna Json com as parcelas de um determinado contrato</returns>
        [AcceptVerbs("GET")]
        [Route("ObterParcelasDeContrato")]
        public IHttpActionResult ObterParcelasDeContrato(string token, int ctt_id, int pagina, int qtdItensPorPagina = 5)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                using (var _contexto = new Contexto())
                {
                    try
                    {
                        var cli_id = (from ut in _contexto.usuariostokens
                                      join u in _contexto.usuarios on ut.usu_login equals u.usu_login
                                      join c in _contexto.clientes on u.usu_cpf_cnpj equals c.cli_cpf_cnpj
                                      where ut.ust_token.Equals(token)
                                      select c.cli_id).FirstOrDefault();

                        var status = new string[] { "P", "A" };

                        var contrato_parcelas = (from cp in _contexto.contratosparcelas
                                                 join c in _contexto.contratos on cp.ctt_id equals c.ctt_id
                                                 join t in _contexto.tiposcobrancas on cp.tcc_id equals t.tcc_id
                                                 where c.cli_id == cli_id && cp.ctt_id == ctt_id
                                                    && status.Contains(cp.cpl_status)
                                                 select new
                                                 {
                                                     cp.cpl_id,
                                                     t.tcc_descricao,
                                                     cp.cpl_num_parc,
                                                     cp.cpl_data_venc,
                                                     cp.cpl_valor,
                                                     cp.cpl_data_pag,
                                                     cp.cpl_val_pag,
                                                     cp.cpl_status
                                                 }).ToList();

                        List<ContratoParcelaAux> resultado = new List<ContratoParcelaAux>();
                        foreach (var item in contrato_parcelas)
                        {
                            resultado.Add(new ContratoParcelaAux
                            {
                                id = item.cpl_id,
                                data_pagamento = item.cpl_data_pag == null ? null : Convert.ToDateTime(item.cpl_data_pag).ToString("dd/MM/yyyy"),
                                data_vencimento = item.cpl_data_venc.ToString("dd/MM/yyyy"),
                                valor = item.cpl_valor.ToString("N2"),
                                val_pagamento = item.cpl_val_pag.ToString("N2"),
                                tipo_cobranca = item.tcc_descricao,
                                num_parcela = item.cpl_num_parc,
                                status = item.cpl_status
                            });
                        }

                        return Ok(new Paginacao.DadosPaginados<ContratoParcelaAux>(resultado, pagina, qtdItensPorPagina));
                    }
                    catch (Exception ex)
                    {
                        ravenClient.CaptureException(ex);
                        return StatusCode(HttpStatusCode.BadRequest);
                    }
                }
            }
            else
                return StatusCode(HttpStatusCode.Unauthorized);
        }

        public class ContratoParcelaAux
        {
            public Int64 id { get; set; }
            public string tipo_cobranca { get; set; }
            public int num_parcela { get; set; }
            public string data_vencimento { get; set; }
            public string valor { get; set; }
            public string data_pagamento { get; set; }
            public string val_pagamento { get; set; }
            public string status { get; set; }
        }
    }
}
