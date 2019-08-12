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
if "%varchoice%"=="11" set variant=%standard%
if "%varchoice%"=="21" set variant=%battmod%
if "%varchoice%"=="12" set variant=%stealth%
if "%varchoice%"=="22" set variant=%battmodstealth%
set fw2=%AC%_SP_2.0_%variant%_%fc%_dji_system.bin
set fc=%fcbase%%varchoice%
pause
cls
call header.bat
title Super-Patcher 2.0 for %AC%
echo Wait just a moment...
echo.
echo !%variant%!
%busybox% wget %variant%
pause
copy *.bin ..
del *.bin
if "%vt%"=="1" call mpspk_verify.cmd
if "%vt%"=="2" call phantom_verify.cmd