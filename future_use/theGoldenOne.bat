@echo off
Echo checking Aircraft version please wait...
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
echo %device%
 :: Remove quotes
   SET cfirmware=###%cfirmware%###
   SET cfirmware=%cfirmware:"###=%
   SET cfirmware=%cfirmware:###"=%
   SET cfirmware=%cfirmware:###=%
echo %cfirmware%
:: Remove quotes
   SET curFC=###%curFC%###
   SET curFC=%curFC:"###=%
   SET curFC=%curFC:###"=%
   SET curFC=%curFC:###=%
echo %curFC%
del /f /q *tmp.txt
:checkfw
Echo Expecting firmware version #: %stock%
PING -n 3 127.0.0.1>nul
echo Aircraft reporting current firmware is %cfirware%
PING -n 3 127.0.0.1>nul
if "%stock%"=="%cfirmware%" (goto checkFC) ELSE (goto fwmm)

:fwmm
Echo ERROR Expected firmware for aircraft selected does not match the firmware the aircraft is reporting
Echo.
echo I would advise going back to the main menu and flashing the correct stock firmware first!
echo.
echo Would you like to go back to the Main Menu, or ignore this error and continue?
Echo.
echo [1] Take me back to Main Menu
echo [2] Ingnore this error and continue
echo.
choice /c 12 /m "Make a selection with keyboard"
if errorlevel 2 goto checkfc
if errorlevel 1 goto end

:checkfc
set exitdummystep=0

:end
set exitdummystep=1

