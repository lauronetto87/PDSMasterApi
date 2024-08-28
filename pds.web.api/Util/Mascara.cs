using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pds.web.api.Util
{
    public class Mascara
    {
        public static string TelefoneMovel(string telefone)
        {
            string ddi = telefone.Substring(0, 2);
            string ddd = telefone.Substring(2, 2);
            string num_inicio;
            string num_fim;
            if (telefone.Length == 13)
            {
                num_inicio = telefone.Substring(4, 5);
                num_fim = telefone.Substring(9);
            }
            else
            {
                num_inicio = telefone.Substring(4, 4);
                num_fim = telefone.Substring(8);
            }
                
            return string.Format(@"+{0} ({1}) {2}-{3}", ddi, ddd, num_inicio, num_fim);
        }

        public static string TelefoneFixo(string telefone)
        {
            string ddi = telefone.Substring(0, 2);
            string ddd = telefone.Substring(2, 2);
            string num_inicio = telefone.Substring(4, 4);
            string num_fim = telefone.Substring(8);

            return string.Format(@"+{0} ({1}) {2}-{3}", ddi, ddd, num_inicio, num_fim);
        }
    }
}