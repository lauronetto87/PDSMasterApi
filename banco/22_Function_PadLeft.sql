/*
=================================================================================================================================================

	Objeto:			Function [PadLeft]
	Data Cria��o:	01/12/2016
	Desenvolvedor:	Igor Santos
	Descri��o:		Fun��o para funcionalidade de PadLeft
	Altera��es:
		[DATA] - [DESENVOLVEDOR]: [DESCRI��O]

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