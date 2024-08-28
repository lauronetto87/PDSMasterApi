using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using pds.web.api.Models;
using System.Web.Http.Cors;
using static pds.web.api.Util.Paginacao;
using pds.web.api.Util;

namespace pds.web.api.Controllers
{
    /// <summary>
    /// Controller de usuarios
    /// </summary>
    [RoutePrefix("api/Usuarios")]
    public class UsuariosController : BaseController
    {
        /// <summary>
        /// Confirma contato e insere o usuário
        /// </summary>
        /// <param name="novo_usuario">Dados para inserção do novo usuário</param>
        /// <returns></returns>
        [AcceptVerbs("POST")]
        [Route("ConfirmarContato")]
        public IHttpActionResult ConfirmarContato(NovoUsuario novo_usuario)
        {
            Usuario usuario;
            using (var _contexto = new Contexto())
            {
                using (var transacao = _contexto.Database.BeginTransaction())
                {
                    try
                    {
                        string token_autenticacao = Seguranca.GerarTokenAutenticacaoCelular();
                        usuario = _contexto.usuarios.Where(x => x.usu_cpf_cnpj.Equals(novo_usuario.cpf_cnpj)).FirstOrDefault();

                        Cliente cliente = _contexto.clientes.Where(x => x.cli_cpf_cnpj.Equals(novo_usuario.cpf_cnpj)).FirstOrDefault();
                        Telefone cel = _contexto.telefones.Where(x => x.cli_id == cliente.cli_id && x.tel_tipo.Equals("M")).FirstOrDefault();

                        if (usuario != null) //Caso já exista usuário criado
                        {
                            usuario.usu_token = token_autenticacao;
                            usuario.usu_val_token = DateTime.Now.AddHours(4);

                            _contexto.Entry(usuario).State = EntityState.Modified;
                            _contexto.SaveChanges();
                        }
                        else //Caso nao exista usuário criado
                        {
                            usuario = new Usuario()
                            {
                                pfl_id = 4,
                                uad_id = null,
                                usu_login = novo_usuario.cpf_cnpj,
                                usu_nome = cliente.cli_nome,
                                usu_cpf_cnpj = novo_usuario.cpf_cnpj,
                                usu_senha = string.Empty,
                                usu_ddi = cel.tel_ddi,
                                usu_ddd = cel.tel_ddd,
                                usu_celular = cel == null ? null : cel.tel_numero,
                                usu_email = cliente.cli_email,
                                usu_status = "A",
                                usu_tent_login = 0,
                                usu_token = token_autenticacao,
                                usu_val_token = DateTime.Now.AddHours(4),
                                usu_alt_senha = true,
                                usu_flag_excluido = false
                            };

                            _contexto.usuarios.Add(usuario);
                            _contexto.SaveChanges();
                        }

                        bool codigo_enviado = false;

                        if (!string.IsNullOrEmpty(novo_usuario.email))
                        {
                            if (cliente.cli_email.Equals(novo_usuario.email))
                            {
                                EnviarEmailComCodigoAutenticacao(cliente.cli_nome, cliente.cli_email, cliente.cli_cpf_cnpj, token_autenticacao);
                                codigo_enviado = true;
                                //return Ok(true);
                            }
                            else
                                return Ok(false);
                        }
                        else
                        {
                            if (usuario.usu_celular.Equals(novo_usuario.celular))
                            {
                                string msg = usuario.usu_token;
                                string celular = string.Format("{0}{1}{2}", usuario.usu_ddi, usuario.usu_ddd, usuario.usu_celular);
                                string url = string.Format(@"https://www.experttexting.com/exptapi/exptsms.asmx/SendSMS?Userid={0}&APIKEY={1}&FROM={2}&To={3}&MSG={4}&pwd={5}",
                                    "ma9", "nrwgu6gd7ktm8ac", "DEFAULT", celular, msg, "M@9gf1!@1");

                                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                                codigo_enviado = true;
                                //return Ok(true);
                            }
                            else
                                return Ok(false);
                        }

                        if (codigo_enviado)
                        {
                            transacao.Commit();
                            return Ok(true);
                        }
                        else
                        {
                            transacao.Rollback();
                            return Ok(false);
                        }
                    }
                    catch (Exception ex)
                    {
                        ravenClient.CaptureException(ex);
                        return StatusCode(HttpStatusCode.BadRequest);
                    }
                }
            }
        }

        /// <summary>
        /// Verifica se o código de autenticação enviado para o usuário está válido
        /// </summary>
        /// <param name="cpf_cnpj">Cpf ou Cnpj</param>
        /// <param name="cod_autenticacao">Código de autenticação</param>
        /// <returns>Retorna True ou False</returns>
        [AcceptVerbs("GET")]
        [Route("VerificaCodigoAutenticacao")]
        public IHttpActionResult VerificaCodigoAutenticacao(string cpf_cnpj, string cod_autenticacao)
        {
            try
            {
                return Ok(ValidarCodigoAutenticacao(cpf_cnpj, cod_autenticacao));
            }
            catch (Exception ex)
            {
                return StatusCode(HttpStatusCode.BadRequest);
            }
            
        }

        /// <summary>
        /// Cria uma senha para o usuário
        /// </summary>
        /// <param name="dados_senha">Dados para a senha</param>
        /// <returns>Retorna True ou False</returns>
        [AcceptVerbs("PUT")]
        [Route("CriarSenha")]
        public IHttpActionResult CriarSenha(DadosNovaSenha dados_senha)
        {
            if (ValidarCodigoAutenticacao(dados_senha.cpf_cnpj, dados_senha.cod_autenticacao))
            {
                using (var _contexto = new Contexto())
                {
                    Usuario usuario = _contexto.usuarios.Where(x => x.usu_cpf_cnpj.Equals(dados_senha.cpf_cnpj)
                        && x.usu_token.Equals(dados_senha.cod_autenticacao) && x.usu_val_token >= DateTime.Now).FirstOrDefault();

                    if (usuario != null)
                    {
                        try
                        {
                            usuario.usu_senha = Seguranca.CriptografarTexto(dados_senha.senha);
                            usuario.usu_alt_senha = false;
                            usuario.usu_token = string.Empty;
                            usuario.usu_val_token = null;

                            _contexto.Entry(usuario).State = EntityState.Modified;
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
                        return Ok(false);
                }
            }
            else
                return Ok(false);
        }

        private bool ValidarCodigoAutenticacao(string cpf_cnpj, string token)
        {
            using (var _contexto = new Contexto())
            {
                try
                {
                    return _contexto.usuarios.Any(x => x.usu_cpf_cnpj.Equals(cpf_cnpj) && x.usu_token.Equals(token)
                        && x.usu_val_token >= DateTime.Now);
                }
                catch (Exception ex)
                {
                    ravenClient.CaptureException(ex);
                    throw ex;
                }
                
            }
        }

        private void EnviarEmailComCodigoAutenticacao(string cli_nome, string cli_email, string cpf_cnpj, string token_autenticacao)
        {
            try
            {
                string assunto = "Ativação de conta";
                string texto = string.Format(@"
                    Olá <strong>{0}</strong>,<br/><br/>
                    Foi solicitada a ativação de conta para acesso ao {1}, para sua segurança use o código abaixo para efetuar Login.<br/><br/>
                    Login: <strong>{2}</strong><br/><br/>                        
                    Código: <strong>{3}</strong><br/><br/>
                    Caso não tenha feito esta solicitação favor desconsiderar este email.<br/><br/>
                    Atenciosamente,<br/>
                    {4}", cli_nome, "Portal de Serviços", cpf_cnpj, token_autenticacao, "Equipe do Portal de Serviços");

                Email.EnviarEmail(cli_email, assunto, texto);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public class NovoUsuario
        {
            public string cpf_cnpj { get; set; }
            public string email { get; set; }
            public string celular { get; set; }
        }

        public class DadosNovaSenha
        {
            public string cpf_cnpj { get; set; }
            public string cod_autenticacao { get; set; }
            public string senha { get; set; }
        }
    }
}