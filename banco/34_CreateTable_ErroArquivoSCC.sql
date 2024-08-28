USE [HomBD_Portal_Servico]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [prestamista].[ErroArquivoSCC](
	[eas_id] [int] IDENTITY(1,1) NOT NULL,
	[eas_num_linha] [int] NOT NULL,
	[eas_info_linha] [varchar](max) NOT NULL,
	[eas_dat_proc] [datetime] NOT NULL,
	[usu_login] [varchar](50) NOT NULL,
	[eas_flag_resolvido] [bit] NOT NULL,
 CONSTRAINT [PK_Erro_ArquivoSCC] PRIMARY KEY CLUSTERED 
(
	[eas_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [prestamista].[ErroArquivoSCC]  WITH CHECK ADD  CONSTRAINT [FK_Erro_ArquivoSCC_Usuario] FOREIGN KEY([usu_login])
REFERENCES [dbo].[Usuario] ([usu_login])
GO
ALTER TABLE [prestamista].[ErroArquivoSCC] CHECK CONSTRAINT [FK_Erro_ArquivoSCC_Usuario]
GO