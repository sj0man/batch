@echo off

setlocal Enabledelayedexpansion

set TOTAL=11

set HOSTIP=172.30.1.128
set SRCDIR=C:\temp\0708_d547\0708_bkup
::set SRCDIR=C:\temp\0708_d547\547-libs_08-07_01

set SRCFILE[1]=com.synaptics.amplitude@1.0.so
set SRCFILE[2]=com.synaptics.amplitude@1.0-adapter-helper.so
set SRCFILE[3]=com.synaptics.amplitude@1.0-service
set SRCFILE[4]=com.synaptics.amplitude@1.0-service.rc
set SRCFILE[5]=com.synaptics.amplitude@1.0-service.xml
set SRCFILE[6]=iptv_player
set SRCFILE[7]=libiptv.so
set SRCFILE[8]=libiptv_jni.so
set SRCFILE[9]=libxml_amplitude.so
set SRCFILE[10]=libstagefright_synaplayer.so
set SRCFILE[11]=prod_com.synaptics.amplitude@1.0.so
set SRCFILE[12]=libcurl.so
set SRCFILE[13]=libmediaplayerservice.so
set SRCFILE[14]=libsndsrv.so

set DESTFILE[1]=/vendor/lib/com.synaptics.amplitude@1.0.so
set DESTFILE[2]=/vendor/lib/com.synaptics.amplitude@1.0-adapter-helper.so
set DESTFILE[3]=/vendor/bin/hw/com.synaptics.amplitude@1.0-service
set DESTFILE[4]=/vendor/etc/init/com.synaptics.amplitude@1.0-service.rc
set DESTFILE[5]=/vendor/etc/vintf/manifest/com.synaptics.amplitude@1.0-service.xml
set DESTFILE[6]=/vendor/bin/iptv_player
set DESTFILE[7]=/vendor/lib/libiptv.so
set DESTFILE[8]=/vendor/lib/libiptv_jni.so
set DESTFILE[9]=/system/lib/libstagefright_synaplayer.so
set DESTFILE[10]=/vendor/lib/libxml_amplitude.so
set DESTFILE[11]=/product/lib/com.synaptics.amplitude@1.0.so
set DESTFILE[12]=/system/lib/libcurl.so
set DESTFILE[13]=/system/lib/libmediaplayerservice.so
set DESTFILE[14]=/vendor/lib/libsndsrv.so


adb connect %HOSTIP%
timeout /t 1

adb root
timeout /t 1

adb remount
timeout /t 1

for /L %%i in (1,1,%TOTAL%) do (
	if exist %SRCDIR%\!SRCFILE[%%i]! (
		adb push %SRCDIR%\!SRCFILE[%%i]!	!DESTFILE[%%i]!
	) else (
		echo 		not found %SRCDIR%\!SRCFILE[%%i]!
	)
)

echo.
echo reboot?
echo.
pause

adb reboot
adb disconnect

endlocal
