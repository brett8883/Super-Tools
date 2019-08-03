@Echo off
:main
cls
cd ..
Echo STARTED-Phantm_Verify_for_%AC% >> log.txt
echo %DATE%_%TIME% >> log.txt
cd Super-Tools-%branch%
cd tools
cls
Echo *****************************************************************************************************
Echo Phantom Verify
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
Echo Phantom Verify
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
Echo Phantom Verify
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo Please ensure DUMLdore says you are on firmware %stock% and that this is stock version 
echo. 
echo Then click "Enable ADB" in DUMLdore and wait for ADB to fully enable 
echo.
echo then close DUMLdore
Echo. 
Echo Continue once ADB has been enabled and DUMLdore is closed
start DUMLdoreV3.exe || goto errorduml
Echo *****************************************************************************************************
pause
:P4verify
cls
Echo *****************************************************************************************************
Echo Phantom Verify
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo WORKING PLEASE WAIT... 
adb shell mount -o remount,rw /vendor || goto error1
adb shell mkdir /vendor/bin
adb push dummy_verify.sh /vendor/bin/
adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /system/bin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd /
adb shell mount -o remount,ro /vendor || goto error1
adb kill-server
if %errorlevel%==0 echo P4 dummy_verify.sh step success!
timeout 3
cls
Echo *****************************************************************************************************
Echo Phantom Verify
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
Echo Phantom Verify
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo click "Enable ADB" in DUMLdore and then close DUMLdore before proceeding
start DUMLdoreV3.exe || goto errorduml
Echo *****************************************************************************************************
Pause
cls
Echo *****************************************************************************************************
Echo Phantom Verify
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************

ECHO WORKING PLEASE WAIT...
adb shell mount -o bind /vendor/bin/dummy_verify.sh /system/bin/dji_verify || goto error2
if %errorlevel%==0 echo %AC% BIND STEP SUCCESS!
cd ..
cd ..
echo %AC% BIND STEP SUCCESS >> log.txt
echo %DATE%_%TIME% >> log.txt
cd Super-Tools-%branch%
cd tools
adb kill-server
timeout 5
cls
Echo *****************************************************************************************************
Echo Phantom Verify
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
start DUMLdoreV3.exe || goto errorduml
Echo *****************************************************************************************************
pause
cls 
Call jkson_verify.bat

:error2
adb kill-server
cd ..
cd ..
echo ERROR_CODE_P4VFY-2_UNABLE_TO REACH_AIRCRAFT_VIA_ADB_AT_BIND_STEP >> log.txt
echo %DATE%_%TIME% >> log.txt
echo ERROR_CODE_P4VFY-2_UNABLE_TO REACH_AIRCRAFT_VIA_ADB_AT_BIND_STEP >> errorlog.txt
echo %DATE%_%TIME% >> errorlog.txt
cd Super-Tools-%branch%
cd tools
cls 
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER Error handling Wizard %appver% 
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo ERROR_CODE_P4VFY-2_UNABLE_TO REACH_AIRCRAFT_VIA_ADB_AT_BIND_STEP
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
cd ..
cd ..
echo ERROR_P4VFY-1_UNABLE_TO_REACH_AIRCRAFT_VIA_ADB_%appver%_PTHVFY >> log.txt
echo %DATE%_%TIME% >> log.txt
echo ERROR_P4VFY-1_UNABLE_TO_REACH_AIRCRAFT_VIA_ADB_%appver%_PTHVFY >> errorlog.txt
echo %DATE%_%TIME% >> errorlog.txt
cd Super-Tools-%branch%
cd tools
cls 
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER Error handling Wizard %appver% 
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo ERROR CODE P4VFY-1 UNABLE TO REACH AIRCRAFT VIA ADB 
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

:errorduml
cd ..
cd ..
echo ERROR_COULD_NOT_OPEN_DUMLDORE_%appver%_PTHVFY >> log.txt
echo %DATE%_%TIME% >> log.txt
echo ERROR_COULD_NOT_OPEN_DUMLDORE_%appver%_PTHVFY >> errorlog.txt
echo %DATE%_%TIME% >> errorlog.txt
cd Super-Tools-%branch%
cd tools
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER Error handling Wizard %appver% 
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo. 
Echo ERROR ERROR ERROR
echo.
echo ERROR CODE PTH_VRFY_%AC%_COULD_NOT_OPEN_DUMLDORE
ECHO. 
ECHO Whoops! Something is not right. Sorry about this!
echo. 
echo Super-Patcher tried to open DUMLdore but couldn't.
echo.  
echo Sometimes this is because DUMLdore was already running in the background or 
echo this computer is blocking it from opening.
echo. 
echo Check to make sure that DUMLdore is not already running by going to the task manager and end task for 
echo DUMLdore if it is running and then continue. 
echo. 
echo If you are running Windows in a vertual machine then there is a good chance the VM is not set up properly
echo. 
echo When you think you have solved the problem please restart the Super-Patcher process
pause
exit

