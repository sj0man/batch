@ECHO OFF
::
:: 2019-06-29
:: Update: 2019-07-12
::

SETLOCAL

SET xls="C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE"
SET mon=%DATE:~5,2%
SET day=%DATE:~-2%
SET fn=%mon%%day%.xlsx
::SET fn=0630.xlsx


SET /A thour=%TIME:~0,2% + 100
::SET thour=115
SET hour=%thour:~1,2%
SET minute=%TIME:~3,2%
SET second=%TIME:~6,2%
SET tf=t%hour%%minute%%second%.txt
SET findfile=ff.bat


DIR /s /b %fn% > %tf% 2> NUL 
IF NOT %errorlevel% == 0 	(ECHO. & ECHO Done! & GOTO :finish)
TYPE %tf% | FIND "" /v /c & ECHO.



FOR /F "delims=" %%i IN (%tf%) DO (	
	ECHO. & ECHO %%i & ECHO.
	%xls% "%%i"
	PAUSE
)

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

::
:: call external batch file and send parameter.
::
CALL %findfile% %fn%

:finish
DEL %tf% 2> NUL
ECHO.

ENDLOCAL
PAUSE
