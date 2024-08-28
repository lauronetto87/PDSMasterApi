using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class TipoCobranca
    {
        [Key]
        public int tcc_id { get; set; }
        public string tcc_descricao { get; set; }
        public string tcc_status { get; set; }
        public DateTime tcc_data_cad { get; set; }
        public string usu_login { get; set; }
    }
}