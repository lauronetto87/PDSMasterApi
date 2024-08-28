using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class Endereco
    {
        [Key]
        public int end_id { get; set; }
        public int cli_id { get; set; }
        public string end_tipo { get; set; }
        public string end_cep { get; set; }
        public string end_logradouro { get; set; }
        public string end_num { get; set; }
        public string end_complemento { get; set; }
        public string end_bairro { get; set; }
        public string end_cidade { get; set; }
        public string end_uf { get; set; }
        public bool end_flag_atual { get; set; }
        public string end_status { get; set; }
        public string usu_login { get; set; }
        public DateTime end_data_cad { get; set; }
        public bool end_flag_excluido { get; set; }
    }
}