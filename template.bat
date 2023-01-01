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
echo 도움말은 여기에 기술하세요.
echo.

:QUIT

endlocal
