@echo off


setlocal

set debug_flag="0"

set sed_script_01=.\script\sed_script_01
set sed_script_02=.\script\sed_script_02
set sed_script_03=.\script\sed_script_03
set sed_script_04=.\script\sed_script_04


if "%1" == "" (
	echo The syntax of the command is incorrect.
	echo.
	goto :EOF
) else (
	if "%2" == "" (
		echo Change log format.
		echo.
		echo %0 in out
		echo.
		goto :EOF
	) else (
		set infile=%1
		set outfile=%2
	)
)


if not exist %infile% (
	echo %infile% not found.
	goto :EOF
)

if exist %outfile% (
	echo %outfile% already exist.
	echo.
	set /p YN="Continue(y/n)?"

	if not "%YN%" == "y" goto :EOF
	echo.
)

::
:: debugging
::
if %debug_flag% == "1" (
	echo %infile%
	echo %outfile%
	echo.
	goto :EOF
)

sed -f %sed_script_01% %infile% | sed -f %sed_script_02% | sed -f %sed_script_03% | sed -f %sed_script_04% > %outfile%
echo %outfile%

endlocal