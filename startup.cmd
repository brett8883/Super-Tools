@echo off
title Super-Patcher 2.0 Start Up
mode con: cols=160 lines=45
set appver=2.0
adb kill-server 2>> null
del null
cls
call header.bat
echo Hang on one more sec...
echo.
cd tools
wget https://github.com/brett8883/DUMLdore/archive/master.zip
unzip -o master.zip
del DUMLdore-*
del master.zip
del *.md
ren DUMLdore-master DUMLdore
cd DUMLdore
set ddpath=%cd%
cd ..
set tpath=%cd%
cd ..
set stpath=%cd%
cd ..
set sppath=%cd%
echo %ddpath%
echo %tpath%
echo %stpath%
echo %sppath%
pause
if exist DontShowIntro (goto skip) else (goto askintro)
:askintro
cd %stpath%
cls
call header.bat
ECHO Welcome to Super-Patcher 2.0!
ECHO. 
echo There have been some exciting changes around here, Can I show you around?
ECHO.
echo         [1] Yes, show me the new features 
echo         [2] No, skip this intro and don't ask me again
ECHO. 
choice /C 12 /D 1 /T 99 /M "Please select an option with your keyboard"
If Errorlevel 2 goto skipthis
If Errorlevel 1 goto intro

:intro
cls 
call header.bat
Echo.
Echo In Super-Patcher 2.0 the first page you will see is the main menu which will be home base for all things Super-Patcher
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo "                                                    __ __  __  _ __  _   __ __ ___ __  _ _  _                                                                ";
echo "                                                   |  V  |/  \| |  \| | |  V  | __|  \| | || |                                                               ";
echo "                                                   | \_/ | /\ | | | ' | | \_/ | _|| | ' | \/ |                                                               ";
echo "                                                   |_| |_|_||_|_|_|\__| |_| |_|___|_|\__|\__/                                                                ";
Echo "                                                                                                                                                             ";
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO.
echo         WHAT DO YOU WANT TO DO?
echo.
echo                   [1] *Start Super-Patcher
echo.
echo                   [2] Flash Stock firmware
echo                   [3] Browse Variant Library
echo                   [4] Open DankDroneDownloader by CS2000
echo.                  
echo                   [5] Launch DULMdore by Jezzeb
echo                   [6] Launch the free NoLimitDronez app
echo                   [7] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo                   [8] Install Assistant 2 1.1.2 and set up debug mode
echo.
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation 
pause
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
echo           [1] *Start Super-Patcher ^<=========== Option#1 is to begin the Super-Patcher process. You'll do this once you AC is on the correct firmware
echo.
echo           [2] Flash Stock firmware 
echo           [3] Browse Variant Library
echo           [4] Open DankDroneDownloader by CS2000
echo.                   
echo           [5] Launch DULMdore by Jezzeb
echo           [6] Launch the free NoLimitDronez app
echo           [7] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo           [8] Install Assistant 2 1.1.2 and set up debug mode
echo.
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation
pause
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
echo                   [1] *Start Super-Patcher
echo.                                            
echo                   [2] Flash Stock firmware ^<=======Option#2 will help you download the correct stock firmware needed for your AC and flash it with DUMLdore 
echo                   [3] Browse Variant Library
echo                   [4] Open DankDroneDownloader by CS2000
echo.                   
echo                   [5] Launch DULMdore by Jezzeb
echo                   [6] Launch the free NoLimitDronez app
echo                   [7] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo                   [8] Install Assistant 2 1.1.2 and set up debug mode
echo.
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation
echo.
pause
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
echo                   [1] *Start Super-Patcher
echo.                                            
echo                   [2] Flash Stock firmware 
echo                   [3] Browse Variant Library ^<=============== Option#3 Will take you to the flight controller library where you can learn more about 
echo                   [4] Open DankDroneDownloader by CS2000                 the different flight controllers availible in Super-Patcher
echo.                   
echo                   [5] Launch DULMdore by Jezzeb
echo                   [6] Launch the free NoLimitDronez app
echo                   [7] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo                   [8] Install Assistant 2 1.1.2 and set up debug mode
echo.
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation
echo
pause
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
echo                   [1] *Start Super-Patcher
echo.                                            
echo                   [2] Flash Stock firmware 
echo                   [3] Browse Variant Library 
echo                   [4] Launch DankDroneDownloader by CS2000 ^<========== Option#4 Will download and launch DankDroneDownloader 
echo.                                                                                 so you can download any firmware you may need                 
echo                   [5] Launch DULMdore by Jezzeb
echo                   [6] Launch the free NoLimitDronez app
echo                   [7] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo                   [8] Install Assistant 2 1.1.2 and set up debug mode
echo.
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation
echo.
pause
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
echo                   [1] *Start Super-Patcher
echo.                                            
echo                   [2] Flash Stock firmware 
echo                   [3] Browse Variant Library 
echo                   [4] Open DankDroneDownloader by CS2000 
echo.                   
echo                   [5] Launch DULMdore by Jezzeb ^<============================================================ Option#5 Will launch DUMLdore 
echo                   [6] Launch the free NoLimitDronez app 
echo                   [7] Launch jkson fcc mod by Jkson5 (Mavic and P4Pv2 only)
echo                   [8] Install Assistant 2 1.1.2 and set up debug mode
echo.
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation
echo.
pause
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
echo                   [1] *Start Super-Patcher
echo.                                            
echo                   [2] Flash Stock firmware 
echo                   [3] Browse Variant Library 
echo                   [4] Open DankDroneDownloader by CS2000 
echo.                   
echo                   [5] Launch DULMdore by Jezzeb  
echo                   [6] Launch NoLimitDronez app ^<========================================== Option#6 Will launch the free NoLimitDronez desktop app 
echo                   [7] Launch jkson fcc mod by Jkson5 (Mavic and P4Pv2 only)
echo                   [8] Install Assistant 2 1.1.2 and set up debug mode
echo.
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation
echo.
pause
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
echo                   [1] *Start Super-Patcher
echo.                                            
echo                   [2] Flash Stock firmware 
echo                   [3] Browse Variant Library 
echo                   [4] Open DankDroneDownloader by CS2000 
echo.                   
echo                   [5] Launch DULMdore by Jezzeb  
echo                   [6] Launch NoLimitDronez app  
echo                   [7] Launch jkson fcc mod by Jkson5 (Mavic and P4Pv2 only)^<========== Option#7 Will Launch jkson_fcc_mod (for MavicPro and P4Pv2 only)
echo                   [8] Install Assistant 2 1.1.2 and set up debug mode
echo.
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation
echo.
pause
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
echo                   [1] *Start Super-Patcher
echo.                                            
echo                   [2] Flash Stock firmware 
echo                   [3] Browse Variant Library 
echo                   [4] Open DankDroneDownloader by CS2000 
echo.                   
echo                   [5] Launch DULMdore by Jezzeb  
echo                   [6] Launch NoLimitDronez app  
echo                   [7] Launch jkson fcc mod by Jkson5 (Mavic and P4Pv2 only)
echo                   [8] Install Assistant 2 1.1.2 and set up debug mode 
echo                                                                  ^<===== Option#8 Will download and install Assistant 2 1.1.2 and help you set up debug mode
echo.
echo.
echo please continue to finish the Super-Patcher 2.0 introduction presentation
echo.
pause 
cls 
call header.bat
Echo This is the end of the Super-Patcher Introduction. I will now take you to the real main menu
timeout 8
Call mainmenu.cmd

:skipthis
cls
cd %sppath%
Echo intro has been read, don't show again > DontShowIntro
echo %DATE%_%TIME% >> DontShowIntro
cd %stpath%
call mainmenu.cmd

:skip
cls
call mainmenu.cmd
