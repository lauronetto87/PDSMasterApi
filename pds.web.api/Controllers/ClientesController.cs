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

namespace pds.web.api.Controllers
{
    /// <summary>
    /// Controller de clientes
    /// </summary>
    [RoutePrefix("api/Clientes")]
    public class ClientesController : BaseController
    {
        /// <summary>
        /// Obtem informações do cliente para envio de código de ativação e criação de usuário
        /// </summary>
        /// <param name="cpf_cnpj">Cpf ou Cnpj do cliente</param>
        /// <returns>Retorna informações do cliente (nome, email e celular)</returns>
        [AcceptVerbs("GET")]
        [Route("ObterInformacoesPorCpfCnpj")]
        public IHttpActionResult ObterInformacoesPorCpfCnpj(string cpf_cnpj)
        {
            using (var _contexto = new Contexto())
            {
                try
                {
                    List<InformacoesCliente> informacoes_cli = new List<InformacoesCliente>();
                    var cli = _contexto.clientes.Where(x => x.cli_cpf_cnpj.Equals(cpf_cnpj)).FirstOrDefault();
                    if (cli != null)
                    {
                        List<ContatoCliente> contatos_cliente = new List<ContatoCliente>();
                        int startIndex = cli.cli_email.IndexOf('@');
                        if (startIndex != -1)
                        {
                            contatos_cliente.Add(new ContatoCliente
                            {
                                tipo = "email",
                                valor = cli.cli_email == string.Empty ? string.Empty : cli.cli_email.Substring(0, 2) + "*****" + cli.cli_email.Substring(startIndex)
                            });
                        }

                        var tels = _contexto.telefones.Where(x => x.cli_id == cli.cli_id && x.tel_tipo.Equals("M") && x.tel_status.Equals("A") && x.tel_flag_excluido == false).ToList();
                        string telefone;
                        foreach (var item in tels)
                        {
                            telefone = string.Format("+{0} ({1}) *****-{2}",
                                item.tel_ddi, item.tel_ddd, item.tel_numero.Substring(5));
                            contatos_cliente.Add(new ContatoCliente
                            {
                                tipo = "celular",
                                valor = telefone
                            });
                        }

                        InformacoesCliente info = new InformacoesCliente();
                        info.cli_nome = cli.cli_nome;
                        info.possui_usuario = _contexto.usuarios.Any(x => x.usu_cpf_cnpj.Equals(cpf_cnpj));
                        info.contatos = contatos_cliente;

                        return Ok(info);
                    }
                    else
                        return Ok("");
                }
                catch (Exception ex)
                {
                    ravenClient.CaptureException(ex);
                    return StatusCode(HttpStatusCode.BadRequest);
                }
            }
        }
        
        private class InformacoesCliente
        {
            public string cli_nome { get; set; }
            public bool possui_usuario { get; set; }
            public List<ContatoCliente> contatos { get; set; }
        }

        private class ContatoCliente
        {
            public string tipo { get; set; }
            public string valor { get; set; }
        }
    }
}