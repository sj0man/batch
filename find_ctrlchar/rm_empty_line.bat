@echo off



:: ������ ã�� ��ɾ�
::
:: findstr /r /n "^$" 201408.csv
::	/r = regular expression
::	/n = line number
::	/v = verbose
::
::

findstr /v /r /c:"^...LogDate" /c:"^$" infile.csv > infile.new


copy /b header + infile outfile


:: ���� ��
::
:: fc 201408.csv 201408.new > fc.out




