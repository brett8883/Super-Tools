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
set variant=%batmod%%stealthmod%
if "%variant%"=="00" echo Standard
if "%variant%"=="10" echo batmod
if "%variant%"=="01" echo stealthmod
if "%variant%"=="11" echo loaded
pause

