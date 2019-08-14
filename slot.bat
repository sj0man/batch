@ECHO OFF
::
:: 2019-07-11
::

SETLOCAL

SET tdir="C:\Users\sj0man\Google 드라이브\1.단어장\90일후 (3달후)"
SET mon=%DATE:~5,2%
SET day=%DATE:~-2%

:: only for testing
::
::SET mon=12
::SET day=26


FOR /L %%n IN (90,-1,1) DO (
	CALL :next %%n
)

ENDLOCAL
ECHO.
PAUSE
GOTO :EOF



:next
SET idx=%1
SET /A share=(%day%+%1) / 31
SET /A rest=(%day%+%1) %% 31
SET /A trest30=%rest% + 101

SET /A tmon1=((%mon% + 1) %% 12) + 100
SET /A tmon2=((%mon% + 2) %% 12) + 100
SET /A tmon3=((%mon% + 3) %% 12) + 100

SET rest30=%trest30:~1,2%
SET mon1=%tmon1:~1,2%
SET mon2=%tmon2:~1,2%
SET mon3=%tmon3:~1,2%


IF %share% EQU 0 (
	IF NOT EXIST %tdir%\%mon%%rest30%.xlsx	ECHO %mon%%rest30%.xlsx	
) ELSE IF %share% EQU 1 (
	IF NOT EXIST %tdir%\%mon1%%rest30%.xlsx	ECHO %mon1%%rest30%.xlsx	
) ELSE IF %share% EQU 2 (
	IF NOT EXIST %tdir%\%mon2%%rest30%.xlsx	ECHO %mon2%%rest30%.xlsx	
) ELSE IF %share% EQU 3 (
	IF NOT EXIST %tdir%\%mon3%%rest30%.xlsx	ECHO %mon3%%rest30%.xlsx	
)


EXIT /b
