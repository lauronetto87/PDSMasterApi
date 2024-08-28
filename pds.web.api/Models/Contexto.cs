using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace pds.web.api.Models
{
    public class Contexto : DbContext
    {
        public Contexto() : base("PortalServicoConnectionString") { }

        public DbSet<UsuarioToken> usuariostokens { get; set; }
        public DbSet<Usuario> usuarios { get; set; }
        public DbSet<Perfil> perfis { get; set; }
        public DbSet<Cliente> clientes { get; set; }
        public DbSet<Telefone> telefones { get; set; }
        public DbSet<Contrato> contratos { get; set; }
        public DbSet<InfoMobile> infomobile { get; set; }
        public DbSet<Parametro> parametros { get; set; }
        public DbSet<Produto> produtos { get; set; }
        public DbSet<Endereco> enderecos { get; set; }
        public DbSet<ContratoParcela> contratosparcelas { get; set; }
        public DbSet<TipoCobranca> tiposcobrancas { get; set; }
        public DbSet<Seguradora> seguradoras { get; set; }
        public DbSet<Imagem> imagens { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UsuarioToken>().ToTable("usuariotoken");
            modelBuilder.Entity<UsuarioToken>().HasKey(x => x.ust_id);

            modelBuilder.Entity<Usuario>().ToTable("usuario");
            modelBuilder.Entity<Usuario>().HasKey(x => x.usu_id);

            modelBuilder.Entity<Perfil>().ToTable("perfil");
            modelBuilder.Entity<Perfil>().HasKey(x => x.pfl_id);

            modelBuilder.Entity<Cliente>().ToTable("cliente");
            modelBuilder.Entity<Cliente>().HasKey(x => x.cli_id);

            modelBuilder.Entity<Telefone>().ToTable("telefone");
            modelBuilder.Entity<Telefone>().HasKey(x => x.tel_id);

            modelBuilder.Entity<Contrato>().ToTable("contrato");
            modelBuilder.Entity<Contrato>().HasKey(x => x.ctt_id);

            modelBuilder.Entity<InfoMobile>().ToTable("infomobile");
            modelBuilder.Entity<InfoMobile>().HasKey(x => x.ifb_id);

            modelBuilder.Entity<Parametro>().ToTable("parametro");
            modelBuilder.Entity<Parametro>().HasKey(x => x.prt_id);

            modelBuilder.Entity<Produto>().ToTable("produto");
            modelBuilder.Entity<Produto>().HasKey(x => x.pro_id);

            modelBuilder.Entity<Endereco>().ToTable("endereco");
            modelBuilder.Entity<Endereco>().HasKey(x => x.end_id);

            modelBuilder.Entity<ContratoParcela>().ToTable("contratoparcela");
            modelBuilder.Entity<ContratoParcela>().HasKey(x => x.cpl_id);

            modelBuilder.Entity<TipoCobranca>().ToTable("tipocobranca");
            modelBuilder.Entity<TipoCobranca>().HasKey(x => x.tcc_id);

            modelBuilder.Entity<Seguradora>().ToTable("seguradora");
            modelBuilder.Entity<Seguradora>().HasKey(x => x.seg_id);

            modelBuilder.Entity<Imagem>().ToTable("imagem");
            modelBuilder.Entity<Imagem>().HasKey(x => x.img_id);
        }
    }
}