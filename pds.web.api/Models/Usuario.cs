using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class Usuario
    {
        [Key]
        public int usu_id { get; set; }
        public int pfl_id { get; set; }
        public int? uad_id { get; set; }
        public string usu_login { get; set; }
        public string usu_nome { get; set; }
        public string usu_cpf_cnpj { get; set; }
        public string usu_senha { get; set; }
        public string usu_ddi { get; set; }
        public string usu_ddd { get; set; }
        public string usu_celular { get; set; }
        public string usu_email { get; set; }
        public string usu_status { get; set; }
        public int usu_tent_login { get; set; }
        public string usu_token { get; set; }
        public DateTime? usu_val_token { get; set; }
        public bool usu_alt_senha { get; set; }
        public bool usu_flag_excluido { get; set; }
    }
}