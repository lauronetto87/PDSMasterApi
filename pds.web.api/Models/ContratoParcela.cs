using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class ContratoParcela
    {
        [Key]
        public Int64 cpl_id { get; set; }
        public int tcc_id { get; set; }
        public Int64 ctt_id { get; set; }
        public int cpl_num_parc { get; set; }
        public DateTime cpl_data_venc { get; set; }
        public DateTime? cpl_data_pag { get; set; }
        public decimal cpl_valor { get; set; }
        public string cpl_status { get; set; }
        public DateTime cpl_data_cad { get; set; }
        public string usu_login { get; set; }
        public decimal cpl_val_pag { get; set; }
    }
}