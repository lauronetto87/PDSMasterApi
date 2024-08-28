using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class Telefone
    {
        [Key]
        public int tel_id { get; set; }
        public int cli_id { get; set; }
        public string tel_tipo { get; set; }
        public string tel_ddi { get; set; }
        public string tel_ddd { get; set; }
        public string tel_numero { get; set; }
        public bool tel_flag_sms { get; set; }
        public bool tel_principal { get; set; }
        public string tel_status { get; set; }
        public string usu_login { get; set; }
        public DateTime tel_data_cad { get; set; }
        public bool tel_flag_excluido { get; set; }
    }
}