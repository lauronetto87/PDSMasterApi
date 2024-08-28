using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class UsuarioToken
    {
        [Key]
        public int ust_id { get; set; }
        public string usu_login { get; set; }
        public string ust_token { get; set; }
        public DateTime ust_data_login { get; set; }
        public DateTime? ust_data_val { get; set; }
        public string ust_status { get; set; }
        public string ust_tpo_acesso { get; set; }
        public string ust_ip_interno { get; set; }
        public string ust_ip_externo { get; set; }
        public string ust_maquina { get; set; }
        public bool ust_sucesso { get; set; }
        public string ust_navegador { get; set; }
        public string ust_pais { get; set; }
        public string ust_estado { get; set; }
        public string ust_municipio { get; set; }
    }
}