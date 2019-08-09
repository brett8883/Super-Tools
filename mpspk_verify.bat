@Echo off
cls
cd tools
title Super-Patcher
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
ECHO PLEASE TAKE CARE TO FOLLOW INSTRUCTIONS EXACTLY 
ECHO GO SLOW AND READ INSTRUCTIONS CAREFULLY BEFORE ACTING 
ECHO DO NOT SKIP STEPS, DO NOT DO EXTRA STEPS
Echo *******************************************************************************************
pause
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
Echo Please turn on the %AC% and after it has fully started, connect to the PC
echo Continue when ready to begin
Echo *******************************************************************************************
Pause
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
Echo Please ensure DUMLdore says you are on firmware %stock% and that this is stock version 
echo. 
echo Then click "Enable ADB" in DUMLdore and wait for ADB to enable 
Echo The front lights will usually flash, turn on, or turn off
echo.
echo then close DUMLdore
Echo. 
Echo Continue once ADB has been enabled and DUMLdore is closed
start DUMLdoreV3.exe
Echo *******************************************************************************************
pause
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
Echo WORKING PLEASE WAIT...
adb shell mount -o remount,rw /vendor 2>> %sp%\logs\errorlog.txt
adb shell mkdir /vendor/bin 2>> %sp%\logs\errorlog.txt
adb push dummy_verify.sh /vendor/bin/ 2>> %sp%\logs\errorlog.txt
adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /sbin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd / 2>>  %sp%\logs\errorlog.txt
adb shell mount -o remount,ro /vendor 2>>  %sp%\logs\errorlog.txt
adb kill-server
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
Echo please restart your aircraft
echo Allow the aircraft to fully restart then reconnect to the PC
echo Once fully restarted and connected please continue
Echo *******************************************************************************************
pause
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
echo click "Enable ADB" in DUMLdore and then close DUMLdore before proceeding
start DUMLdoreV3.exe
Echo *******************************************************************************************
Pause
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
ECHO WORKING. PLEASE WAIT...
adb shell mount -o bind /vendor/bin/dummy_verify.sh /sbin/dji_verify 2>>  %sp%\logs\errorlog.txt
adb kill-server
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
echo DO NOT TURN OFF AIRCRAFT!
Echo *******************************************************************************************
echo 1. Please click "Load Firmware" button in DUMLdore 
echo. 
echo 2. Choose the file %fw2%
echo.  
ECHO 3. Then click "Flash Firmware" in DUMLdore
echo.
ECHO -------------------------------------------------------------------------------------------
ECHO 4.	Please allow DUMLdore to flash to the aircraft 
echo	Do not disconnect the %AC% until DUMLdore says it is ok to
ECHO -------------------------------------------------------------------------------------------
echo. 
echo 5. Once DUMLdore is finished please restart the aircraft
Echo.
echo 6. Once aircraft has restarted fully and connected to PC. Please continue
echo. 
start DUMLdoreV3.exe
ECHO -------------------------------------------------------------------------------------------
pause
cls 
Call jkson_verify.bat