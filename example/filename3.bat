@echo off

setlocal


set empty_line=0
set change_log=0


set chglog=d:\working\splunk\spool\chglog.bat


if "%empty_line%" == "1" (
	for %%f in ( "org\*.log" ) do (
		echo %%~nxf
		sed -e "/^$/d" %%f > %%~nxf
	)
)


if "%change_log%" == "1" (
	for %%f in ( "org\*.log" ) do (
		echo %%~nxf
		call %chglog% %%f %%~nxf
	)

)


endlocal

