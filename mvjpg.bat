@echo off
::
::

setlocal

if "%1" == "" (
	set THIS_YEAR=%date:~0,4%
) else (
	set THIS_YEAR=%1
)


:: make directories for the year
::
for /l %%i in (1,1,12) do (
	call :MAKE_DIR %%i
)

:: move jpg files
::
for /l %%i in (1,1,12) do (
	call :MOVE_JPG %%i
)
goto :EOF



:MAKE_DIR
set /a MON=100 + %1
set NAME=%THIS_YEAR%-%MON:~1%

if not exist %NAME% (
	echo mkdir %NAME%
	mkdir %NAME%
)

exit /b


:MOVE_JPG
set /a MON=100 + %1
set SRCFILES=%THIS_YEAR%-%MON:~1%-*.*
set DESTDIR=%THIS_YEAR%-%MON:~1%\

echo ------------------------------
echo move %SRCFILES% %DESTDIR%
echo ------------------------------
move %SRCFILES% %DESTDIR%

exit /b

endlocal
