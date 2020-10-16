@echo off
::
:: file name should be started "e "
::

setlocal

if "%1" == "" (
	set EXE_RENAME=0
) else (
	set EXE_RENAME=1
)

set START_IDX=1
set END_IDX=10
set JUMP=2


for /l %%i in (%END_IDX%,-1,%START_IDX%) do (
	call :func %%i
)

goto :EOF




:func

set arg=%1
set fname="e %arg%.pdf"

set /A num=(%END_IDX%-%arg%+1)*%JUMP% + 1000
set new="p%num:~1%.pdf"

if EXIST %fname% (
	echo ren %fname% %new%
	if "%EXE_RENAME%" == "1"	ren %fname% %new%
)

exit /b


