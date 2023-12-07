@echo off

for /f "tokens=* usebackq" %%F in (`dir /b /s *.xlsm`) do (
	copy /v %%F \temp\samples
)

for %%f in ( "..\sed\*.*" ) do (
	echo %%~nxf
)
