@ECHO OFF
::
:: 2019-06-26
::

SETLOCAL

IF "%1" == "" 	GOTO :enter

:: there is a parameter.
::
SET name="%1*"

ECHO.
DIR /s /b %name% 2> NUL | FIND "" /v /c
ECHO.

GOTO :EOF



:enter
SET /P n1="Enter the name: "
SET name="%n1%*"

ECHO.
DIR /s /b %name% 2> NUL | FIND "" /v /c
ECHO.

PAUSE
GOTO :EOF

