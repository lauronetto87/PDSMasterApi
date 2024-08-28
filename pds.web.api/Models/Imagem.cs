using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class Imagem
    {
        [Key]
        public int img_id { get; set; }
        public string img_tipo { get; set; }
        public string img_nome { get; set; }
        public string img_descricao { get; set; }
        public string img_caminho { get; set; }
        public int? img_ordem { get; set; }
        public string img_status { get; set; }
        public string usu_login { get; set; }
        public DateTime img_dat_cad { get; set; }
        public bool img_flag_excluido { get; set; }
    }
}