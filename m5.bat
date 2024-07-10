@echo off

:: SETLOCAL EnableDelayedExpansion

echo.

for /f "tokens=* usebackq" %%F in (`dir /b /a:-d *.*`) do (
    for /f "tokens=* usebackq" %%m in (`certUtil -hashfile %%F MD5 ^| findstr -v ":"`) do ( echo %%m %%F )
)

echo.
