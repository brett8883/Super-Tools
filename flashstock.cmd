@echo off
cls
call header.bat
cd %sppath%
if exist %stockfw% (goto flash) else (goto download)

:download
cd %stpath%
echo Please Wait while I download %stockfw%. 
Echo.
echo When it's ready it will be in %sppath%
wget %stockdl%
copy %stockfw% ..
del %stockfw%
cd ..
goto flash

:flash
cd %stpath%
cls
call header.bat
echo Turn on your aircraft and connect it to your PC. When it has fully started and connected to this PC, please continue.
pause
cls
call header.bat
echo Please press "load firmware" in Dumldore and choose the %stockfw% file
echo. 
echo which is in your super patcher folder at %sppath%
echo.
echo Then press "flashfirmware" in Dumldore
ECHO.
ECHO.
ECHO Once Dumldore says its ok to reboot, please reboot the aircraft and then continue to be taken back to the Main Menu
ECHO.
cd %ddpath%
start dumldorev3.exe
pause
cd %stpath%
call mainmmenu.cmd







