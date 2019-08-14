@echo off
mode con: cols=160 lines=45
title Super-Patcher 2.0
cls
call header.bat
ECHO Would you like to ENABLE the new smart battery mod?
echo.
echo [Y] YES
echo [N] No
echo.
choice /m "Please make selection with keyboard"
if errorlevel 2 set batmod=2
if errorlevel 1 set batmod=1
cls
call %header%
echo Would you like to ENABLE the new stealth mod?
echo.
echo [Y] YES
echo [N] No
echo.
choice /m "Please make selection with keyboard"
if errorlevel 2 set stealthmod=2
if errorlevel 1 set stealthmod=1
echo %batmod% %stealthmod%
set varchoice=%batmod%%stealthmod%
echo %varchoice%
if "%varchoice%"=="22" set varianturl=%standard% & set variant=Standard
if "%varchoice%"=="12" set varianturl=%battmod% & set variant=BattMod
if "%varchoice%"=="21" set varianturl=%stealth% & set variant=Stealth
if "%varchoice%"=="11" set varianturl=%FullyLoaded% & set variant=FullyLoaded
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