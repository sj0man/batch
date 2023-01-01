@echo off



:: 빈줄을 찾는 명령어
::
:: findstr /r /n "^$" 201408.csv
::	/r = regular expression
::	/n = line number
::	/v = verbose
::
::

findstr /v /r /c:"^...LogDate" /c:"^$" infile.csv > infile.new


copy /b header + infile outfile


:: 파일 비교
::
:: fc 201408.csv 201408.new > fc.out




