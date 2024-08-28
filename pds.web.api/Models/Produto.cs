using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class Produto
    {
        [Key]
        public int pro_id { get; set; }
        public int ram_id { get; set; }
        public int seg_id { get; set; }
        public int? com_id { get; set; }
        public string pro_nome { get; set; }
        public string pro_descricao { get; set; }
        public string pro_categoria { get; set; }
        public int pro_min_parc { get; set; }
        public int pro_max_parc { get; set; }
        public string pro_cod_na_segur { get; set; }
        public string pro_tipo_premio { get; set; }
        public DateTime pro_data_cad { get; set; }
        public string pro_status { get; set; }
        public string usu_login { get; set; }
        public int pro_meses_cobert { get; set; }
        public string pro_imagem { get; set; }
        public string pro_introducao { get; set; }
        public string pro_coberturas { get; set; }
        public string pro_beneficios { get; set; }
        public string pro_comissionamento { get; set; }
        public string pro_video { get; set; }
        public string pro_rodape { get; set; }
        public string pro_imagem_mob { get; set; }
    }
}