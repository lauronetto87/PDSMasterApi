using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class Seguradora
    {
        [Key]
        public int seg_id { get; set; }
        public string seg_nome { get; set; }
        public string seg_nome_abrev { get; set; }
        public DateTime seg_data_cad { get; set; }
    }
}