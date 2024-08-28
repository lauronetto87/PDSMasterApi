using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class Perfil
    {
        [Key]
        public int pfl_id { get; set; }
        public string pfl_nome { get; set; }
        public string pfl_status { get; set; }
        public string usu_login { get; set; }
        public DateTime pfl_data_cad { get; set; }
        public bool pfl_flag_excluido { get; set; }
    }
}