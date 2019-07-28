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
echo                   [] Get Stock fireware files by CS2000
echo                   [] Browse Variant Library
echo                   [] Launch DULMdore by Jezzeb
echo                   [] Check Aircraft Firmware Attributes
echo                   [] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo.
Choice /c 123456 /M "Please make a section with keyboard"
If Errorlevel 6 goto jkson
If Errorlevel 5 goto checkfc
If Errorlevel 4 goto dumldore
If Errorlevel 3 goto fcLibrary
If Errorlevel 2 goto getDownloader
If Errorlevel 1 goto StartSP

:startSP
cls
call Whichac.bat

:getDownloader
cls
call header.bat
cd tools
if exist DankDroneDownloader.exe start DankDroneDownloader.exe & goto mainmenu
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
echo "                    | $$                                                     ___         ___          __  __  ___  ___  ___  ____                            ";
echo "                    | $$                                                    / _ )__ __  / _ )_______ / /_/ /_( _ )( _ )( _ )|_  /                            ";
echo "                    |__/                                                   / _  / // / / _  / __/ -_) __/ __/ _  / _  / _  |/_ <                             ";
echo "                                                                          /____/\_, / /____/_/  \__/\__/\__/\___/\___/\___/____/                             ";
echo "                                                                               /___/                                                                         ";
echo ===============================================================================================================================================================
echo "                                                    __ __  __  _ __  _   __ __ ___ __  _ _  _                                                                ";
echo "                                                   |  V  |/  \| |  \| | |  V  | __|  \| | || |                                                               ";
echo "                                                   | \_/ | /\ | | | ' | | \_/ | _|| | ' | \/ |                                                               ";
echo "                                                   |_| |_|_||_|_|_|\__| |_| |_|___|_|\__|\__/                                                                ";
Echo "                                                                                                                                                             ";
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
Echo Ok, hold on while I open DUMLdore...
cd tools 
start dumldorev3.exe
cd ..
goto mainmenu