/*
=================================================================================================================================================

	Objeto:			Function [PadLeft]
	Data Criação:	01/12/2016
	Desenvolvedor:	Igor Santos
	Descrição:		Função para funcionalidade de PadLeft
	Alterações:
		[DATA] - [DESENVOLVEDOR]: [DESCRIÇÃO]

=================================================================================================================================================
*/
CREATE FUNCTION [dbo].[PadLeft]
(
	@Text NVARCHAR(MAX) ,
  @Replace NVARCHAR(MAX) ,
  @Len INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN 
	
	DECLARE @var NVARCHAR(MAX);
  SELECT @var = ISNULL(LTRIM(RTRIM(@Text)) , '');
	RETURN RIGHT(REPLICATE(@Replace,@Len)+ @var, @Len);

END