::
:: Powershell command
:: dir | Rename-Item -NewName {$_.name -replace "바뀔패턴", "바꿀패턴"}
::
:: Example
:: dir *.mp3 | Rename-Item -NewName {$_.name -replace " - 구글검색 짱토렌트", ""}
::

@echo off

setlocal Enabledelayedexpansion

for /f "delims=" %%a in ('dir /a-d /b *.mp3') do (
	set fnm=%%~na
	set newname=!fnm:~0,-12!
	ren "%%a" "!newname!.mp3"
)

endlocal

