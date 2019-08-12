@echo off
mode con: cols=160 lines=45
cls
call header.bat
ECHO Would you like to enable the new smart battery mod?
echo.
choice 
if errorlevel 2 set batmod=0
if errorlevel 1 set batmod=1
cls
call header.bat
echo Would you like to enable the stealth mod?
ECHO.
choice
if errorlevel 2 set stealthmod=0
if errorlevel 1 set stealthmod=1
set varchoice=%batmod%%stealthmod%
if "%varchoice%"=="00" set variant=Standard 
if "%varchoice%"=="10" set variant=battmod
if "%varchoice%"=="01" set variant=stealth
if "%varchoice%"=="11" set variant=loaded
set fw=%AC%_SP_2.0_
set fwcache=https://github.com/brett8883/Super-Firmware_Cache/raw/
set fwcachebranch=/2.0/
rem https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/MavicPro/2.0/MavicPro_SP_2.0_standard/MavicPro_SP_2.0_03.02.44.11_dji_system.bin
set finalurl=%fwcache%%fwcachebranch%%AC%%fwcachebranch%%AC%_SP_2.0_%variant%/%AC%_SP_2.0_%fc%_dji_system.bin
echo %finalurl%
wget %finalurl%
pause