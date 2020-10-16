@echo off
::
:: file name should be started "o "
::


setlocal

if "%1" == "" (
	set EXE_RENAME=0
) else (
	set EXE_RENAME=1
)

set START_IDX=15
set END_IDX=24
set JUMP=2


for /l %%i in (%START_IDX%,1,%END_IDX%) do (
	call :func %%i
)

goto :EOF




:func

set arg=%1
set fname="o %arg%.pdf"


set /A num=(%arg%-%START_IDX%)*%JUMP%+1001
set new="p%num:~1%.pdf"

if EXIST %fname% (
	echo ren %fname% %new%
	if "%EXE_RENAME%" == "1"	ren %fname% %new%
)

exit /b
