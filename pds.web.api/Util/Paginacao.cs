using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pds.web.api.Util
{
    public class Paginacao
    {
        public class DadosPaginados<T>
        {
            /// <summary>
            /// Método para paginação dos dados a serem enviados
            /// </summary>
            /// <param name="dados">Dados</param>
            /// <param name="pagina">Índice da página</param>
            /// <param name="qtdItensPorPagina">Quantidade de itens por página</param>
            public DadosPaginados(IEnumerable<T> dados, int pagina, int qtdItensPorPagina = 5)
            {
                Dados = dados.Skip((pagina - 1) * qtdItensPorPagina).Take(qtdItensPorPagina).ToList();
                TotalPaginas = Convert.ToInt32(Math.Ceiling(Convert.ToDecimal(dados.Count()) / Convert.ToDecimal(qtdItensPorPagina)));
            }

            public int TotalPaginas { get; set; }
            public ICollection<T> Dados { get; set; }
        }
    }
}