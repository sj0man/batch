@echo off
::
:: 2017-06-01
::
setlocal

set ff=leesj.dat
set fname=%ff:~0,-4%
set fext=%ff:~-3%

echo "%ff%"
echo "%fname%"
echo "%fext%"

endlocal
