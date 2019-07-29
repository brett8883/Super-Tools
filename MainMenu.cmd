@echo off 
:mainmenu
cls
call header.bat
echo "                                                    __ __  __  _ __  _   __ __ ___ __  _ _  _                                                                ";
echo "                                                   |  V  |/  \| |  \| | |  V  | __|  \| | || |                                                               ";
echo "                                                   | \_/ | /\ | | | ' | | \_/ | _|| | ' | \/ |                                                               ";
echo "                                                   |_| |_|_||_|_|_|\__| |_| |_|___|_|\__|\__/                                                                ";
Echo "                                                                                                                                                             ";
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO.
echo          WHAT DO YOU WANT TO DO?
echo.
echo                   [] *Start Super-Patcher
echo                   [] Flash stock firmware
echo                   [] Get Stock fireware files by CS2000
echo                   [] Browse Variant Library
echo                   [] Launch DULMdore by Jezzeb
echo                   [] Check Aircraft Firmware Attributes
echo                   [] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo                   [] Install Assistant 2 1.1.2 and set up debug mode 
echo.
Choice /c 12345678 /M "Please make a section with keyboard"
If Errorlevel 8 goto Assistant
If Errorlevel 7 goto getDownloader
If Errorlevel 6 goto jkson
If Errorlevel 5 goto checkfc
If Errorlevel 4 goto dumldore
If Errorlevel 3 goto fcLibrary
If Errorlevel 2 goto flashstock 
If Errorlevel 1 goto StartSP

:startSP
cls
call Whichac.bat

:getDownloader
cls
call header.bat
cd tools
if exist DankDroneDownloader.exe start DankDroneDownloader.exe & cd .. & goto mainmenu
Echo Hold on just a sec...
cd tools
wget https://github.com/cs2000/DankDroneDownloader/archive/master.zip
7za.exe e master.zip
start DankDroneDownloader.exe
del master.zip
del /f /q DankDroneDownloader-master
del /f /q ISSUE_TEMPLATE
del /f /q .wget-hsts
del /f /q *.md
cd ..
goto mainmenu

:fcLibrary
cls
call fcLibrary.bat

:dumldore
cd tools 
start dumldorev3.exe
cd ..
goto mainmenu

:jkson
cd tools
call jkson.bat

:checkfc
call checkfc.bat

:flashstock 
call flashstock.bat

:Assistant
cls
call header.bat 
ECHO Please wait while I download Assistant 2 1.1.2 ...
cd tools 
copy wget.exe Assistant_2_files
copy 7za.exe Assistant_2_files
cd Assistant_2_files
wget https://www.sekidorc.com/press/DJI_Assistant2_Installer_v1.1.2_20170527.zip
pause