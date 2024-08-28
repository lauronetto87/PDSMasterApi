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
    /// Controller de contratos
    /// </summary>
    [RoutePrefix("api/Contratos")]
    public class ContratosController : BaseController
    {
        /// <summary>
        /// Obtem os contratos ativos do usuário
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <param name="pagina">Número da página</param>
        /// <param name="qtdItensPorPagina">Quantidade de itens na página</param>
        /// <returns>Retorna Json com os contratos ativos do usuário</returns>
        [AcceptVerbs("GET")]
        [Route("ObterContratosPorUsuario")]
        public IHttpActionResult ObterContratosPorUsuario(string token, int pagina, int qtdItensPorPagina = 5)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                using (var _contexto = new Contexto())
                {
                    try
                    {
                        string caminho = _contexto.parametros.Where(x => x.prt_chave.Equals("CAMINHO_REL_IMG_PRODUTO")).FirstOrDefault().prt_valor;
                        //int usu_id = _contexto.usuariostokens.Where(x => x.ust_token.Equals(token)).FirstOrDefault().usu_id;
                        int usu_id = Seguranca.ObterUsuIdPorToken(token);

                        var contratos = (from ctt in _contexto.contratos
                                         join pro in _contexto.produtos on ctt.pro_id equals pro.pro_id
                                         join seg in _contexto.seguradoras on pro.seg_id equals seg.seg_id
                                         join cli in _contexto.clientes on ctt.cli_id equals cli.cli_id
                                         join usu in _contexto.usuarios on cli.cli_cpf_cnpj equals usu.usu_cpf_cnpj
                                         where usu.usu_id == usu_id
                                            && ctt.ctt_status.Equals("A")
                                         select new
                                         {
                                             ctt.ctt_id,
                                             pro.pro_categoria,
                                             pro.pro_descricao,
                                             pro.pro_imagem_mob,
                                             ctt.ctt_data_adesao,
                                             ctt.ctt_valor_titulo,
                                             ctt.ctt_val_seg,
                                             ctt.ctt_qtd_prest,
                                             ctt.ctt_val_prest,
                                             ctt.ctt_inicio_cobert,
                                             ctt.ctt_fim_cobert,
                                             ctt.ctt_status,
                                             seg.seg_nome_abrev
                                         }).ToList();

                        List<ContratoAux> resultado = new List<ContratoAux>();
                        foreach (var ctt in contratos)
                        {
                            resultado.Add(new ContratoAux
                            {
                                ctt_id = ctt.ctt_id,
                                categoria = ctt.pro_categoria,
                                produto = ctt.pro_descricao,
                                imagem = string.IsNullOrEmpty(ctt.pro_imagem_mob) ? null : string.Format("{0}/{1}", caminho, ctt.pro_imagem_mob),
                                data_adesao = ctt.ctt_data_adesao.ToString("dd/MM/yyyy"),
                                valor = ctt.pro_categoria.Equals("C") ? ctt.ctt_valor_titulo.ToString("N2") : ctt.ctt_val_seg.ToString("N2"),
                                qtd_parcelas = ctt.ctt_qtd_prest,
                                valor_parcela = ctt.ctt_val_prest.ToString("N2"),
                                inicio_cobertura = ctt.ctt_inicio_cobert.ToString("dd/MM/yyyy"),
                                termino_cobertura = ctt.ctt_fim_cobert.ToString("dd/MM/yyyy"),
                                situacao = Status.Contrato(ctt.ctt_status),
                                seguradora = ctt.seg_nome_abrev
                            });
                        }

                        return Ok(new Paginacao.DadosPaginados<ContratoAux>(resultado, pagina, qtdItensPorPagina));
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

        public class ContratoAux
        {
            public Int64 ctt_id { get; set; }
            public string categoria { get; set; }
            public string produto { get; set; }
            public string imagem { get; set; }
            public string data_adesao { get; set; }
            public string valor { get; set; }
            public int qtd_parcelas { get; set; }
            public string valor_parcela { get; set; }
            public string inicio_cobertura { get; set; }
            public string termino_cobertura { get; set; }
            public string situacao { get; set; }
            public string seguradora { get; set; }
        }
    }
}
