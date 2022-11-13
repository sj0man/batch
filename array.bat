@echo off

setlocal Enabledelayedexpansion


set TOTAL=10
set arr[1]=file1
set arr[2]=file2
set arr[3]=file3
set arr[4]=file4
set arr[5]=file5
set arr[6]=file6
set arr[7]=file7
set arr[8]=file8
set arr[9]=file9
set arr[10]=file10

for /L %%i in (1,1,%TOTAL%) do (
	echo arr[%%i] = !arr[%%i]!
)
