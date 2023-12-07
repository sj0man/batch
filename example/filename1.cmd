@echo off
::
:: echo 명령어에서 파일이름만 추출
::


for %%f in ( *.cmd ) do (
	echo %%~nf
)
