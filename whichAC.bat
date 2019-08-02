@echo off 
cls 
call header.bat
ECHO. 
ECHO  Please choose your Aircraft
ECHO.
ECHO ----------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO	1) Mavic Pro 1 / Mavic Platinum / Mavic Artic White
ECHO	2) Spark
ECHO	3) Phantom 4 Pro
ECHO	4) Phantom 4 Standard
ECHO	5) Phantom 4 Advanced
ECHO	6) Phantom 4 Pro V2
ECHO	7) Inspire 2
ECHO.
choice /C 1234567 /D 1 /T 99 /M "Please select connected device"
If Errorlevel 7 goto Sorry
If Errorlevel 6 goto P4Pv2
If Errorlevel 5 goto p4a
If Errorlevel 4 goto p4s
If Errorlevel 3 goto p4p
If Errorlevel 2 goto SPK
If Errorlevel 1 goto MP

:sorry
cls
call header.bat
Echo So Sorry! :(
Echo.
ECHO Super-Patcher does not yet support Inspire 2. I am working on it but require a file from someone who has an Inspire 2. 
ECHO Please see my GitHub repo called Capture_I2_0306.unsig
ECHO.
ECHO https://github.com/brett8883/DJI_Super-Capture_I2_0306.unsig  
ECHO.
ECHO See you soon! 
pause 
exit 

:MP 
@Echo off
cls
set AC=MavicPro
set fc=3.02.44.10
set stock=01.04.0300
set vt=1
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/MavicPro_MPP_super_patcher_03.02.44.10_dji_system.bin
set fw2=MavicPro_MPP_super_patcher_03.02.44.10_dji_system.bin
cls
wget %fw% || goto error
copy *.bin ..
del *.bin
cd ..
cd Super-Tools-%branch%
echo %vt%
echo %AC%
echo %stock%
echo %fc%
call mpspk_verify.cmd

:SPK
@echo off
cls
set AC=Spark
set fc=3.02.43.09
set stock=1.00.0900 
set vt=1
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/Spark_Super_Patcher_FC/Spark_Super-Patcher_306_03.02.43.09_dji_system.bin
set fw2=Spark_Super-Patcher_306_03.02.43.09_dji_system.bin
cls
wget %fw% || goto error
copy *.bin ..
del *.bin
cd ..
cd Super-Tools-%branch%
echo %vt%
echo %AC%
echo %stock%
echo %fc%
call mpspk_verify.cmd

:p4p
@echo off
cls
set AC=P4P
set fc=3.02.44.31
set stock=1.05.0600  
set vt=2
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4P_Super-Patcher_FC/P4P_wm331_Super_Patcher_0306_03.02.44.31_dji_system.bin
set fw2=P4P_wm331_Super_Patcher_0306_03.02.44.31_dji_system.bin
cls
wget %fw% || goto error
copy *.bin ..
del *.bin
cd ..
cd Super-Tools-%branch%
echo %vt%
echo %AC%
echo %stock%
echo %fc%
call phantom_verify.cmd

:p4a
@echo off
cls
set AC=P4A
set fc=3.02.35.32
set stock=01.00.0128
set vt=2
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4Advanced_Super_Patcher_FC/P4Advanced_wm332_Super_Patcher_FC_0306_03.02.35.32_dji_system.bin
set fw2=P4Advanced_wm332_Super_Patcher_FC_0306_03.02.35.32_dji_system.bin
cls
wget %fw% || goto error
copy *.bin ..
del *.bin
cd ..
cd Super-Tools-%branch%
echo %vt%
echo %AC%
echo %stock%
echo %fc%
call phantom_verify.cmd

:p4s
@echo off
cls
set AC=P4Standard
set fc=3.02.44.33
set stock=2.00.0700 
set vt=2
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4Standard_Super_Patcher_FC/P4Standard_wm330_0306_03.02.44.33_Super_Patcher_dji_system.bin
set fw2=P4Standard_wm330_0306_03.02.44.33_Super_Patcher_dji_system_.bin
cls
wget %fw% || goto error
copy *.bin ..
del *.bin
cd ..
cd Super-Tools-%branch%
echo %vt%
echo %AC%
echo %stock%
echo %fc%
call phantom_verify.cmd

:P4Pv2
cls 
set AC=P4Pv2
set fc=3.03.04.35
set stock=1.00.1500
set vt=2
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4Pv2_FLIGHT_CONTROLLERS/P4PV2_Super_Patcher_FC/P4PV2_wm335_Super_Patcher_0306_03.03.04.35_dji_system.bin
set fw2=P4PV2_wm335_Super_Patcher_0306_03.03.04.35_dji_system.bin
cls
wget %fw% || goto error
copy *.bin ..
del *.bin
cd ..
cd Super-Tools-%branch%
echo %vt%
echo %AC%
echo %stock%
echo %fc%
call phantom_verify.cmd

:Error
cls
cd ..
Echo -----------------------------------------------------------------------------------------------------
ECHO SUPER-PATCHER Error Handling Wizard %appver%
echo By Brett8883
Echo -----------------------------------------------------------------------------------------------------

ECHO ERROR CODE 
echo %appver%-%ac%-%fw-%error%-whichAC
echo %DATE%-%appver%-%ac%-%fw-%error%-whichAC >> errorlog.txt
echo COULD NOT REACH ADDRESS TO DOWLOAD FC FOR %AC%
ECHO.
Echo Hey woah there's a problem...
echo.
echo Best I can tell it's because you don't have internet access. 
ECHO.
echo Keep in mind I am do NOT have the ability to dynamically diagnose errors but something isn't right
echo. 
echo Usually you will see this error when there is no internet access 
echo. 
echo Check your conntection and restart the Super-Patcher process
echo. 
echo If you are running windows in a VM 
echo please ensure the VM has internet or just use a real windows machine
echo. 
echo If you are using a Mac be sure you are running it in Bootcamp mode to work properly with Super Patcher 
echo. 
echo If all else fails you can manually download the file from %fw% and then ignore this error
echo. 
echo Sorry there! 
cd Super-Tools-%branch%
ECHO. 
echo Would you like to ignore this error?
ECHO	1) Yes ignore and continue
ECHO	2) no, exit
ECHO.
choice /C 12 /D 1 /T 99 /M "Please select connected device"
If Errorlevel 2 goto exit 
If Errorlevel 1 goto errorloopback

:errorloopback 
if "%vt%"=="1" call mpspk_verify.cmd
if "%vt%"=="2" call call phantom_verify.cmd
