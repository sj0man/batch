@echo off


setlocal

set debug_flag="0"
set format_flag="old"


if "%1" == "" (
	echo The syntax of the command is incorrect.
	echo.
	goto :EOF
) else (
	if "%1" == "/?" (
		echo Remove long or old events.
		echo.
		echo %0 file
		echo.
		goto :EOF
	) else (
		set infile=%1
	)
)


if not exist %infile% (
	echo file not found.
	goto :EOF
)

set outfile="outfile"


::
:: debugging
::
if %debug_flag% == "1" (
	echo %infile%
	goto :EOF
)

::
:: old or new format
::
if %format_flag% == "new" (
	findstr /r /v /c:"CODE=SALIVE,CHLIST=" /c:"CODE=SALIVE,RECLIST=" /c:"CODE=SALIVE,FAVLIST=" /c:"^1970-" /c:"^200.-" /c:"^201[0-3]-" /c:"^2014-0[1-5]" %infile% > %outfile%
) else (
	findstr /r /v /c:"CODE=SALIVE,CHLIST=" /c:"CODE=SALIVE,RECLIST=" /c:"CODE=SALIVE,FAVLIST=" /c:"DATE=1970-" /c:"DATE=200.-" /c:"DATE=201[0-3]-" /c:"DATE=2014-0[1-5]" %infile% > %outfile%
)


echo.
echo created %outfile%
echo.


endlocal