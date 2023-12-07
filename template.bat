@echo off
::
::
::

setlocal


if "%1" == "/?" goto :HELPMESG



echo.
echo show information
echo.

set /p YN="confirm? "

if "%YN%" neq ""     goto :EOF


goto QUIT

:HELPMESG
::
:: %0 parameter
::
echo.
echo Describe help message in this area.
echo.

:QUIT

endlocal
