@echo off
title Super-Patcher 2.0 MainMenu
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
echo.
echo                   [] Flash stock firmware
echo                   [] Open DankDroneDownloader by CS2000
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
If Errorlevel 4 goto fcLibrary
If Errorlevel 3 goto dumldore
If Errorlevel 2 goto flashstock 
If Errorlevel 1 goto StartSP


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
goto mainmenu

:dumldore
cd tools
cd dumldore
start dumldorev3.exe || goto errorduml
cd ..
cd..
goto mainmenu

:errorduml
cd ..
cd ..
cd ..
echo ERROR_COULD_NOT_OPEN_DUMLDORE_%appver%_MPSPK >> log.txt
echo %DATE%_%TIME% >> log.txt
echo ERROR_COULD_NOT_OPEN_DUMLDORE_%appver%_MPSPK >> errorlog.txt
echo %DATE%_%TIME% >> errorlog.txt
cd Super-Tools-%branch%
cd tools
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER Error handling Wizard %appver% 
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo. 
Echo ERROR
echo.
echo ERROR CODE M_M_COULD_NOT_OPEN_DUMLDORE
ECHO. 
ECHO Whoops! Something is not right. Sorry about this!
echo. 
echo Super-Patcher tried to open DUMLdore but couldn't.
echo.  
echo Sometimes this is because DUMLdore was already running in the background or 
echo this computer is blocking it from opening.
echo. 
echo Check to make sure that DUMLdore is not already running by going to the task manager and end task for 
echo DUMLdore if it is running and then continue. 
echo. 
echo If you are running Windows in a vertual machine then there is a good chance the VM is not set up properly
echo. 
echo When you are ready to try again please continue
echo.
pause
goto dumldore

:jkson
cd tools
call jkson.bat
goto mainmenu

:checkfc
call checkfc.bat
goto mainmenu

:flashstock 
call flashstock.bat
goto mainmenu

:Assistant
cls
call header.bat
ECHO I can help you install DJI Assistant 2 1.1.2 in debug mode but first you will need to uninstall any other version of Assistant 2 
Echo.
echo Please uninstall any other version of Assistant 2 you already have installed and then continue 
echo. 
echo If you do not have any version of Assistant 2 install of this machine you may continue
pause
cls 
call header.bat 
Echo Assistant 2 1.1.2 is about 120MB would you like me to download it for you?
ECHO. 
choice /m "Please make a selction with your keyboard 
If Errorlevel 2 goto mainmenu
If Errorlevel 1 goto installAssistant

:installAssistant
cls
call header.bat
ECHO Please wait while I download Assistant 2 1.1.2 ...
cd tools 
copy wget.exe Assistant_2_files
copy 7za.exe Assistant_2_files
cd Assistant_2_files
wget https://www.sekidorc.com/press/DJI_Assistant2_Installer_v1.1.2_20170527.zip
7za.exe e DJI_Assistant2_Installer_v1.1.2_20170527.zip
del /f DJI_Assistant2_Installer_v1.1.2_20170527.zip
cls 
cd ..
cd ..
call header.bat
cd tools 
cd Assistant_2_files
Echo Ok I have downloaded Assistant 2 1.1.2
ECHO I will now open the Assistant 2 1.1.2 installer and then you'll need to complete the installation 
echo.
echo But we wont't be done yet at that point. We still need to set up debug mode
echo. 
echo Once you have installed Assistant 2 1.1.2 please check back with Super-Patcher so we csn set up debug mod
ECHO. 
echo. 
ECHO Continue once ready to install Assistant 1.1.2
echo.
pause
start "DJI Assistant 2 1.1.2.573 2017_05_27 16_41_02 6e0216bf(b21de8d8).exe"
copy main.js ..
cd ..
copy main.js ..
del main.js
cd ..
copy main.js ..
del main.js
cd Super-Tools-%branch%
cls
call header.bat
Once you have installed Assistant 2 1.1.2
pause
goto mainmenu

:startSp 
title Super-Patcher 2.0 WhichAC?
cls 
call header.bat
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
If Errorlevel 7 goto Sorry
If Errorlevel 6 goto P4Pv2
If Errorlevel 5 goto p4a
If Errorlevel 4 goto p4s
If Errorlevel 3 goto p4p
If Errorlevel 2 goto SPK
If Errorlevel 1 goto MP

:sorry
cls
call header.bat
Echo So Sorry! :(
Echo.
ECHO Super-Patcher does not yet support Inspire 2. I am working on it but require a file from someone who has an Inspire 2. 
ECHO Please see my GitHub repo called Capture_I2_0306.unsig
ECHO.
ECHO https://github.com/brett8883/DJI_Super-Capture_I2_0306.unsig  
ECHO.
ECHO I will take you back to the main menu
pause
goto mainmenu


:MP 
@Echo off
cls
set AC=MavicPro
set fc=3.02.44.10
set stock=01.04.0300
set vt=1
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/MavicPro_MPP_super_patcher_03.02.44.10_dji_system.bin
set fw2=MavicPro_MPP_super_patcher_03.02.44.10_dji_system.bin
goto downloadfc


:SPK
@echo off
cls
set AC=Spark
set fc=3.02.43.09
set stock=1.00.0900 
set vt=1
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/Spark_Super_Patcher_FC/Spark_Super-Patcher_306_03.02.43.09_dji_system.bin
set fw2=Spark_Super-Patcher_306_03.02.43.09_dji_system.bin
goto downloadfc


:p4p
@echo off
cls
set AC=P4P
set fc=3.02.44.31
set stock=1.05.0600  
set vt=2
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4P_Super-Patcher_FC/P4P_wm331_Super_Patcher_0306_03.02.44.31_dji_system.bin
set fw2=P4P_wm331_Super_Patcher_0306_03.02.44.31_dji_system.bin
goto downloadfc


:p4a
@echo off
cls
set AC=P4A
set fc=3.02.35.32
set stock=01.00.0128
set vt=2
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4Advanced_Super_Patcher_FC/P4Advanced_wm332_Super_Patcher_FC_0306_03.02.35.32_dji_system.bin
set fw2=P4Advanced_wm332_Super_Patcher_FC_0306_03.02.35.32_dji_system.bin
goto downloadfc


:p4s
@echo off
cls
set AC=P4Standard
set fc=3.02.44.33
set stock=2.00.0700 
set vt=2
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4Standard_Super_Patcher_FC/P4Standard_wm330_0306_03.02.44.33_Super_Patcher_dji_system.bin
set fw2=P4Standard_wm330_0306_03.02.44.33_Super_Patcher_dji_system_.bin
goto downloadfc


:P4Pv2
cls 
set AC=P4Pv2
set fc=3.03.04.35
set stock=1.00.1500
set vt=2
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4Pv2_FLIGHT_CONTROLLERS/P4PV2_Super_Patcher_FC/P4PV2_wm335_Super_Patcher_0306_03.03.04.35_dji_system.bin
set fw2=P4PV2_wm335_Super_Patcher_0306_03.03.04.35_dji_system.bin
goto downloadfc

:downloadfc
title Super-Patcher 2.0 DownloadFC
cls
wget %fw%
copy *.bin ..
del *.bin
cd ..
cd Super-Tools-%branch%
echo %vt%
echo %AC%
echo %stock%
echo %fc%
pause
if "%vt%"=="1" call mpspk_verify.cmd else call phantom_verify.cmd