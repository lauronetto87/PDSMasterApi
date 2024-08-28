using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pds.web.api.Util
{
    public static class Status
    {
        public static string Contrato(string status)
        {
            switch(status)
            {
                case "A":
                    return "Ativo";
                case "C":
                    return "Cancelado";
                default:
                    return status;
            }
        }
    }
}