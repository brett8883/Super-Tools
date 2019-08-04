@echo off
title <Super-Patcher 2.0 DownloadFC>
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
if "%AC%"=="MavicPro" goto mpspk
if "%AC%"=="Spark" goto mpspk
if "%AC%"=="P4P" goto phantom
if "%AC%"=="P4A" goto phantom
if "%AC%"=="P4Standard" goto phantom
if "%AC%"=="P4Pv2" goto mpspk

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

:mpspk
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

:phantom
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

