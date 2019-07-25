@Echo off
cls
ECHO %AC% %DATE%-%TIME%-%mpspk% >> log.txt
cd tools
:main
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO PLEASE TAKE CARE TO FOLLOW INSTRUCTIONS EXACTLY 
ECHO GO SLOW AND READ INSTRUCTIONS CAREFULLY BEFORE ACTING 
ECHO DO NOT SKIP STEPS, DO NOT DO EXTRA STEPS
Echo *****************************************************************************************************
pause
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo Please turn on the %AC% and after it has fully started, connect to the PC
echo Continue when ready to begin
Echo *****************************************************************************************************
Pause
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo Please ensure DUMLdore says you are on firmware %stock% and that this is stock version 
echo. 
echo Then click "Enable ADB" in DUMLdore and wait for ADB to enable 
Echo The front lights will usually flash, turn on, or turn off
echo.
echo then close DUMLdore
Echo. 
Echo Continue once ADB has been enabled and DUMLdore is closed
start DUMLdoreV3.exe
Echo *****************************************************************************************************
pause
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo Start 
Echo WORKING PLEASE WAIT... 
adb shell mount -o remount,rw /vendor || goto error1
adb shell mkdir /vendor/bin || >> log.txt
adb push dummy_verify.sh /vendor/bin/ || >> log.txt
adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /sbin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd / || >>log.txt
adb shell mount -o remount,ro /vendor || goto error1
adb kill-server
if %errorlevel%==0 echo dummy_verify.sh step success!
timeout 5
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo please restart your aircraft
echo Allow the aircraft to fully restart then reconnect to the PC
echo Once fully restarted and connected please continue
pause
Echo *****************************************************************************************************
cls
:bind
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo click "Enable ADB" in DUMLdore and then close DUMLdore before proceeding
start DUMLdoreV3.exe
Echo *****************************************************************************************************
Pause
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO WORKING. PLEASE WAIT...
adb shell mount -o bind /vendor/bin/dummy_verify.sh /sbin/dji_verify || goto error2
if %errorlevel%==0 echo MPSK BIND STEP success!
adb kill-server
timeout 5
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo DO NOT TURN OFF AIRCRAFT!
Echo *****************************************************************************************************
echo 1. Please click "Load Firmware" button in DUMLdore 
echo. 
echo 2. Choose the file %fw2%
echo.  
ECHO 3. Then click "Flash Firmware" in DUMLdore
echo.
Echo ******************************************************************************************************
ECHO 4.	Please allow DUMLdore to flash to the aircraft 
echo	Do not disconnect the %AC% until DUMLdore says it is ok to
Echo ******************************************************************************************************
echo. 
echo 5. Once DUMLdore is finished please restart the aircraft
Echo 
Echo.
echo 6. Once aircraft has restarted fully and connected to PC. Please continue
echo. 
start DUMLdoreV3.exe
Echo *****************************************************************************************************
pause
cls 
Call jkson_verify.bat

:error2
adb kill-server
cls 
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER Error handling Wizard %appver% 
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo ERROR CODE MSPK-2 UNABLE TO REACH AIRCRAFT VIA ADB AT BIND STEP-%DATE%-%time%-%appver% >> log.txt
echo ERROR CODE MSPK-2 UNABLE TO REACH AIRCRAFT VIA ADB AT BIND STEP
echo.
echo HEY! WOAH! Sorry! There was an issue with that last step. 
echo. 
echo Best I can tell the aircraft is either not connected to this PC or 
echo that "Enable ADB" with DUMLdore didn't get done right
echo. 
ECHO Make sure the aircraft is connected and turned on then continue
echo I'll take you back to DUMLdore and we'll give it another go 
pause 
goto bind 
:error1
adb kill-server
cls 
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER Error handling Wizard %appver% 
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo ERROR CODE MSPK-1 UNABLE TO REACH AIRCRAFT VIA ADB_%date%_%time%_%appver% >> log.txt
Echo ERROR CODE MSPK-1 UNABLE TO REACH AIRCRAFT VIA ADB 
echo.
echo HEY! WOAH! Sorry! There was an issue with that last step. 
echo. 
echo Best I can tell the aircraft is either not connected to this PC or 
echo that "Enable ADB" with DUMLdore didn't get done right
echo. 
ECHO Make sure the aircraft is connected and turned on and then continue and 
echo I'll take you back to DUMLdore and we'll give it another go 
echo.
pause
goto main 