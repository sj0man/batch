@echo off
rem
rem
rem ���� ��¥�� �ý��ۿ��� �� �پ��ϰ� ����ϴ� ���
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
