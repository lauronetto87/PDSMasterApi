using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class Contrato
    {
        [Key]
        public Int64 ctt_id { get; set; }
        public int cli_id { get; set; }
        public int pdr_id { get; set; }
        public int pro_id { get; set; }
        public decimal ctt_val_seg { get; set; }
        public int ctt_qtd_prest { get; set; }
        public decimal ctt_val_prest { get; set; }
        public DateTime ctt_data_adesao { get; set; }
        public int ctt_qtd_mes_seg { get; set; }
        public DateTime ctt_inicio_cobert { get; set; }
        public DateTime ctt_fim_cobert { get; set; }
        public DateTime? ctt_dt_liquidacao { get; set; }
        public decimal ctt_valor_segurado { get; set; }
        public string ctt_status { get; set; }
        public DateTime ctt_data_cadastro { get; set; }
        public string usu_login { get; set; }
        public bool ctt_flag_aceito { get; set; }
        public bool ctt_flag_pago { get; set; }
        public bool ctt_flag_enviado { get; set; }
        public int ctt_quantidade_titulos { get; set; }
        public decimal ctt_valor_titulo { get; set; }
        public decimal ctt_valor_total { get; set; }
    }
}