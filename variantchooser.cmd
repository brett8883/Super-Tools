@echo off
mode con: cols=160 lines=45
title Super-Patcher 2.0
cls
call %header%
ECHO Would you like to ENABLE the new Smart Battery mod?
echo.
echo [Y] YES
echo [N] No
echo.
choice /m "Please make selection with keyboard"
if errorlevel 2 goto batmod2
if errorlevel 1 goto batmod1

:batmod1
set batmod=1
goto askstealth

:batmod2
set batmod=2
goto askstealth

:askstealth
cls
call %header%
echo Would you like to ENABLE the new stealth mod?
echo.
echo [Y] YES
echo [N] No
echo.
choice /m "Please make selection with keyboard"
if errorlevel 2 goto stealthmod2
if errorlevel 1 goto stealthmod1

:stealthmod1
set stealthmod=1
goto resolveurl

:stealthmod2
set stealthmod=2
goto resolveurl

:resolveurl
echo %batmod%%stealthmod%
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