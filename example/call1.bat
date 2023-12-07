@echo off
::
:: 외부 배치파일을 실행하기
::

for /l %%i in (1,1,3) do (
	call f%%i.bat
)

echo.
