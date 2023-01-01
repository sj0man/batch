@echo off

setlocal


if "%1" == "" (
	echo The syntax of the command is incorrect.
	echo.
	goto :EOF
)

sed -e "s/[\xe0-\xff]/_/g" %1



endlocal