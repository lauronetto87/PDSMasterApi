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
    /// Controller de endereços
    /// </summary>
    [RoutePrefix("api/Enderecos")]
    public class EnderecosController : BaseController
    {
        /// <summary>
        /// Obtem os endereços por cliente
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <param name="pagina">Número da página</param>
        /// <param name="qtdItensPorPagina">Quantidade de itens na página</param>
        /// <returns>Retorna Json com os endereços do cliente</returns>
        [AcceptVerbs("GET")]
        [Route("ObterEnderecosPorCliente")]
        public IHttpActionResult ObterEnderecosPorCliente(string token, int pagina, int qtdItensPorPagina = 5)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                List<EnderecoAux> enderecos;
                using (var _contexto = new Contexto())
                {
                    try
                    {
                        //int usu_id = _contexto.usuariostokens.Where(x => x.ust_token.Equals(token)).FirstOrDefault().usu_id;
                        int usu_id = Seguranca.ObterUsuIdPorToken(token);

                        enderecos = (from e in _contexto.enderecos
                                     join c in _contexto.clientes on e.cli_id equals c.cli_id
                                     join u in _contexto.usuarios on c.cli_cpf_cnpj equals u.usu_cpf_cnpj
                                     where u.usu_id == usu_id
                                        && e.end_flag_excluido == false
                                     orderby e.end_flag_atual descending
                                     select new EnderecoAux
                                     {
                                         id = e.end_id,
                                         tipo = e.end_tipo,
                                         cep = e.end_cep,
                                         logradouro = e.end_logradouro,
                                         num = e.end_num,
                                         complemento = e.end_complemento,
                                         bairro = e.end_bairro,
                                         cidade = e.end_cidade,
                                         uf = e.end_uf,
                                         flag_atual = e.end_flag_atual
                                     }).ToList();
                    }
                    catch (Exception ex)
                    {
                        ravenClient.CaptureException(ex);
                        return StatusCode(HttpStatusCode.BadRequest);
                    }
                }

                return Ok(new Paginacao.DadosPaginados<EnderecoAux>(enderecos, pagina, qtdItensPorPagina));
            }
            else
                return StatusCode(HttpStatusCode.Unauthorized);
        }

        /// <summary>
        /// Inserir endereço
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <param name="endereco">Informações do endereço</param>
        /// <returns>Retorna True caso insira endereço com sucesso</returns>
        [AcceptVerbs("POST")]
        [Route("InserirEndereco")]
        public IHttpActionResult InserirEndereco(string token, EnderecoAux endereco)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                using (var _contexto = new Contexto())
                {
                    try
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

                        Endereco endereco_novo = new Endereco()
                        {
                            cli_id = info_usu.cli_id,
                            end_bairro = endereco.bairro,
                            end_cep = endereco.cep,
                            end_cidade = endereco.cidade,
                            end_complemento = endereco.complemento,
                            end_data_cad = DateTime.Now,
                            end_flag_atual = endereco.flag_atual,
                            end_logradouro = endereco.logradouro,
                            end_num = endereco.num,
                            end_tipo = endereco.tipo,
                            end_uf = endereco.uf,
                            usu_login = info_usu.usu_login,
                            end_status = "A",
                            end_flag_excluido = false
                        };


                        _contexto.enderecos.Add(endereco_novo);
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
        /// Excluir endereço
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <param name="id">Id do endereço</param>
        /// <returns>Retorna True caso exclua o endereço com sucesso</returns>
        [AcceptVerbs("DELETE")]
        [Route("ExcluirEndereco")]
        public IHttpActionResult ExcluirEndereco(string token, int id)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                using (var _contexto = new Contexto())
                {
                    try
                    {
                        var endereco = _contexto.enderecos.Where(x => x.end_id == id).FirstOrDefault();
                        endereco.end_status = "I";
                        endereco.end_flag_excluido = true;

                        _contexto.Entry(endereco).State = System.Data.Entity.EntityState.Modified;
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
        /// Setar endereço principal
        /// </summary>
        /// <param name="token">Token de autenticação</param>
        /// <param name="id">Id do endereço</param>
        /// <returns>Retorna True caso set o endereço como principal</returns>
        [AcceptVerbs("PUT")]
        [Route("SetarEnderecoPrincipal")]
        public IHttpActionResult SetarEnderecoPrincipal(string token, int id)
        {
            if (Seguranca.VerificaSeTokenEstaAtivo(token))
            {
                using (var _contexto = new Contexto())
                {
                    using (var transacao = _contexto.Database.BeginTransaction())
                    {
                        try
                        {
                            var endereco = _contexto.enderecos.Where(x => x.end_id == id).FirstOrDefault();
                            endereco.end_flag_atual = true;

                            _contexto.Entry(endereco).State = System.Data.Entity.EntityState.Modified;
                            _contexto.SaveChanges();
                        }
                        catch (Exception ex)
                        {
                            ravenClient.CaptureException(ex);
                            transacao.Rollback();
                            return StatusCode(HttpStatusCode.BadRequest);
                        }

                        transacao.Commit();
                        return Ok(true);
                    }
                }
            }
            else
                return StatusCode(HttpStatusCode.Unauthorized);
        }

        public class EnderecoAux
        {
            public int id { get; set; }
            public string tipo { get; set; }
            public string cep { get; set; }
            public string logradouro { get; set; }
            public string num { get; set; }
            public string complemento { get; set; }
            public string bairro { get; set; }
            public string cidade { get; set; }
            public string uf { get; set; }
            public bool flag_atual { get; set; }
        }
    }
}
