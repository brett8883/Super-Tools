@echo off 
cls 
SET version=2.0
set appver=BETA
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %version% %appver%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
ECHO. 
ECHO  Please choose your Aircraft
ECHO.
ECHO -------------------------------------------------------------------------------------------
ECHO	1) Mavic Pro 1 / Mavic Platinum / Mavic Artic White
ECHO	2) Spark
ECHO	3) Phantom 4 Standard
ECHO	4) Phantom 4 Advanced
ECHO	5) Phantom 4 Pro
ECHO	6) Phantom 4 Pro v2
ECHO	7) Inspire 2
ECHO.
choice /C 1234567 /D 1 /T 99 /M "Please select connected device"
If Errorlevel 7 goto Sorry
If Errorlevel 6 goto Sorry
If Errorlevel 5 goto Sorry
If Errorlevel 4 goto Sorry
If Errorlevel 3 goto Sorry
If Errorlevel 2 goto SPK
If Errorlevel 1 goto MP

:sorry
cls
Echo So Sorry! :(
Echo.
ECHO Super-Patcher does not support your aircraft just yet but check back soon becasue it is almost ready!
ECHO.
ECHO See you soon! 
pause 
exit 

:MP 
@Echo off
cls
set AC=MavicPro
set verify_type=MPSPK
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/MavicPro_MPP_super_patcher_03.02.44.10_dji_system.bin
set fw2=MavicPro_MPP_super_patcher_03.02.44.10_dji_system.bin
java -jar %fw% %fw2%
cls
goto download

:SPK
cls
@echo off
set AC=Spark
set verify_type=MPSPK
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/Spark_Super_Patcher_03.02.44.09_dji_sytem.bin
set fw2=Spark_Super_Patcher_03.02.44.09_dji_sytem.bin
cls
goto download

:download 
@echo off 
cls
del *.bin
mkdir tools
java -jar download.jar %fw% %fw2%
cd tools
copy *.* ..
cd ..
copy *.bin ..
cd ..
cd program
rmdir /Q /S nonemptydir TOOLS
call Downloadupdates.bat