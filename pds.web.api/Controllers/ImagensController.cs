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
    /// Controller de imagens
    /// </summary>
    [RoutePrefix("api/Imagens")]
    public class ImagensController : BaseController
    {
        /// <summary>
        /// Obtem os banners para o app mobile
        /// </summary>
        /// <param name="token"></param>
        /// <returns>Retorna lista com os banners ativos para o mobile</returns>
        [AcceptVerbs("GET")]
        [Route("ObterBannersMobile")]
        public IHttpActionResult ObterBannersMobile(string token)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                try
                {
                    List<string> lista_banners = new List<string>();
                    using (var _contexto = new Contexto())
                    {
                        var caminho_relativo = _contexto.parametros.Where(x => x.prt_chave.Equals("CAMINHO_REL_BANNER")).FirstOrDefault().prt_valor;
                        var banners = _contexto.imagens.Where(x => x.img_tipo.Equals("B") && x.img_status.Equals("A")).OrderBy(x => x.img_ordem).ToList();
                        foreach (var item in banners)
                        {
                            lista_banners.Add(string.Format("{0}/{1}", caminho_relativo, item.img_caminho));
                        }

                    }
                    return Ok(lista_banners);
                }
                catch (Exception ex)
                {
                    ravenClient.CaptureException(ex);
                    return StatusCode(HttpStatusCode.BadRequest);
                }
            }
            else
                return StatusCode(HttpStatusCode.Unauthorized);
        }
    }
}
