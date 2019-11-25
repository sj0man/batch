@echo off
::
:: file name should be started "e "
::

SETLOCAL

SET total=11
SET jump=4
SET last_page=43


FOR /l %%i IN (1,1,%total%) DO (
	CALL :func %%i
)

GOTO :EOF




:func

SET arg=%1
SET fname="e %arg%.pdf"

SET /A num=%last_page%-(%arg%-1)*%jump% + 1000
SET new="p%num:~1%.pdf"

IF EXIST %fname% (
	ECHO REN %fname% %new%
	REN %fname% %new%
)

EXIT /b
