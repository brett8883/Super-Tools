@echo off
cls
call %header%
cd %Sppath%
md Stock_Firmware 2>>nul
cd Stock_Firmware
set sfwpath=%cd%
if exist %stockfw% (goto flash) else (goto download)

:download
echo Please Wait while I download %stockfw%. 
Echo.
echo When it's ready it will be in %sfwpath%
Echo.
echo.
%busybox% wget %stockdl%
goto flash

:flash
cls
call %header%
echo Turn on your aircraft and connect it to your PC. When it has fully started and connected to this PC, please continue.
pause
cls
call %header%
echo Please press "load firmware" in Dumldore and choose the %stockfw% file
echo. 
echo which is in your Super-Patcher folder at %sppath%
echo.
echo Then press "flashfirmware" in Dumldore
ECHO.
ECHO.
ECHO Once Dumldore says its ok to reboot, please reboot the aircraft and then continue to be taken back to the Main Menu
ECHO.
start %dumldore%
cd %stpath%
pause
call mainmmenu.cmd







