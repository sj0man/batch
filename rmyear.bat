@echo off
::
:: 2019-06-26
::

setlocal

if "%1" == "" (
	set THIS_YEAR=%date:~0,4%
) else (
	set THIS_YEAR=%1
)


for /l %%i in (1,1,12) do (
	call :MAKE_DIR %%i
)

goto :EOF




:MAKE_DIR

set /a MON=100 + %1
set NAME=%THIS_YEAR%-%MON:~1%

if exist %NAME% (
	echo rmdir %NAME%
	rmdir %NAME%
)

exit /b
