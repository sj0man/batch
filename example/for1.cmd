@echo off
::
:: for ���� ���ο����� ���� ������� ������,
:: ������ ����� ���� ���� ����ȴ�.
::


setlocal


set /a NUM=0

for /l %%f in (1,1,10) do (
	set /a NUM=NUM+1
	echo %%f: NUM=%NUM%
)

echo.
echo result: NUM=%NUM%
echo.


endlocal
