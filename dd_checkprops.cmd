@Echo off
title Super-Patcher 2.0 for %AC%
:dummy_verify_step
set fork=0
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
Pause
cls
call %header%
echo.
echo.
Echo Checking Aircraft PROPERTIES please wait...
ECHO.
echo. >> %log%
echo AIRCRAFT PROPERTIES: >> %log%
echo.
adb shell grep -i 'device id' /data/upgrade/backup/*.cfg.sig > devicetmp.txt
for /f "tokens=1-3 delims==>" %%A in (devicetmp.txt) do (set device=%%B)
adb shell grep -i 'firmware formal' /data/upgrade/backup/*.cfg.sig > firmwaretmp.txt
for /f "tokens=1-2 delims==>" %%A in (firmwaretmp.txt) do (set cfirmware=%%B)
adb shell grep -i '0306' /data/upgrade/backup/*.cfg.sig > FCtmp.txt
for /f "tokens=4-5 delims== " %%A in (fctmp.txt) do (set curFC=%%B)
  :: Remove quotes
   SET device=###%device%###
   SET device=%device:"###=%
   SET device=%device:###"=%
   SET device=%device:###=%
echo %device% >> %log%
 :: Remove quotes
   SET cfirmware=###%cfirmware%###
   SET cfirmware=%cfirmware:"###=%
   SET cfirmware=%cfirmware:###"=%
   SET cfirmware=%cfirmware:###=%
echo %cfirmware% >> %log%
:: Remove quotes
   SET curFC=###%curFC%###
   SET curFC=%curFC:"###=%
   SET curFC=%curFC:###"=%
   SET curFC=%curFC:###=%
echo %curFC% >> %log%
del /f /q *tmp.txt
:checkfw
Echo Expecting firmware version #: %stock%
PING -n 2 127.0.0.1>nul
echo Aircraft reporting current firmware is %cfirmware%
PING -n 2 127.0.0.1>nul
if "%stock%"=="%cfirmware%" (goto fwmatch) ELSE (goto fwmm)

:fwmatch
echo.
Echo Success passed firmware check
Echo Success passed firmware check >> %log%
PING -n 3 127.0.0.1 > nul
goto checkfc


:fwmm
echo.
Echo ERROR Expected firmware for aircraft selected does not match the firmware the aircraft is reporting
Echo ERROR Expected firmware for aircraft selected does not match the firmware the aircraft is reporting >> %log%
Echo.
echo I would advise going back to the main menu and flashing the correct stock firmware first!
echo.
echo Would you like to go back to the Main Menu, or ignore this error and continue?
Echo.
echo Reccomended [1] Take me back to Main Menu
echo             [2] Ingnore this error and continue
echo.
choice /c 12 /m "Make a selection with keyboard"
if errorlevel 2 goto checkfc & echo User chose to Ignore FW error and continue >> %log%
if errorlevel 1 goto mainmenu

:checkfc
echo.
Echo Checking flight controller#. Please wait...
echo.
PING -n 3 127.0.0.1 > nul
echo expected flight controller# is %ofc%
PING -n 2 127.0.0.1 > nul
echo current flight controller on aircraft is %curFC%
PING -n 3 127.0.0.1 > nul
if "%ofc%"=="%curfc%" goto fcmatch

:fcMM
Echo.
echo Expected flight controller number does not match the stock flight controller number for a %AC% on stock %stock% firmware
echo Expected flight controller number does not match the stock flight controller number for a %AC% on stock %stock% firmware >> %log%
echo.
echo This could just mean you have already installed a custom flight controller using Super-Patcher of FC_Patcher
echo   if this is the case you can ignore this error and continue, otherwise please flash stock %stock% firmware again
echo.
echo Did you use Super-Patcher or FC_Patcher to install your current flight controller?
echo.
echo         [Y] Yes, ignore this error
echo         [N] No, take me back so I can flash stock firware needed for Super-Patcher again
echo.
choice  /m "please make selection with keyboard"
if errorlevel 2 goto MainMenu & echo User chose to go back to mainmenu
if errorlevel 1 goto continue
:fcmatch
Echo Success^! Current Flight Controller matches expected stock Flight Controller^!
echo.
echo Starting Super-Patcher installation. Please Wait...
echo Starting Super-Patcher installation...>> %log%
PING -n 3 127.0.0.1 > nul
goto end

:continue
echo.
adb kill-server 2>>nul
taskkill /im adb.exe 2>>nul
cd %stpath%
goto end

:mainmenu
set fork=1
cd %stpath%
call mainmenu.cmd

:end
if "%fork%"=="1" (cd %stpath% & call mainmenu.cmd) ELSE (call dummy_bind.cmd)