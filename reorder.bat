@echo off
::
:: file name should be started "o "
::

SETLOCAL

SET total=12
SET jump=4

FOR /l %%i IN (1,1,%total%) DO (
	CALL :func %%i
)

GOTO :EOF




:func

SET arg=%1
SET fname="o %arg%.pdf"

SET /A num=(%arg%-1)*%jump%+1001
SET new="p%num:~1%.pdf"

IF EXIST %fname% (
	ECHO REN %fname% %new%
	REN %fname% %new%
)

EXIT /b
