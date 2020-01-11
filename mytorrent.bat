@ECHO OFF
::
:: 2019-12-25
:: 2020-01-11
::

SETLOCAL

set TPATH=C:\Users\%USERNAME%\AppData\Roaming\uTorrent\updates
set TFILE=utorrentie.exe

echo.
dir /b %TPATH%
echo.

for /f %%A in ('dir /b /a:d /o:-n %TPATH%') do (set TDIR=%%A&& goto :first)


:first
if not exist %TPATH%\%TDIR%\%TFILE% (
	echo not found
	exit /b
)

:: rename command cannot assign target directory
::
if exist %TPATH%\%TDIR%\%TFILE% (
	if not exist %TPATH%\%TDIR%\_%TFILE% (
		ren %TPATH%\%TDIR%\%TFILE% _%TFILE%

		echo renamed %TPATH%\%TDIR%\_%TFILE% 
		echo.
	) else (
		echo existed %TPATH%\%TDIR%\_%TFILE%
		echo.
	)
)

:: create empty file
::
if not exist %TPATH%\%TDIR%\%TFILE% (
	type NUL > %TPATH%\%TDIR%\%TFILE%

	echo created %TPATH%\%TDIR%\%TFILE%
	echo.
)

exit /b
