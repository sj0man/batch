@echo off
::
:: for 루프 내부에서는 값이 변경되지 않지만,
:: 루프를 벗어나면 최종 값이 적용된다.
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
