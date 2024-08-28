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
    /// Controller de autenticação
    /// </summary>
    [RoutePrefix("api/Autenticacao")]
    public class AutenticacaoController : BaseController
    {
        /// <summary>
        /// Realiza o login da aplicação
        /// </summary>
        /// <param name="dadosLogin">Dados para efetuar o login</param>
        /// <returns>Retorna um token de autenticação</returns>
        [AcceptVerbs("POST")]
        [Route("Conectar")]
        public IHttpActionResult Conectar(DadosLogin dadosLogin)
        {
            string token = string.Empty;
            string senha = Seguranca.CriptografarTexto(dadosLogin.senha);

            using (var _contexto = new Contexto())
            {
                using (var _transacao = _contexto.Database.BeginTransaction())
                {
                    var usuario = (from u in _contexto.usuarios
                                   where u.usu_cpf_cnpj.Equals(dadosLogin.cpf_cnpj)
                                      && u.usu_senha.Equals(senha)
                                      && u.usu_status.Equals("A")
                                   select u).FirstOrDefault();

                    if (usuario != null)
                    {
                        try
                        {
                            /* Verifica de o dispositivo já tem um token ativo e o inativa */
                            var tokens = _contexto.infomobile.Where(x => x.ifb_uuid.Equals(dadosLogin.uuid))
                                .Select(x => x.ust_id).ToList();

                            foreach (var ust_id in tokens)
                            {
                                InativarTokenPorId(ust_id);
                            }

                            /* Gera um novo token */
                            token = Seguranca.GerarTokenAutenticacao(usuario.usu_login);
                            UsuarioToken usu_token = new UsuarioToken()
                            {
                                usu_login = usuario.usu_login,
                                ust_token = token,
                                ust_data_login = DateTime.Now,
                                ust_data_val = null,
                                ust_status = "A",
                                ust_tpo_acesso = "M",
                                ust_ip_interno = dadosLogin.ip_interno,
                                ust_ip_externo = dadosLogin.ip_externo,
                                ust_maquina = dadosLogin.maquina,
                                ust_sucesso = true,
                                ust_navegador = dadosLogin.navegador,
                                ust_pais = dadosLogin.pais,
                                ust_estado = dadosLogin.estado,
                                ust_municipio = dadosLogin.municipio
                            };
                            _contexto.usuariostokens.Add(usu_token);
                            _contexto.SaveChanges();

                            if (dadosLogin.tipo.Equals("M"))
                            {
                                InfoMobile info_mobile = new InfoMobile()
                                {
                                    ust_id = usu_token.ust_id,
                                    ifb_modelo = dadosLogin.modelo,
                                    ifb_plataforma = dadosLogin.plataforma,
                                    ifb_uuid = dadosLogin.uuid,
                                    ifb_serial = dadosLogin.serial,
                                    ifb_versao_so = dadosLogin.versao_so,
                                    ifb_fabricante = dadosLogin.fabricante,
                                    ifb_token_push = dadosLogin.token_push,
                                    ifb_virtual = dadosLogin._virtual
                                };
                                _contexto.infomobile.Add(info_mobile);
                                _contexto.SaveChanges();
                            }

                            _transacao.Commit();
                        }
                        catch (Exception ex)
                        {
                            ravenClient.CaptureException(ex);
                            _transacao.Rollback();
                            throw;
                        }
                    }
                    else
                    {
                        UsuarioToken usu_token = new UsuarioToken()
                        {
                            usu_login = dadosLogin.cpf_cnpj,
                            ust_token = string.Empty,
                            ust_data_login = DateTime.Now,
                            ust_data_val = null,
                            ust_status = "I",
                            ust_tpo_acesso = "M",
                            ust_ip_interno = dadosLogin.ip_interno,
                            ust_ip_externo = dadosLogin.ip_externo,
                            ust_maquina = dadosLogin.maquina,
                            ust_sucesso = false,
                            ust_navegador = dadosLogin.navegador,
                            ust_pais = dadosLogin.pais,
                            ust_estado = dadosLogin.estado,
                            ust_municipio = dadosLogin.municipio
                        };
                        _contexto.usuariostokens.Add(usu_token);
                        _contexto.SaveChanges();

                        _transacao.Commit();
                    }
                }
            }

            return Ok(token);
        }

        /// <summary>
        /// Realiza o logoff da aplicação
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <returns></returns>
        [AcceptVerbs("GET")]
        [Route("Desconectar/{token}")]
        public IHttpActionResult Desconectar(string token)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                using (var _contexto = new Contexto())
                {
                    try
                    {
                        var usu_token = _contexto.usuariostokens.Where(x => x.ust_token.Equals(token)).FirstOrDefault();
                        usu_token.ust_status = "I";
                        _contexto.Entry(usu_token).State = System.Data.Entity.EntityState.Modified;

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
        /// Obtem todos os dispositivos conectados
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <returns>Retorna Json com os dispositivos conectados</returns>
        [AcceptVerbs("GET")]
        [Route("ObterDispositivosConectados")]
        public IHttpActionResult ObterDispositivosConectados(string token)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                using (var _contexto = new Contexto())
                {
                    try
                    {
                        var usu_login = _contexto.usuariostokens.Where(x => x.ust_token.Equals(token)).FirstOrDefault().usu_login;
                        List<Dispositivo> disp_ativos = new List<Dispositivo>();
                        var disp_aux = (from ut in _contexto.usuariostokens
                                        join im in _contexto.infomobile on ut.ust_id equals im.ust_id
                                        where ut.usu_login == usu_login
                                           && ut.ust_status.Equals("A")
                                           && ut.ust_token != token
                                        select new
                                        {
                                            ut.ust_id,
                                            ut.ust_data_login,
                                            im.ifb_plataforma,
                                            im.ifb_fabricante,
                                            im.ifb_versao_so,
                                            ut.ust_pais,
                                            ut.ust_estado,
                                            ut.ust_municipio
                                        }).ToList();

                        foreach (var disp in disp_aux)
                        {
                            disp_ativos.Add(new Dispositivo()
                            {
                                id = disp.ust_id,
                                data_login = disp.ust_data_login.ToString("dd/MM/yyyy HH:mm"),
                                plataforma = disp.ifb_plataforma,
                                fabricante = disp.ifb_fabricante,
                                versao_so = disp.ifb_versao_so,
                                pais = disp.ust_pais,
                                estado = disp.ust_estado,
                                municipio = disp.ust_municipio
                            });
                        }

                        return Ok(disp_ativos);
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
        /// Desconectar um determinado dispositivo
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <param name="ust_id">Id de identificação da conexão ativa</param>
        /// <returns>Retorna True caso o dispositivo seja desconectado</returns>
        [AcceptVerbs("PUT")]
        [Route("DesconectarDispositivo")]
        public IHttpActionResult DesconectarDispositivo(string token, int ust_id)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                using (var _contexto = new Contexto())
                {
                    try
                    {
                        var usuario_token = _contexto.usuariostokens.Where(x => x.ust_id == ust_id).FirstOrDefault();
                        usuario_token.ust_status = "I";
                        _contexto.Entry(usuario_token).State = System.Data.Entity.EntityState.Modified;

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
        /// Desconectar todos os dispositivos
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <returns>Retorna True caso todos os dispositivos sejam desconectados</returns>
        [AcceptVerbs("PUT")]
        [Route("DesconectarTodosDispositivos")]
        public IHttpActionResult DesconectarTodosDispositivos(string token)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                using (var _contexto = new Contexto())
                {
                    var usu_login = _contexto.usuariostokens.Where(x => x.ust_token.Equals(token)).FirstOrDefault().usu_login;
                    List<UsuarioToken> disp_ativos = _contexto.usuariostokens
                        .Where(x => x.usu_login == usu_login && x.ust_token != token && x.ust_status.Equals("A")).ToList();
                    foreach (var disp in disp_ativos)
                    {
                        try
                        {
                            disp.ust_status = "I";
                            _contexto.Entry(disp).State = System.Data.Entity.EntityState.Modified;

                            _contexto.SaveChanges();
                        }
                        catch (Exception ex)
                        {
                            ravenClient.CaptureException(ex);
                            return StatusCode(HttpStatusCode.BadRequest);
                        }
                    }

                    return Ok(true);
                }
            }
            else
                return StatusCode(HttpStatusCode.Unauthorized);
        }

        private void InativarTokenPorId(int ust_id)
        {
            using (var _contexto = new Contexto())
            {
                try
                {
                    var usu_token = _contexto.usuariostokens.Where(x => x.ust_id == ust_id && x.ust_status.Equals("A")).FirstOrDefault();
                    if (usu_token != null)
                    {
                        usu_token.ust_status = "I";

                        _contexto.Entry(usu_token).State = System.Data.Entity.EntityState.Modified;
                        _contexto.SaveChanges();
                    }
                }
                catch (Exception ex)
                {
                    ravenClient.CaptureException(ex);
                    throw;
                }
            }
        }

        public class DadosLogin
        {
            public string cpf_cnpj { get; set; }
            public string senha { get; set; }
            public string tipo { get; set; }
            public string ip_interno { get; set; }
            public string ip_externo { get; set; }
            public string maquina { get; set; }
            public string navegador { get; set; }
            public string modelo { get; set; }
            public string plataforma { get; set; }
            public string uuid { get; set; }
            public string serial { get; set; }
            public string versao_so { get; set; }
            public string fabricante { get; set; }
            public string token_push { get; set; }
            public bool _virtual { get; set; }
            public string pais { get; set; }
            public string estado { get; set; }
            public string municipio { get; set; }
        }

        public class Dispositivo
        {
            public int id { get; set; }
            public string data_login { get; set; }
            public string plataforma { get; set; }
            public string fabricante { get; set; }
            public string versao_so { get; set; }
            public string pais { get; set; }
            public string estado { get; set; }
            public string municipio { get; set; }
        }
    }
}
