@echo off
mode con: cols=160 lines=45
cls
call header.bat
ECHO Would you like to enable the new smart battery mod?
echo.
choice 
if errorlevel 2 set batmod=1
if errorlevel 1 set batmod=2
cls
call header.bat
echo Would you like to enable the new stealth mod?
ECHO.
choice
if errorlevel 2 set stealthmod=1
if errorlevel 1 set stealthmod=2
set varchoice=%batmod%%stealthmod%
if "%varchoice%"=="11" set variant=Standard 
if "%varchoice%"=="21" set variant=battmod
if "%varchoice%"=="12" set variant=stealth
if "%varchoice%"=="22" set variant=loaded
set fw2=%AC%_SP_2.0_
set fwcache=https://github.com/brett8883/Super-Firmware_Cache/raw/
set fwcachebranch=/2.0/
rem https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/MavicPro/2.0/MavicPro_SP_2.0_standard/MavicPro_SP_2.0_03.02.44.11_dji_system.bin
set finalurl=%fwcache%%fwcachebranch%%AC%%fwcachebranch%%AC%_SP_2.0_%variant%/%AC%_SP_2.0_%fcbase%.%varchoice%_dji_system.bin
echo %finalurl%
pause
cls
call header.bat
title Super-Patcher 2.0 for %AC%
echo Wait just a moment...
echo.
wget %finalurl%
copy *.bin ..
del *.bin
if "%vt%"=="1" goto mpspk
if "%vt%"=="2" goto phantom

:mpspk
cls
call mpspk_verify.cmd

:phantom
cls
call phantom_verify.cmd