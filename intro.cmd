rem This is here as storage
if exist DontShowIntro (goto skip) else (goto askintro)
:askintro
cd %stpath%
cls
call %header%
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
call %header%
Echo.
Echo In Super-Patcher 2.0 the first page you will see is the main menu which will be home base for all things Super-Patcher
echo.
echo "                                                    __ __  __  _ __  _   __ __ ___ __  _ _  _                                                                ";
echo "                                                   |  V  |/  \| |  \| | |  V  | __|  \| | || |                                                               ";
echo "                                                   | \_/ | /\ | | | ' | | \_/ | _|| | ' | \/ |                                                               ";
echo "                                                   |_| |_|_||_|_|_|\__| |_| |_|___|_|\__|\__/                                                                ";
Echo "                                                                                                                                                             ";
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO.
echo          WHAT DO YOU WANT TO DO?
echo.
echo                  *[1] Start Super-Patcher!
echo                   [2] Download ^& Flash stock firmware needed for Super-Patcher
echo.
echo                   UTILITIES
echo                   [3] Open DankDroneDownloader by CS2000 to download any other firmware files
echo                   [4] Launch DULMdore by Jezzeb
echo                   [5] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo                   [6] Launch the free NoLimitDronez app
echo.
echo **please continue to see the rest of the Super-Patcher 2.0 introduction presentation**
pause
cls
call %header%
echo "                                                    __ __  __  _ __  _   __ __ ___ __  _ _  _                                                                ";
echo "                                                   |  V  |/  \| |  \| | |  V  | __|  \| | || |                                                               ";
echo "                                                   | \_/ | /\ | | | ' | | \_/ | _|| | ' | \/ |                                                               ";
echo "                                                   |_| |_|_||_|_|_|\__| |_| |_|___|_|\__|\__/                                                                ";
Echo "                                                                                                                                                             ";
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO.
echo Option#1 is to begin the Super-Patcher process. You'll do this once you AC is on the correct firmware
Echo.
echo          WHAT DO YOU WANT TO DO?
echo.
echo =================^>*[1] Start Super-Patcher! ^<=============================================================================================================
echo                   [2] Download ^& Flash stock firmware needed for Super-Patcher
echo.
echo                   UTILITIES
echo                   [3] Open DankDroneDownloader by CS2000 to download any other firmware files
echo                   [4] Launch DULMdore by Jezzeb
echo                   [5] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo                   [6] Launch the free NoLimitDronez app
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation
pause
cls
call %header%
echo "                                                    __ __  __  _ __  _   __ __ ___ __  _ _  _                                                                ";
echo "                                                   |  V  |/  \| |  \| | |  V  | __|  \| | || |                                                               ";
echo "                                                   | \_/ | /\ | | | ' | | \_/ | _|| | ' | \/ |                                                               ";
echo "                                                   |_| |_|_||_|_|_|\__| |_| |_|___|_|\__|\__/                                                                ";
Echo "                                                                                                                                                             ";
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO.
echo Option#2 will automatically download the correct stock firmware needed for your AC and walk you through flashing it with DUMLdore 
Echo.
echo          WHAT DO YOU WANT TO DO?
echo.
echo                  *[1] Start Super-Patcher! 
echo =================^>[2] Download ^& Flash stock firmware needed for Super-Patcher ^<============================================================================
echo.
echo                   UTILITIES
echo                   [3] Open DankDroneDownloader by CS2000 to download any other firmware files
echo                   [4] Launch DULMdore by Jezzeb
echo                   [5] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo                   [6] Launch the free NoLimitDronez app
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation
pause
cls
call %header%
echo "                                                    __ __  __  _ __  _   __ __ ___ __  _ _  _                                                                ";
echo "                                                   |  V  |/  \| |  \| | |  V  | __|  \| | || |                                                               ";
echo "                                                   | \_/ | /\ | | | ' | | \_/ | _|| | ' | \/ |                                                               ";
echo "                                                   |_| |_|_||_|_|_|\__| |_| |_|___|_|\__|\__/                                                                ";
Echo "                                                                                                                                                             ";
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO.
echo Option#3 Will download and launch DankDroneDownloader so you can download any firmware you may need
Echo.
echo          WHAT DO YOU WANT TO DO?
echo.
echo                  *[1] Start Super-Patcher! 
echo                   [2] Download & Flash stock firmware needed for Super-Patcher
echo.
echo                   UTILITIES
echo =================^>[3] Open DankDroneDownloader by CS2000 to download any other firmware files ^<===============================================================
echo                   [4] Launch DULMdore by Jezzeb
echo                   [5] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo                   [6] Launch the free NoLimitDronez app
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation
pause
cls
call %header%
echo "                                                    __ __  __  _ __  _   __ __ ___ __  _ _  _                                                                ";
echo "                                                   |  V  |/  \| |  \| | |  V  | __|  \| | || |                                                               ";
echo "                                                   | \_/ | /\ | | | ' | | \_/ | _|| | ' | \/ |                                                               ";
echo "                                                   |_| |_|_||_|_|_|\__| |_| |_|___|_|\__|\__/                                                                ";
Echo "                                                                                                                                                             ";
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO.
echo Option#4 will launch the latest version of DUMLdore 
Echo.
echo          WHAT DO YOU WANT TO DO?
echo.
echo                  *[1] Start Super-Patcher! 
echo                   [2] Download ^& Flash stock firmware needed for Super-Patcher
echo.
echo                   UTILITIES
echo                   [3] Open DankDroneDownloader by CS2000 to download any other firmware files
echo =================^>[4] Launch DULMdore by Jezzeb^<====================================================================
echo                   [5] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo                   [6] Launch the free NoLimitDronez app
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation
pause
call %header%
cls
echo "                                                    __ __  __  _ __  _   __ __ ___ __  _ _  _                                                                ";
echo "                                                   |  V  |/  \| |  \| | |  V  | __|  \| | || |                                                               ";
echo "                                                   | \_/ | /\ | | | ' | | \_/ | _|| | ' | \/ |                                                               ";
echo "                                                   |_| |_|_||_|_|_|\__| |_| |_|___|_|\__|\__/                                                                ";
Echo "                                                                                                                                                             ";
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO.
echo Option#5 Will Launch jkson_fcc_mod stand alone version and set you up to change your radio settings without needing to redo the Super Patcher process
Echo.
echo          WHAT DO YOU WANT TO DO?
echo.
echo                  *[1] Start Super-Patcher! 
echo                   [2] Download & Flash stock firmware needed for Super-Patcher
echo.
echo                   UTILITIES
echo                   [3] Open DankDroneDownloader by CS2000 to download any other firmware files
echo                   [4] Launch DULMdore by Jezzeb
echo =================^>[5] Launch jkson fcc mod (Mavic and P4Pv2 only)^<============================================================================================
echo                   [6] Launch the free NoLimitDronez app
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation
pause
cls
call %header%
cls
echo "                                                    __ __  __  _ __  _   __ __ ___ __  _ _  _                                                                ";
echo "                                                   |  V  |/  \| |  \| | |  V  | __|  \| | || |                                                               ";
echo "                                                   | \_/ | /\ | | | ' | | \_/ | _|| | ' | \/ |                                                               ";
echo "                                                   |_| |_|_||_|_|_|\__| |_| |_|___|_|\__|\__/                                                                ";
Echo "                                                                                                                                                             ";
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO.
echo Option#6 will open the the free NoLimitDrones app embedded into Super-Patcher. You can use it to check the flight controller # on your bird after 
echo          you have completed the Super-Patcher process(more on this later.)If you have a license with them you can also use it to adjust your parameters. 
Echo.
echo          WHAT DO YOU WANT TO DO?
echo.
echo                  *[1] Start Super-Patcher! 
echo                   [2] Download & Flash stock firmware needed for Super-Patcher
echo.
echo                   UTILITIES
echo                   [3] Open DankDroneDownloader by CS2000 to download any other firmware files
echo                   [4] Launch DULMdore by Jezzeb
echo                   [5] Launch jkson fcc mod (Mavic and P4Pv2 only)
echo =================^>[6] Launch the free NoLimitDronez app^<============================================================================================
echo.
echo please continue to see the rest of the Super-Patcher 2.0 introduction presentation
pause
cls
call %header%
That concludes the Super-Patcher 2.0 introduction presentation. If you don't want to see this in the future you can choose option #2 when asked...
echo
echo There have been some exciting changes around here, Can I show you around?
ECHO.
echo         [1] Yes, show me the new features 
echo =======^>[2] No, skip this intro and don't ask me again^<==============================================================================================
echo.
echo And you won't be shown the  be shown the Super-Patcher 2.0 introduction presentation in the future.
echo.
echo.
echo.
echo Please continue to be taken to the Main Menu
pause
goto skip
rem end intro