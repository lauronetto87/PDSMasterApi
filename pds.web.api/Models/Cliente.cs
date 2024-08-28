using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class Cliente
    {
        [Key]
        public int cli_id { get; set; }
        public string cli_tipo { get; set; }
        public string cli_cpf_cnpj { get; set; }
        public string cli_nome { get; set; }
        public string cli_sexo { get; set; }
        public DateTime cli_data_nasc { get; set; }
        public string cli_estado_civil { get; set; }
        public string cli_email { get; set; }
        public string cli_status { get; set; }
        public int cli_num_filhos { get; set; }
        public string cli_identidade { get; set; }
        public string cli_orgao_emissor { get; set; }
        public string cli_uf_emissao { get; set; }
        public DateTime cli_data_emissao { get; set; }
        public int ban_id { get; set; }
        public string cli_agencia { get; set; }
        public string cli_conta { get; set; }
        public string usu_login { get; set; }
        public DateTime cli_data_cad { get; set; }
        public bool cli_flag_excluido { get; set; }
    }
}