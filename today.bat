@echo off
::
:: example
::


setlocal
for /f "tokens=1-3 delims=- " %%A in ('echo %DATE%') do (set YY=%%A& SET MO=%%B& SET DD=%%C)

echo.
echo %YY%%MO%%DD%
endlocal


setlocal
SET YY=%DATE:~0,4%
SET MO=%DATE:~5,2%
SET DD=%DATE:~8,2%

echo.
echo %YY%%MO%%DD%
echo.
endlocal


::
:: it should be included the space after &.
::
setlocal
for /f "tokens=1-4 delims=:. " %%a in ('echo %time%') do (set hh=%%a& set mi=%%b& set ss=%%c& set ms=%%d)
echo.
echo %hh%%mi%%ss%%ms%
endlocal

setlocal
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%
set ms=%time:~9,2%

echo.
echo %hh%%mi%%ss%%ms%
endlocal

