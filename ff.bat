@ECHO OFF
::
:: 2019-06-26
:: 2019-09-18
::

SETLOCAL

IF "%1" == "" 	GOTO :enter

:: there is a argument.
::
SET name="%1*"
ECHO.
DIR /s /b %name% 2> NUL | FIND "" /v /c
ECHO.

GOTO :EOF



:enter
ECHO.
SET /P n1="Enter the name: "
SET name="%n1%*"

IF %name% NEQ "*"		GOTO :search
SET mmdd=%date:~5,2%%date:~-2%
SET name="%mmdd%*"
ECHO %mmdd%



:search
ECHO.
DIR /s /b %name% 2> NUL | FIND "" /v /c
ECHO.


PAUSE
GOTO :EOF
