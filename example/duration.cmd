@echo off
::
:: 두 시각의 차이를 계산하는 함수 및 예제
::

setlocal


set T1=20:59:16.76
set T2=20:59:27.67
set T3=21:01:30.46
set T4=22:08:57.00
set T5=22:18:28.35
set T6=22:57:14.35
set T7=23:18:03.38

call :FOO %T1% %T2%
echo %DURATION%

call :FOO %T2% %T3%
echo %DURATION%

call :FOO %T3% %T4%
echo %DURATION%

call :FOO %T4% %T5%
echo %DURATION%

call :FOO %T5% %T6%
echo %DURATION%

call :FOO %T6% %T7%
echo %DURATION%


goto :EOF




:FOO

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


endlocal
