@echo off

setlocal

if "%1" == "" (
	echo syntax: %~nx0 [path:\]file
	goto :EOF
)

if not exist %1 (
	echo not found "%1"
	goto :EOF
)

certUtil -hashfile %1 MD5 | findstr -v ":"
