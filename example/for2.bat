@echo off
rem
rem date : 2014-08-19
rem
rem usage of 'for' command
rem 일괄 프로그램 (batch file)에서는 '%%변수'로 사용해야 함.
rem



setlocal

echo for /l %%i in (1,1,5) do echo %%i


endlocal
