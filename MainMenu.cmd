@echo off
:mainmenu
title Super-Patcher 2.0
cls
call header.bat
echo "                                                    _  __  __  _ __  _   __ __ ___ __  _ _  _                                                                ";
echo "                                                   |  V  |/  \| |  \| | |  V  | __|  \| | || |                                                               ";
echo "                                                   | \_/ | /\ | | | ' | | \_/ | _|| | ' | \/ |                                                               ";
echo "                                                   |_| |_|_||_|_|_|\__| |_| |_|___|_|\__|\__/                                                                ";
Echo "                                                                                                                                                             ";
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO.
echo                             WHAT DO YOU WANT TO DO?
echo.
echo                                        SUPER-PATCHER
echo                                         **[1] Run Super-Patcher!**
echo                                           [2] Download ^& Flash stock firmware needed for Super-Patcher
echo.
echo                                        UTILITIES
echo                                           [3] Open DankDroneDownloader by CS2000 to download any other firmware files
echo                                           [4] Launch DULMdore by Jezzeb
echo                                           [5] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo                                           [6] Launch the free NoLimitDronez app
echo.
echo                                        ADVANCED
echo                                           [7] Enable ADB and open a new CMD Prompt into ADB
echo.
Choice /c 1234567 /M "Please make a section with keyboard"
if errorlevel 7 goto adb
If Errorlevel 6 goto NLD
If Errorlevel 5 goto jkson
If Errorlevel 4 goto dumldore
If Errorlevel 3 goto getDownloader
If Errorlevel 2 goto flashstock 
If Errorlevel 1 goto StartSP

:flashstock
call flashstock.cmd
goto mainmenu

:getDownloader
echo start getdownloaderMM >> %log%
cls
call %header%
cd %tpath%
if exist DankDroneDownloader.exe start DankDroneDownloader.exe & echo DDD exists >> %log% & goto mainmenu
Echo Hold on just a sec...
cd %tpath%
%busybox% wget https://github.com/cs2000/DankDroneDownloader/archive/master.zip 2> %log%
7za.exe e master.zip
start DankDroneDownloader.exe
del master.zip
del /f /q DankDroneDownloader-master
del /f /q ISSUE_TEMPLATE
del /f /q .wget-hsts
del /f /q *.md
cd %stpath%
goto mainmenu


:dumldore
start %dumldore%
goto mainmenu


:jkson
cls
if "%AC%=="MavicPro" goto startjkson
if "%AC%"=="P4PV2" (goto startjkson) else (goto sorryjkson)

:start jkson
call %header%
Echo Please turn on the %AC% and after it has fully started, connect to the PC
echo.
echo Continue when ready to begin
Echo ***************************************************************************************************************************************************************
pause
cls
call %header%
echo Click "Enable ADB" in DUMLdore and wait for ADB to enable 
Echo The front lights will usually flash, turn on, or turn off but not always
echo.
echo Then close DUMLdore
Echo. 
Echo Continue once ADB has been enabled and DUMLdore is closed
start %dumldore%
Echo ***************************************************************************************************************************************************************
pause
cls
cd %tpath%
call jkson_standalone.bat
adb kill-server 2>>nul
taskkill /im adb.exe 2>>nul
cd %stpath%
goto mainmenu

:sorryjkson
cls
call %header%
echo So sorry! 
echo Jkson FCC Mod is only availible for MavicPro and P4Pv2 right now
echo.
echo I will take you back to the main menu. Continue when ready
pause
goto mainmenu

:startSp 
cls
call variantchooser.cmd
goto mainmenu

:NLD
start %NLD%
goto mainmenu

:adb
cls
call %header%
Echo Please turn on the %AC% and after it has fully started, connect to the PC, then continue
echo.
echo Continue when ready to begin
Echo ****************************************************************************************************************************************************************
Pause
cls
call %header%
echo Then click "Enable ADB" in DUMLdore and wait for ADB to enable
echo.
Echo The front lights will sometimes flash, turn on, or turn off but not always 
Echo. 
Echo Continue once ADB has been enabled and DUMLdore is closed
start %dumldore%
echo.
Echo ****************************************************************************************************************************************************************
pause
cd %tpath%
start cmd /k adb shell
cd %stpath%
echo Continue to be taken back to the main menu
echo.
pause
taskkill /im adb.exe 2>>nul
adb kill-server 2>>nul
goto mainmenu