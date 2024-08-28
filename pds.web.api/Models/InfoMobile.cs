using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class InfoMobile
    {
        [Key]
        public int ifb_id { get; set; }
        public int ust_id { get; set; }
        public string ifb_modelo { get; set; }
        public string ifb_plataforma { get; set; }
        public string ifb_uuid { get; set; }
        public string ifb_serial { get; set; }
        public string ifb_versao_so { get; set; }
        public string ifb_fabricante { get; set; }
        public string ifb_token_push { get; set; }
        public bool ifb_virtual { get; set; }
    }
}