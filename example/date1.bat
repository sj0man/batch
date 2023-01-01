@echo off
rem
rem
rem 오늘 날짜를 시스템에서 얻어서 다양하게 계산하는 방법
rem
rem

setlocal

set myyear=%date:~0,4%
set mymonth=%date:~5,2%
set myday=%date:~8,2%

set /a mynum=%myday% - 1

echo %myyear%%mymonth%%mynum%
echo %date%

endlocal
