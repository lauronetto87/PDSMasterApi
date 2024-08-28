using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class Parametro
    {
        [Key]
        public int prt_id { get; set; }
        public string prt_chave { get; set; }
        public string prt_valor { get; set; }
    }
}