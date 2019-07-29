cls
call header.bat
ECHO Starting in Super-Patcher 2.0 there are alternative variants of the Super-Patcher flightcontroller 
echo which have special options enabled that can be installed instead of the standard Super-Patcher flight controller.
echo. 
echo Many of these Variants have all the mods from the original Super-Patcher flight controller (but not all)
echo. 
echo It is important to fully understand the the behavior of any variant before installing it. 
echo. 
echo This library allows you to browse and learn about the various options. 
pause 
cls 
call header.bat
wget https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/MavicPro/MavicProVariants/index_Mavicpro.txt
cls
call header.bat
type index_Mavicpro.txt
del /f index_Mavicpro.txt
echo.
echo.
ECHO You can choose a flight controller to learn more about it and download a flight controller or return to the Main Menu
Choice /c 1234 /m "Choose and option with your keyboard"
if errorlevel 4 goto return
if errorlevel 3 goto paramexvar
if errorlevel 2 goto stealth
if errorlevel 1 goto brett8883

:return 
call mainmenu.cmd 

:paramexvar
set variant=MavicPro_Parameters_Extended_variant
cls 
call header.bat
echo Ok I am downloading that variant and it's documentation to your Super-Patcher folder. Be sure to read the documentation before using
copy wget.exe cd..
cd .. 
mkdir %variant%
copy wget.exe %variant%
del wget.exe
cd %variant%
wget https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/MavicPro/MavicProVariants/MavicPro_Parmeters_range%20extended/readme.md
wget https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/MavicPro/MavicProVariants/MavicPro_Parmeters_range%20extended/flyc_param_infos_parameters_extended
wget https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/MavicPro/MavicProVariants/MavicPro_Parmeters_range%20extended/MavicPro_Parameters_extended_fc03.02.44.90_fw01.04.0300_dji_system.bin
cd .. 
cd Super-Tools-%branch%
cls
call header.bat
Echo %variant% has been downloaded and is in your Super-Patcher folder
echo. 
Echo I will now take you back to the main menu...
timeout 6
call maninmenu.cmd


