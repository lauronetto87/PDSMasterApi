using pds.web.api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace pds.web.api.Controllers
{
    /// <summary>
    /// Controller de parâmetros
    /// </summary>
    [RoutePrefix("api/Parametros")]
    public class ParametrosController : BaseController
    {
        /// <summary>
        /// Obtem o valor do parâmetro através da chave
        /// </summary>
        /// <param name="chave">Chave para obtenção do valor do parâmetro</param>
        /// <returns>Retorna o valor do parâmetro</returns>
        [AcceptVerbs("GET")]
        [Route("ObterParametroPorChave")]
        public IHttpActionResult ObterParametroPorChave(string chave)
        {
            try
            {
                Parametro parametro = new Parametro();
                using (var _contexto = new Contexto())
                {
                    parametro = _contexto.parametros.Where(x => x.prt_chave.Equals(chave)).FirstOrDefault();
                }

                if (parametro != null)
                    return Ok(parametro.prt_valor);
                else
                    return Ok("");
            }
            catch (Exception ex)
            {
                ravenClient.CaptureException(ex);
                return StatusCode(HttpStatusCode.BadRequest);
            }
        }

        /// <summary>
        /// Obtem informações de contato da corretora
        /// </summary>
        /// <returns>Retorna as informações de contato da corretora</returns>
        [AcceptVerbs("GET")]
        [Route("ObterInfoCorretora")]
        public IHttpActionResult ObterInfoCorretora()
        {
            using (var _contexto = new Contexto())
            {
                try
                {
                    var chaves = new[] { "TELEFONE", "ENDERECO", "EMAIL", "LATITUDE", "LONGITUDE" };
                    var parametros = (from p in _contexto.parametros
                                      where chaves.Contains(p.prt_chave)
                                      select new { p.prt_chave, p.prt_valor }).ToList();

                    Dictionary<string, string> info_corretora = new Dictionary<string, string>();
                    foreach (var item in parametros)
                    {
                        info_corretora.Add(item.prt_chave, item.prt_valor);
                    }

                    return Ok(info_corretora);
                }
                catch (Exception ex)
                {
                    ravenClient.CaptureException(ex);
                    return StatusCode(HttpStatusCode.BadRequest);
                }
            }
        }

    }
}
