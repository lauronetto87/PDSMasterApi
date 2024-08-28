using pds.web.api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace pds.web.api.Util
{
    public class Seguranca
    {
        public static string GerarTokenAutenticacaoCelular(int tamanho = 6)
        {
            var caracteres = "0123456789";
            var random = new Random();
            var resultado_aleatorio = new string(
                Enumerable.Repeat(caracteres, tamanho)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());

            return resultado_aleatorio;
        }

        public static string GerarTokenAutenticacao(string usu_login)
        {
            var caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var random = new Random();
            var resultado_aleatorio = new string(
                Enumerable.Repeat(caracteres, 20)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());

            return CriptografarTexto(usu_login + resultado_aleatorio);
        }

        public static string CriptografarTexto(string texto)
        {
            if (!string.IsNullOrEmpty(texto))
            {
                var asciiTexto = Encoding.ASCII.GetBytes(texto);
                SHA256Managed hashTexto = new SHA256Managed();
                string hex = "";

                var hashValor = hashTexto.ComputeHash(asciiTexto);
                foreach (byte x in hashValor)
                {
                    hex += String.Format("{0:x2}", x);
                }
                return hex;
            }
            else
                return null;
        }

        public static bool VerificaSeTokenEstaAtivo(string token)
        {
            bool resultado = false;
            using (var _contexto = new Contexto())
            {
                try
                {
                    var usu_token = (from ust in _contexto.usuariostokens
                                     join usu in _contexto.usuarios on ust.usu_login equals usu.usu_login
                                     where ust.ust_token.Equals(token) && ust.ust_status.Equals("A")
                                        && (ust.ust_data_val == null || ust.ust_data_val >= DateTime.Now)
                                     select ust).FirstOrDefault();

                    if (usu_token != null)
                        resultado = true;
                }
                catch (Exception ex)
                {
                    return false;
                    throw ex;
                }
            }

            return resultado;
        }

        public static int ObterUsuIdPorToken(string token)
        {
            using (var _contexto = new Contexto())
            {
                var usu_login = _contexto.usuariostokens.Where(x => x.ust_token.Equals(token)).FirstOrDefault().usu_login;
                var usuario = _contexto.usuarios.Where(x => x.usu_login.Equals(usu_login)).FirstOrDefault();
                return usuario != null ? usuario.usu_id : 0;
            }
        }
    }
}