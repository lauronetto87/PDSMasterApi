/*
=================================================================================================================================================

	Objeto:			Tabela [ParametrosAdesaoMapfre]
	Data Cria��o:	05/12/2016
	Desenvolvedor:	Igor Santos
	Descri��o:		Cria��o da tabela de parametros de ades�o da Mapfre
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

=================================================================================================================================================
*/
USE [HomBD_Portal_Servico]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParametrosAdesaoMapfre](
	[pam_cod_seg] [char](4) NOT NULL,
	[pam_cod_empresa] [char](10) NOT NULL,
	[pam_numero_remessa] [char](6) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT INTO [dbo].[ParametrosAdesaoMapfre]
(pam_cod_seg, pam_cod_empresa, pam_numero_remessa)
VALUES
(1, 9999999999, 1);

select * from ParametrosAdesaoMapfre