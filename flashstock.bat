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
ECHO	1) Mavic Pro 1 / Mavic Platinum / Mavic Artic White
ECHO	2) Spark
ECHO	3) Phantom 4 Pro
ECHO	4) Phantom 4 Standard
ECHO	5) Phantom 4 Advanced
ECHO	6) Phantom 4 Pro V2
ECHO	7) Inspire 2
ECHO.
choice /C 1234567 /D 1 /T 99 /M "Please select connected device"
If Errorlevel 7 goto I2
If Errorlevel 6 goto P4Pv2
If Errorlevel 5 goto p4a
If Errorlevel 4 goto p4s
If Errorlevel 3 goto p4p
If Errorlevel 2 goto SPK
If Errorlevel 1 goto MP

:i2
cls
call header.bat 
ECHO Super-Patcher does not support I2 at this time. If you'd like to flash a fw for I2 you can do so by launching dumldore from the Main Menu...
Echo. I'll take you back now 
timeout 6
call mainmenu.cmd

:MP
cd ..
wget http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Mavic%20Pro%201%20-%20Incl%20Platinum%20and%20Alpine/V01.04.0300_Mavic_dji_system.bin
set stockfw=V01.04.0300_Mavic_dji_system.bin
goto flash

:SPK
cd..
wget http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Spark/V01.00.0900_Spark_dji_system.bin
set stockfw=V01.00.0900_Spark_dji_system.bin
goto flash

:p4p
cd ..
wget http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Phantom%204%20Professional/V01.05.0600_P4P_dji_system.tar
set stockfw=V01.05.0600_P4P_dji_system.tar
goto flash

:p4a
cd ..
wget http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Phantom%204%20Advanced/V01.00.0128_P4A_dji_system.bin
set stockfw=V01.00.0128_P4A_dji_system.bin
goto flash

:p4s
cd ..
wget http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Phantom%204%20Standard/V02.00.0700_P4_dji_system.bin
set stockfw=V02.00.0700_P4_dji_system.bin
goto flash


:P4Pv2
cls
call header.bat
cd ..
Echo At this time Super-Patcher supports P4Pv2 on fw version V01.00.1500 and also has beta support for fw V01.00.2200
ECHO.
ECHO Which fw version would you like to flash?
ECHO.
ECHO         [1]V01.00.1500
ECHO         [2]V01.00.2200 *beta*
choice /C 12 /D 1 /T 99 /M "Please the fw version"
If Errorlevel 2 wget http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Phantom%204%20Pro%202.0/V01.00.2200_P4PV2_dji_system.bin & set stockfw=V01.00.2200_P4PV2_dji_system.bin
If Errorlevel 1 wget http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Phantom%204%20Pro%202.0/V01.00.1500_P4PV2_dji_system.bin & set stockfw=V01.00.1500_P4PV2_dji_system.bin
goto flash

:flash
cls
cd cd Super-Tools-%branch%
call header.bat
Echo Please turn on your aircraft and connect it to this PC. Once the Aircraft is connected and has fully started up please continue...
pause
cls
call header.bat
cd tools
start dumldorev3.exe
In DULMdore please press "LOAD FIRMWARE" and navigate to the Super-Patcher folder where you will find the file %Stockfw%
Echo Please select %Stockfw% and then click "FLASH FIRMWARE" in DUMLdore.
echo.
ECHO It is expected for this process to take some time. Please do not disconnect or turn off your aircraft untill DULMdore says its ok to. 
ECHO. 
ECHO You should repeat this process for a second time before starting Super-Patcher. 
echo. 
echo Pressing any key to continue once you have completed the flashing process and have closed DUMLdore to return to the Main Menu
cd ..
cls
call mainmenu.bat


:Error
cls
cd ..
Echo -----------------------------------------------------------------------------------------------------
ECHO SUPER-PATCHER Error Handling Wizard %appver%
echo By Brett8883
Echo -----------------------------------------------------------------------------------------------------

ECHO ERROR CODE 
echo %appver%-%ac%-%fw-%error%-whichAC
echo %DATE%-%appver%-%ac%-%fw-%error%-whichAC >> errorlog.txt
echo COULD NOT REACH ADDRESS TO DOWLOAD FC FOR %AC%
ECHO.
Echo Hey woah there's a problem...
echo.
echo Best I can tell it's because you don't have internet access. 
ECHO.
echo Keep in mind I am do NOT have the ability to dynamically diagnose errors but something isn't right
echo. 
echo Usually you will see this error when there is no internet access 
echo. 
echo Check your conntection and restart the Super-Patcher process
echo. 
echo If you are running windows in a VM 
echo please ensure the VM has internet or just use a real windows machine
echo. 
echo If you are using a Mac be sure you are running it in Bootcamp mode to work properly with Super Patcher 
echo. 
echo If all else fails you can manually download the file from %fw% and then ignore this error
echo. 
echo Sorry there! 
cd Super-Tools-%branch%
ECHO. 
echo Would you like to ignore this error?
ECHO	1) Yes ignore and continue
ECHO	2) no, exit
ECHO.
choice /C 1234567 /D 1 /T 99 /M "Please select connected device"
If Errorlevel 2 goto exit 
If Errorlevel 1 goto errorloopback

:errorloopback 
if "%vt%"=="1" call mpspk_verify.bat
if "%vt%"=="2" call phantom_verify.bat