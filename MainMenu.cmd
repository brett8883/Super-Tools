@echo off
:mainmenu
cd %stpath%
cls
call %header%
echo " _  __  __  _ __  _   __ __ ___ __  _ _  _                                                                                                                   ";
echo "|  V  |/  \| |  \| | |  V  | __|  \| | || |                                                                                                                  ";
echo "| \_/ | /\ | | | ' | | \_/ | _|| | ' | \/ |                                                                                                                  ";
echo "|_| |_|_||_|_|_|\__| |_| |_|___|_|\__|\__/                                                                                                                   ";
Echo "                                                                                                                                                             ";
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO.
echo                             WHAT DO YOU WANT TO DO?
echo.
echo                                        SUPER-PATCHER
echo                                         **[1] Run Super-Patcher!**
echo                                           [2] Download ^& Flash the correct stock firmware needed for Super-Patcher
echo.
echo                                        UTILITIES
echo                                           [3] Launch DUMLdore by Jezzeb
echo                                           [4] Launch jkson fcc mod (Mavic, Spark, and P4Pv2 only) by jkson5
echo.
echo                                        ADVANCED
echo                                           [5] Enable ADB and open a new CMD Prompt into ADB
echo.
echo                                        EXIT
echo                                           [6] Exit DJI Super-Patcher
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
Choice /c 123456 /M "Please make a section with keyboard"
If Errorlevel 6 goto exit
If Errorlevel 5 goto adb
If Errorlevel 4 goto jkson
If Errorlevel 3 goto dumldore
If Errorlevel 2 goto flashstock
If Errorlevel 1 goto StartSP

:flashstock
call flashstock.cmd
goto mainmenu

:dumldore
call %dumldore%
goto mainmenu

:jkson
cls
if "%AC%"=="MavicPro" goto startjkson
if "%AC%"=="P4Pv2" goto startjkson
if "%AC%"=="Spark" goto startjkson
goto sorryjkson

:startjkson
call %header%
Echo Please turn on the %AC% and after it has fully started, connect to the PC
echo.
echo Continue when ready to begin
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
pause
cls
call %header%
echo Click "Enable ADB" in DUMLdore and wait for ADB to enable
Echo The front lights will usually flash, turn on, or turn off but not always
echo.
echo Then close DUMLdore
Echo.
Echo Continue once ADB has been enabled and DUMLdore is closed
call %dumldore%
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
pause
cls
cd %tpath%
call jksonmm.cmd
adb kill-server 2>>nul
taskkill /im adb.exe 2>>nul
cd %stpath%
goto mainmenu

:sorryjkson
cls
call %header%
echo So sorry!
echo Jkson FCC Mod is only availible for MavicPro,Spark and P4Pv2 right now
echo.
echo I will take you back to the main menu. Continue when ready
pause
goto mainmenu

:startSp
cls
call variantchooser.cmd
goto mainmenu

:adb
cls
call %header%
Echo Please turn on the %AC% and after it has fully started, connect to the PC, then continue
echo.
echo Continue when ready to begin
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
Pause
cls
call %header%
echo Then click "Enable ADB" in DUMLdore and wait for ADB to enable
echo.
Echo The front lights will sometimes flash, turn on, or turn off but not always
Echo.
Echo Continue once ADB has been enabled and DUMLdore is closed
call %dumldore%
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
pause
cd %tpath%
start cmd /k adb shell
cd %stpath%
echo Continue to be taken back to the main menu
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
pause
adb kill-server 2>>nul
taskkill /im adb.exe 2>>nul
goto mainmenu

:exit
exit