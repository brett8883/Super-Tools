@Echo off
title Super-Patcher 2.0 for %AC%
:dummy_verify_step
echo starting dummy_verify_step >> %log%
cls
cd %tpath%
cls
call %header%
ECHO PLEASE TAKE CARE TO FOLLOW INSTRUCTIONS EXACTLY 
ECHO GO SLOW AND READ INSTRUCTIONS CAREFULLY BEFORE ACTING 
ECHO DO NOT SKIP STEPS, DO NOT DO EXTRA STEPS
Echo ****************************************************************************************************************************************************************
pause
cls
call %header%
Echo Please turn on the %AC% and after it has fully started, connect to the PC
echo.
echo Continue when ready to begin
Echo ****************************************************************************************************************************************************************
Pause
cls
call %header%
Echo Please ensure DUMLdore says you are on firmware %stock% and that this is stock version 
echo. 
echo Then click "Enable ADB" in DUMLdore and wait for ADB to enable 
Echo The front lights will usually flash, turn on, or turn off
echo.
echo then close DUMLdore
Echo. 
Echo Continue once ADB has been enabled and DUMLdore is closed
start %dumldore%
Echo ***************************************************************************************************************************************************************
pause
cls
call header.bat
Echo WORKING PLEASE WAIT... 
adb shell mount -o remount,rw /vendor && Echo Success making vendor read and write
adb shell mkdir /vendor/bin && Echo Success making directory vendor/bin
adb push dummy_verify.sh /vendor/bin/ && echo Success pushing dummy_verify to %ac%
if "%vt%"=="1" (goto dummy1) else (goto dummy2)

:dummy1
echo dummy1 engaged based on verify type is %AC% %vt%
echo dummy1 engaged based on AC type is %AC% %VT%>> %log%
adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /sbin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd / && echo Success activating dummy_verify.sh
echo dummy_verify step complete >> %log%
goto enddummy

:exit
cd %stpath%
call mainmenu
exit

:dummy2
echo dummy2 engaged based on AC type is %AC% verify type is %vt%
echo dummy2 engaged based on AC type is %AC% verify type is %VT%>> %log%
adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /system/bin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd / && echo Success activating dummy_verify.sh
echo phantom dummy_verify step complete >> %log%
goto enddummy

:enddummy
adb shell mount -o remount,ro /vendor && echo Success making vendor read only again. Aircraft requires reboot. Please wait to return to program
echo STILL WORKING... Just a sec
adb kill-server 2>>nul
PING -n 5 127.0.0.1>nul
cls
call %header%
Echo Please restart your aircraft
Echo.
echo Allow the aircraft to fully restart then reconnect to the PC
echo.
echo Once fully restarted and connected please continue
echo.
Echo ****************************************************************************************************************************************************************
pause

:bind
cls
call %header%
echo Starting bind step... >> %log%
echo Starting bind step...
PING -n 3 127.0.0.1>nul
cls
call %header%
echo click "Enable ADB" in DUMLdore and then close DUMLdore before proceeding
start %dumldore%
Echo ***************************************************************************************************************************************************************
Pause
cls
call %header%
ECHO WORKING. PLEASE WAIT...
if "%vt%"=="1" (goto bind1) else (goto bind2)

:bind1
echo bind1 engaged based on AC type is %AC%, verify type is %vt%
echo bind1 engaged based on AC type is %AC%, verify type is %vt% >> %log%
adb shell mount -o bind /vendor/bin/dummy_verify.sh /sbin/dji_verify && echo Bind step completed successfully & PING -n 2 127.0.0.1>nul
goto endbind

:bind2
echo bind2 engaged based on AC type is %AC%, verify type is %vt%
echo bind2 engaged based on AC type is %AC%, verify type is %vt% >> %log%
adb shell mount -o bind /vendor/bin/dummy_verify.sh /system/bin/dji_verify && echo Bind step completed successfully & PING -n 2 127.0.0.1>nul
goto endbind

:endbind
PING -n 3 127.0.0.1>nul
adb kill-server 2>>nul
echo Start flash step >> %log%
cls
call %header%
echo Starting flash step...
PING -n 2 127.0.0.1>nul
cls
call %header%
echo ***DO NOT TURN OFF AIRCRAFT!***
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
echo 1. Please click "Load Firmware" button in DUMLdore 
echo.
echo 2. Choose the file %fw2%
echo.  
ECHO 3. Then click "Flash Firmware" in DUMLdore
echo.
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO 4. Please allow DUMLdore to flash to the aircraft.  
echo Flashing progress bar may go above 100% and Spark ESCs may chirp. This is normal and a good sign. If successful %AC% will reboot itself 1 or more times-
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
echo **Do not disconnect the %AC% until DUMLdore says it is ok to!**
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
echo. 
echo 5. Once DUMLdore is finished and says its ok to reboot the aicraft, please restart the aircraft
Echo 
Echo.
echo 6. Once aircraft has restarted fully and connected to PC. Please continue
echo.
PING -n 2 127.0.0.1>nul
start %dumldore%
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
pause
cls 
echo dummy_bind complete >> %log%
Call jkson.cmd
