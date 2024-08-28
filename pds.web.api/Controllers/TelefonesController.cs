using pds.web.api.Models;
using pds.web.api.Util;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace pds.web.api.Controllers
{
    /// <summary>
    /// Controller de telefones
    /// </summary>
    [RoutePrefix("api/Telefones")]
    public class TelefonesController : BaseController
    {
        /// <summary>
        /// Obtem os telefones por cliente
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <param name="pagina">Número da página</param>
        /// <param name="qtdItensPorPagina">Quantidade de itens na página</param>
        /// <returns>Retorna Json com os telefones do cliente</returns>
        [AcceptVerbs("GET")]
        [Route("ObterTelefonesPorCliente")]
        public IHttpActionResult ObterTelefonesPorCliente(string token, int pagina, int qtdItensPorPagina = 5)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                List<TelefoneAux> telefones;
                using (var _contexto = new Contexto())
                {
                    try
                    {
                        int usu_id = Seguranca.ObterUsuIdPorToken(token);

                        telefones = (from t in _contexto.telefones
                                     join c in _contexto.clientes on t.cli_id equals c.cli_id
                                     join u in _contexto.usuarios on c.cli_cpf_cnpj equals u.usu_cpf_cnpj
                                     where u.usu_id == usu_id
                                        && t.tel_status.Equals("A")
                                        && t.tel_flag_excluido == false
                                     orderby t.tel_principal descending
                                     select new TelefoneAux
                                     {
                                         id = t.tel_id,
                                         tipo = t.tel_tipo,
                                         ddi = t.tel_ddi,
                                         ddd = t.tel_ddd,
                                         numero = t.tel_numero,
                                         numero_completo = "(" + t.tel_ddd + ") " + t.tel_numero.Substring(0, t.tel_numero.Length - 4) + "-" + t.tel_numero.Substring(t.tel_numero.Length - 4),
                                         flag_sms = t.tel_flag_sms,
                                         principal = t.tel_principal
                                     }).ToList();

                        return Ok(new Paginacao.DadosPaginados<TelefoneAux>(telefones, pagina, qtdItensPorPagina));
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

        /// <summary>
        /// Inserir telefone
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <param name="telefone">Informações do telefone</param>
        /// <returns>Retorna True caso insira o telefone com sucesso</returns>
        [AcceptVerbs("POST")]
        [Route("InserirTelefone")]
        public IHttpActionResult InserirTelefone(string token, TelefoneAux telefone)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                using (var _contexto = new Contexto())
                {
                    var info_usu = (from ut in _contexto.usuariostokens
                                    join u in _contexto.usuarios on ut.usu_login equals u.usu_login
                                    join c in _contexto.clientes on u.usu_cpf_cnpj equals c.cli_cpf_cnpj
                                    where ut.ust_token.Equals(token)
                                    select new
                                    {
                                        c.cli_id,
                                        u.usu_login
                                    }).FirstOrDefault();

                    var tel_existente = _contexto.telefones
                        .Any(x => x.cli_id == info_usu.cli_id && x.tel_ddi == telefone.ddi && x.tel_ddd == telefone.ddd && x.tel_numero == telefone.numero && x.tel_flag_excluido == false);

                    if (!tel_existente)
                    {
                        try
                        {
                            Telefone telefone_novo = new Telefone()
                            {
                                tel_flag_sms = telefone.flag_sms,
                                tel_ddi = telefone.ddi,
                                tel_ddd = telefone.ddd,
                                tel_numero = telefone.numero,
                                tel_principal = telefone.principal,
                                tel_tipo = telefone.tipo,
                                cli_id = info_usu.cli_id,
                                tel_data_cad = DateTime.Now,
                                usu_login = info_usu.usu_login,
                                tel_status = "A",
                                tel_flag_excluido = false
                            };

                            _contexto.telefones.Add(telefone_novo);
                            _contexto.SaveChanges();

                            return Ok(true);
                        }
                        catch (Exception ex)
                        {
                            ravenClient.CaptureException(ex);
                            return StatusCode(HttpStatusCode.BadRequest);
                        }
                    }
                    else
                        return Ok(Constantes.TipoErro.REGISTRO_EXISTENTE);
                }
            }
            else
                return StatusCode(HttpStatusCode.Unauthorized);
        }

        /// <summary>
        /// Excluir telefone
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <param name="id">Id do telefone</param>
        /// <returns>Retorna True caso exclua o telefone com sucesso</returns>
        [AcceptVerbs("DELETE")]
        [Route("ExcluirTelefone")]
        public IHttpActionResult ExcluirTelefone(string token, int id)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                using (var _contexto = new Contexto())
                {
                    try
                    {
                        var telefone = _contexto.telefones.Where(x => x.tel_id == id).FirstOrDefault();
                        telefone.tel_status = "I";
                        telefone.tel_flag_excluido = true;

                        _contexto.Entry(telefone).State = System.Data.Entity.EntityState.Modified;
                        _contexto.SaveChanges();
                        return Ok(true);
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

        /// <summary>
        /// Setar telefone principal
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <param name="id">Id do telefone</param>
        /// <returns>Retorna True caso set o telefone como principal</returns>
        [AcceptVerbs("PUT")]
        [Route("SetarTelefonePrincipal")]
        public IHttpActionResult SetarTelefonePrincipal(string token, int id)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                using (var _contexto = new Contexto())
                {
                    using (var transacao = _contexto.Database.BeginTransaction())
                    {
                        try
                        {
                            var telefone = _contexto.telefones.Where(x => x.tel_id == id).FirstOrDefault();
                            telefone.tel_principal = true;

                            _contexto.Entry(telefone).State = System.Data.Entity.EntityState.Modified;
                            _contexto.SaveChanges();

                            transacao.Commit();
                            return Ok(true);
                        }
                        catch (Exception ex)
                        {
                            ravenClient.CaptureException(ex);
                            transacao.Rollback();
                            return StatusCode(HttpStatusCode.BadRequest);
                        }
                    }
                }
            }
            else
                return StatusCode(HttpStatusCode.Unauthorized);
        }

        public class TelefoneAux
        {
            public int id { get; set; }
            public string tipo { get; set; }
            public string ddi { get; set; }
            public string ddd { get; set; }
            public string numero { get; set; }
            public string numero_completo { get; set; }
            public bool flag_sms { get; set; }
            public bool principal { get; set; }
        }
    }
}
