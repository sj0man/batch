@ECHO OFF
::
:: 2019-06-29
:: Update: 2019-07-12
:: Update: 2019-07-23
:: Update: 2019-07-27
:: Update: 2019-08-01
:: Update: 2019-08-10
::

SETLOCAL

SET logdir=.\Logs
SET logfile=%COMPUTERNAME%_%USERNAME%_%DATE%.log

SET xls="C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE"
SET mon=%DATE:~5,2%
SET day=%DATE:~-2%
SET fn=%mon%%day%.xlsx
::SET fn=0808.xlsx


SET tm=%TIME: =0%
SET hour=%tm:~0,2%
SET minute=%tm:~3,2%
SET second=%tm:~6,2%
SET tf=tmp%hour%%minute%%second%.txt
SET findfile=ff.bat


IF NOT EXIST %logdir%		ECHO %logdir% & MKDIR %logdir%

DIR /s /b %fn% > %tf% 2> NUL 
IF NOT %errorlevel% == 0 	(ECHO. & ECHO All Done! & GOTO :finish)

SET T1=%TIME%
ECHO =======================
TYPE %tf% | FIND "" /v /c
ECHO =======================



FOR /F "delims=" %%i IN (%tf%) DO (	
	ECHO. & ECHO %%i & ECHO.
	%xls% "%%i"
	PAUSE
)

SET T2=%TIME%
CALL :DIFF %T1% %T2%
ECHO.
ECHO =======================
ECHO Finish: %T2% (%DURATION%)
ECHO =======================




ECHO.
FOR /F "delims=" %%i IN (%tf%) DO ECHO %%i
ECHO ==================================================
SET /p yn="Delete all %fn%? (y/n): "
::
:: When you compare the string, you should wrap the double quatation.
::
IF NOT "%yn%"=="y" GOTO :finish
FOR /F "delims=" %%i IN (%tf%) DO (
	del "%%i"
)

ECHO =======================
CALL %findfile% %fn%
ECHO =======================

::
:: Collect log data before deleting files.
::
ECHO ======================= >> %logdir%\%logfile%
ECHO %DATE% >> %logdir%\%logfile%
ECHO Begin: %T1% >> %logdir%\%logfile%
ECHO End: %T2% >> %logdir%\%logfile%
ECHO Duration: %DURATION% >> %logdir%\%logfile%
ECHO ======================= >> %logdir%\%logfile%
TYPE %tf% >> %logdir%\%logfile%
ECHO. >> %logdir%\%logfile%


::
:: call external batch file and send parameter.
::

:finish
DEL %tf% 2> NUL
ECHO.

ENDLOCAL
PAUSE
GOTO :EOF



:DIFF

for /f "tokens=1-3 delims=:." %%A in ('echo %~1') do (
	set HH=%%A&set MM=%%B&set SS=%%C
)
set /a H=1%HH% - 100
set /a M=1%MM% - 100
set /a S=1%SS% - 100
set /a UT1=%H%*3600 + %M%*60 + %S%

for /f "tokens=1-3 delims=:." %%A in ('echo %~2') do (
	set HH=%%A&set MM=%%B&set SS=%%C
)
set /a H=1%HH% - 100
set /a M=1%MM% - 100
set /a S=1%SS% - 100
set /a UT2=%H%*3600 + %M%*60 + %S%

set /a DF=%UT2%-%UT1%
set /a HH=(%DF%/3600) + 100
set HH=%HH:~1,2%
set /a MM=((%DF% %% 3600)/60) + 100
set MM=%MM:~1,2%
set /a SS=(%DF% %% 60) + 100
set SS=%SS:~1,2%

set DURATION=%HH%:%MM%:%SS%

exit /b