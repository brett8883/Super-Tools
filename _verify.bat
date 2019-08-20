@Echo off
cls
cd tools
title Super-Patcher
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver% for %AC%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
ECHO PLEASE TAKE CARE TO FOLLOW INSTRUCTIONS EXACTLY
ECHO GO SLOW AND READ INSTRUCTIONS CAREFULLY BEFORE ACTING
ECHO DO NOT SKIP STEPS, DO NOT DO EXTRA STEPS
Echo *******************************************************************************************
pause
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver% for %AC%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
Echo Please turn on the %AC% and after it has fully started, connect to the PC
echo Continue when ready to begin
Echo *******************************************************************************************
Pause
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver% for %AC%
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
ECHO Super Patcher %appver% for %AC%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
:: Start Dummy Veify steps
Echo WORKING PLEASE WAIT...
echo.
::adb command 1
adb shell mount -o remount,rw /vendor 2> errorlog1.txt
echo adb shell mount -o remount,rw /vendor
PING -n 3 127.0.0.1>nul
type errorlog1.txt 2>>nul
PING -n 3 127.0.0.1>nul
echo.
echo DUMMY_VERIFY STEPS >> errorlog.txt
echo adb shell mount -o remount,rw /vendor >> errorlog.txt
type errorlog1.txt >>errorlog.txt
echo. >>errorlog.txt
::command2
adb shell mkdir /vendor/bin 2> errorlog2.txt
echo adb shell mkdir /vendor/bin
PING -n 3 127.0.0.1>nul
type errorlog2.txt 2>>nul
PING -n 3 127.0.0.1>nul
echo.
echo adb shell mkdir /vendor/bin >> errorlog.txt
type errorlog2.txt >> errorlog.txt
echo. >>errorlog.txt
::command3
echo adb push dummy_verify.sh /vendor/bin/
adb push dummy_verify.sh /vendor/bin/ 2> errorlog3.txt
PING -n 3 127.0.0.1>nul
type errorlog3.txt 2>>nul
PING -n 3 127.0.0.1>nul
echo.
echo adb push dummy_verify.sh /vendor/bin/ >>errorlog.txt
type errorlog3.txt >> errorlog.txt
echo. >>errorlog.txt
::command4
::This command splits on verify type or %vt%. Verify type is based on AC type so more specifically command 4 splits based on AC type
if "%vt%"=="1" (goto dummy1) ELSE (goto dummy2)
:dummy1
Echo dummy1 activated, verify type should be 1
echo Verify type is actually %vt%, because AC is %AC%
Echo dummy1 activated, verify type is %vt%. AC is %AC% >> Errorlog.txt
echo.
PING -n 3 127.0.0.1>nul
adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /sbin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd / 2> errorlog4.txt
echo adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /sbin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd /
PING -n 3 127.0.0.1>nul
type errorlog4.txt 2>>nul
PING -n 3 127.0.0.1>nul
echo adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /sbin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd / >> errorlog.txt
type errorlog4.txt >> errorlog.txt
echo. >>errorlog.txt
goto dumend

:dummy2
Echo dummy2 activated, verify type should be 2.
echo Verify type is actually %vt%, because AC is %AC%
echo.
Echo dummy2 activated, verify type is %vt%. AC is %AC% >> errorlog.txt
adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /system/bin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd / 2> errorlog4.txt
echo adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /system/bin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd /
PING -n 3 127.0.0.1>nul
type errorlog4.txt 2>>nul
PING -n 3 127.0.0.1>nul
echo.
echo adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /system/bin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd / >> errorlog.txt
type errorlog4.txt >> errorlog.txt
echo. >>errorlog.txt
goto dumend

::both command 4 subscripts merge back for command 5
:dumend
::command5
echo.
adb shell mount -o remount,ro /vendor 2> errorlog5.txt
echo adb shell mount -o remount,ro /vendor
PING -n 3 127.0.0.1>nul
type errorlog5.txt
PING -n 3 127.0.0.1>nul
echo.
echo adb shell mount -o remount,ro /vendor >> errorlog.txt
type errorlog5.txt >> errorlog.txt
echo.
adb kill-server 2>>nul
echo Continue when ready
echo.
pause
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver% for %AC%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
Echo please restart your aircraft
echo Allow the aircraft to fully restart then reconnect to the PC
echo Once fully restarted and connected please continue
Echo *******************************************************************************************
pause
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver% for %AC%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
echo click "Enable ADB" in DUMLdore and then close DUMLdore before proceeding
start DUMLdoreV3.exe
Echo *******************************************************************************************
Pause
cls
::Start Bind Step
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver% for %AC%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
ECHO WORKING. PLEASE WAIT...
echo.
if "%vt%"=="2" (goto bind2) ELSE (goto bind1)

::bind step splits based on verify type or %vt%. Verify type is based on AC type so more specifically bind step splits based on AC type
:bind2
Echo Bind2 activated, verify type should be 2
echo Verify type is actually %vt% because AC is %AC%
echo.
Echo Bind1 activated, verify type should be 2 >> errorlog.txt
echo Verify type is actually %vt% because AC is %AC% >> errorlog.txt
echo adb shell mount -o bind /vendor/bin/dummy_verify.sh /system/bin/dji_verify
adb shell mount -o bind /vendor/bin/dummy_verify.sh /system/bin/dji_verify 2> errorlog6.txt
echo adb shell mount -o bind /vendor/bin/dummy_verify.sh /system/bin/dji_verify >> errorlog6.txt
PING -n 3 127.0.0.1>nul
type errorlog6.txt
PING -n 3 127.0.0.1>nul
type errorlog6.txt >> errorlog.txt
adb kill-server 2>>nul
echo.
goto bindend

:bind1
::Declare verify bind selection and why with vt and AC. Add to errorlog
Echo Bind1 activated, verify type should be 1
echo Verify type is actually %vt% because AC is %AC%
echo.
Echo Bind1 activated, verify type should be 1 >> errorlog.txt
echo Verify type is actually %vt% because AC is %AC% >> errorlog.txt
adb shell mount -o bind /vendor/bin/dummy_verify.sh /sbin/dji_verify 2> errorlog6.txt
echo adb shell mount -o bind /vendor/bin/dummy_verify.sh /sbin/dji_verify >> errorlog6.txt
echo adb shell mount -o bind /vendor/bin/dummy_verify.sh /sbin/dji_verify
PING -n 3 127.0.0.1>nul
type errorlog6.txt
PING -n 3 127.0.0.1>nul
type errorlog6.txt >> errorlog.txt
adb kill-server 2>>nul
echo.
goto bindend

:bindend

Echo continue when ready
echo.
Pause
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver% for %AC%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
echo DO NOT TURN OFF AIRCRAFT!
Echo *******************************************************************************************
echo 1. Please click "Load Firmware" button in DUMLdore
echo.
echo 2. Choose the file %fw2%
echo  NOTE: I put this file in your Super-Patcher folder next to the auto_install.bat
echo.
ECHO 3. Then click "Flash Firmware" in DUMLdore
echo.
ECHO -------------------------------------------------------------------------------------------
ECHO 4.	Please allow DUMLdore to flash to the aircraft
echo	Do not disconnect the %AC% until DUMLdore says it is ok to
echo.
echo NOTE: The progress bar in DUMLdore might be irratic.
echo    Progress bar may go past 100 or seem like it hangs at 100
echo.
echo NOTE: Aircraft will restart automatically at least once during the process if the proceeding
echo   steps where successful.
echo.
echo NOTE: The flashing process should take at least 1 minute and at most 5 minutes
echo.
echo NOTE: If dumldore gets stuck at the "transfering" stage for more than a minute
echo  close DUMLdore turn of Aircraft remove battery for 5 minutes and resater Super-Patcher
ECHO -------------------------------------------------------------------------------------------
echo.
echo 5. Once DUMLdore is finished please close DUMLdore and then restart the aircraft
echo.
echo NOTE: It is still neccessary to restart the Aircraft manually
echo  even though it rebooted automatically during the flashing process
Echo.
echo 6. Once aircraft has rebooted fully and connected to this PC. Please continue
echo.
start DUMLdoreV3.exe
ECHO -------------------------------------------------------------------------------------------
pause
cls
Call jkson_verify.bat
