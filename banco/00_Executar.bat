setlocal enableDelayedExpansion
@echo off
ECHO. > "Execucao.log"

for %%G in (*.sql) do (
	
	ECHO.
	ECHO Script: "%%G"
	ECHO Inicio: !DATE! !TIME!
	
	ECHO -------------------------------------------------------- >> "Execucao.log"
	ECHO !DATE! !TIME! Executando o script "%%G"... >> "Execucao.log"
	ECHO -------------------------------------------------------- >> "Execucao.log"
	ECHO. >> "Execucao.log"
	
	sqlcmd /S 192.168.2.43 /d master -E -i"%%G" >> "Execucao.log"
	
	ECHO Fim: !DATE! !TIME!
	ECHO --------------------------------------------------------
	
	ECHO. >> "Execucao.log"
	ECHO Fim da execucao: !DATE! !TIME! >> "Execucao.log"
	ECHO -------------------------------------------------------- >> "Execucao.log"
	ECHO. >> "Execucao.log"
	ECHO. >> "Execucao.log"
	
)

PAUSE