@echo off
mode con: cols=160 lines=45

:choosefc
title Super-Patcher 2.0
color 0f
cls
call header.bat
ECHO Would you like to enable the new smart battery mod?
echo.
choice 
if errorlevel 2 set batmod=1
if errorlevel 1 set batmod=2
cls
call %header%
echo Would you like to enable the new stealth mod?
ECHO.
choice
if errorlevel 2 set stealthmod=1
if errorlevel 1 set stealthmod=2
cls
call %header%
Echo You have chosen the options:
ECHO.
if "%batmod%"=="2" echo Smart Battery Mod ENABLED
if "%batmod%"=="1" echo Smart Battery Mod DISABLED
if "%stealthmod%"=="2" echo Stealth Mod ENABLED
if "%stealthmod%"=="1" echo Stealth Mod DISABLED
Echo.
echo Please confirm your selections or redo selections
Echo.
echo    **[Y] Yes, CONFIRM SELECTION **
echo      [N] No, let me pick again. Redo
choice
if errorlevel 2 goto rechoosefc
if errorlevel 1 goto getfc


:rechoosefc
cls
color 40
call %header%
set stealthmod=
set batmod=
goto choosefc

:getfc
set varchoice=%batmod%%stealthmod%
if "%varchoice%"=="11" set varianturl=%standard% & set variant=standard
if "%varchoice%"=="21" set varianturl=%battmod% & set variant=battmod
if "%varchoice%"=="12" set varianturl=%stealth% & set variant=stealth
if "%varchoice%"=="22" set varianturl=%battmodstealth% & set variant=battmodstealth
set fw2=%AC%_SP_2.0_%variant%_%fc%_dji_system.bin
set fc=%fcbase%%varchoice%
cls
call %header%
title Super-Patcher 2.0 for %AC%
echo Wait just a moment...
echo.
cd %sppath%
%busybox% wget %varianturl%
cd %stpath%
call mpspk_verify.cmd