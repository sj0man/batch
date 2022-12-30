@echo off
::
:: Update from laptop to external storage.
::


setlocal

set LOGDIR=.\Logs
set LOGFILE=%COMPUTERNAME%_%USERNAME%_%date%.log
set LOGOPT=/LOG+:%LOGDIR%\%LOGFILE% /NP /NDL
set COPYOPT=/E /MIR /R:1 /W:1 /XA:H
set HOME=%HOMEDRIVE%%HOMEPATH%

SET DIRS=Desktop Documents Downloads Favorites Pictures Videos Music Dropbox OneDrive


for /f "tokens=1-3 delims=- " %%A in ('echo %DATE%') do (set YY=%%A&SET MM=%%B&SET DD=%%C)
set BKUPDIR=.\%COMPUTERNAME%_%USERNAME%_%YY%%MM%

::
:: execution part
::
if not exist %HOME%		echo error %HOME% & goto :error_label
if not exist %LOGDIR%		echo %LOGDIR% & mkdir %LOGDIR%
if not exist %BKUPDIR%		echo %BKUPDIR% & mkdir %BKUPDIR%

set T1=%TIME%
echo =======================
echo From: %HOME%
echo To: %BKUPDIR%
echo Begin: %T1%
echo =======================
echo.

for %%d in ( %DIRS% ) do (
	if not exist %HOME%\%%d (
		echo =======================
		echo not found %HOME%\%%d
		echo =======================
	) else (
		echo %%d
		robocopy %HOME%\%%d %BKUPDIR%\%%d %COPYOPT% %LOGOPT%
	)
	echo.
)

::
:: It has issue that is folder name inclued space
::
set SRC_GDRIVE="%HOME%\Google ����̺�"
set DEST_GDRIVE="%BKUPDIR%\Google ����̺�"

if not exist %SRC_GDRIVE% (
	echo =======================
	echo not found %SRC_GDRIVE%
	echo =======================
) else (
	echo %SRC_GDRIVE%
	robocopy %SRC_GDRIVE% %DEST_GDRIVE% %COPYOPT% %LOGOPT%
)
echo.


:error_label



set T2=%TIME%
call :DIFF %T1% %T2%
echo =======================
echo Finish: %T2% (%DURATION%)
echo =======================
echo.

pause

endlocal
goto :EOF



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



