@Echo off
title Super-Patcher 2.0 for %AC%
:main
cls
Echo STARTED-mpspk_for_%AC% >> log.txt
echo %DATE%_%TIME% >> log.txt
cd %tpath%
cls
echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
echo mpspk for %AC%
echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
call header.bat
ECHO PLEASE TAKE CARE TO FOLLOW INSTRUCTIONS EXACTLY 
ECHO GO SLOW AND READ INSTRUCTIONS CAREFULLY BEFORE ACTING 
ECHO DO NOT SKIP STEPS, DO NOT DO EXTRA STEPS
Echo ****************************************************************************************************************************************************************
pause
cls
call header.bat
Echo Please turn on the %AC% and after it has fully started, connect to the PC
echo.
echo Continue when ready to begin
Echo ****************************************************************************************************************************************************************
Pause
cls
call header.bat
Echo Please ensure DUMLdore says you are on firmware %stock% and that this is stock version 
echo. 
echo Then click "Enable ADB" in DUMLdore and wait for ADB to enable 
Echo The front lights will usually flash, turn on, or turn off
echo.
echo then close DUMLdore
Echo. 
Echo Continue once ADB has been enabled and DUMLdore is closed
cd %ddpath%
start DUMLdoreV3.exe
cd %tpath%
Echo ***************************************************************************************************************************************************************
pause
cls
call header.bat
Echo WORKING PLEASE WAIT... 
adb shell mount -o remount,rw /vendor && Echo Success making vendor read and write & sleep 1
adb shell mkdir /vendor/bin && Echo Success making directory vendor/bin & sleep 1
adb push dummy_verify.sh /vendor/bin/ && echo Success pushing dummy_verify to %ac% & sleep 1
adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /sbin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd / && echo Success activating dummy_verify.sh & sleep 1
adb shell mount -o remount,ro /vendor && echo Success making vendor read only again. Aircraft requires reboot. Please wait to return to program
adb kill-server 2>> errorlog.txt
sleep 3
cls
call header.bat
Echo Please restart your aircraft
Echo.
echo Allow the aircraft to fully restart then reconnect to the PC
echo.
echo Once fully restarted and connected please continue
pause
cls
:bind
call header.bat
echo Starting bind step...
sleep 2
cls
call header.bat
echo click "Enable ADB" in DUMLdore and then close DUMLdore before proceeding
cd %ddpath%
start DUMLdoreV3.exe || goto errorduml
cd %tpath%
Echo ***************************************************************************************************************************************************************
Pause
cls
call header.bat
ECHO WORKING. PLEASE WAIT...
adb shell mount -o bind /vendor/bin/dummy_verify.sh /sbin/dji_verify && echo Bind step completed successfully & sleep 2
adb kill-server 2>> null
del /f /s null
cls
call header.bat
echo Starting flash step...
sleep 2
cls
call header.bat
echo ***DO NOT TURN OFF AIRCRAFT!***
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
echo 1. Please click "Load Firmware" button in DUMLdore 
echo. 
echo 2. Choose the file %fw2%
echo.  
ECHO 3. Then click "Flash Firmware" in DUMLdore
echo.
Echo ****************************************************************************************************************************************************************
ECHO 4.	Please allow DUMLdore to flash to the aircraft 
echo	Do not disconnect the %AC% until DUMLdore says it is ok to
Echo ****************************************************************************************************************************************************************
echo. 
echo 5. Once DUMLdore is finished please restart the aircraft
Echo 
Echo.
echo 6. Once aircraft has restarted fully and connected to PC. Please continue
echo.
cd %ddpath%
start DUMLdoreV3.exe
cd %tpath%
pause
cls 
Call jkson_verify.bat