@echo off 
cls
echo ===============================================================================================================================================================
echo "  /$$$$$$                                                  /$$$$$$$             /$$               /$$                                  /$$$$$$       /$$$$$$ ";
echo " /$$__  $$                                                | $$__  $$           | $$              | $$                                 /$$__  $$     /$$$_  $$";
echo "| $$  \__/ /$$   /$$  /$$$$$$   /$$$$$$   /$$$$$$         | $$  \ $$ /$$$$$$  /$$$$$$    /$$$$$$$| $$$$$$$   /$$$$$$   /$$$$$$       |__/  \ $$    | $$$$\ $$";
echo "|  $$$$$$ | $$  | $$ /$$__  $$ /$$__  $$ /$$__  $$ /$$$$$$| $$$$$$$/|____  $$|_  $$_/   /$$_____/| $$__  $$ /$$__  $$ /$$__  $$        /$$$$$$/    | $$ $$ $$";
echo " \____  $$| $$  | $$| $$  \ $$| $$$$$$$$| $$  \__/|______/| $$____/  /$$$$$$$  | $$    | $$      | $$  \ $$| $$$$$$$$| $$  \__/       /$$____/     | $$\ $$$$";
echo " /$$  \ $$| $$  | $$| $$  | $$| $$_____/| $$              | $$      /$$__  $$  | $$ /$$| $$      | $$  | $$| $$_____/| $$            | $$          | $$ \ $$$";
echo "|  $$$$$$/|  $$$$$$/| $$$$$$$/|  $$$$$$$| $$              | $$     |  $$$$$$$  |  $$$$/|  $$$$$$$| $$  | $$|  $$$$$$$| $$            | $$$$$$$$ /$$|  $$$$$$/";
echo " \______/  \______/ | $$____/  \_______/|__/              |__/      \_______/   \___/   \_______/|__/  |__/ \_______/|__/            |________/|__/ \______/ ";
echo "                    | $$                                                                                                                                     ";
echo "                    | $$               By Brett8883                                                                                                          ";
echo "                    |__/                                                                                                                                     ";
ECHO ===============================================================================================================================================================
ECHO. 
ECHO  Please choose your Aircraft
ECHO.
ECHO ----------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO    1) Mavic Pro 1 / Mavic Platinum / Mavic Artic White
ECHO    2) Spark
ECHO    3) Phantom 4 Pro
ECHO    4) Phantom 4 Standard
ECHO    5) Phantom 4 Advanced
ECHO	6) Phantom 4 Pro V2
Echo    7) Inspire 2
ECHO.
choice /C 1234567 /D 1 /T 99 /M "Please select connected device"
If Errorlevel 7 goto I2
If Errorlevel 6 goto P4Pv2
If Errorlevel 5 goto p4a
If Errorlevel 4 goto p4s
If Errorlevel 3 goto p4p
If Errorlevel 2 goto SPK
If Errorlevel 1 goto MP

:MP
cls
call header.bat
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Mavic%%20Pro%201%%20-%20Incl%%20Platinum%%20and%%20Alpine/V01.04.0300_Mavic_dji_system.bin
set stockfw=V01.04.0300_Mavic_dji_system.bin
wget %stockdl%
cls
call header.bat
echo Turn on your aircraft and connect it to your PC. When it has fully started and connected to this PC, please continue.
pause
cls
call header.bat
echo Please press "load firmware" in Dumldore and choose the %stockfw% file which is in your super patcher folder at %sppath%
echo.
echo Then press "flashfirmware" in Dumldore
cd %ddpath%
start dumldorev3.exe
pause
cd %stpath%
call mainmmenu.cmd







