@echo off
mode con: cols=160 lines=45
title Super-Patcher 2.0
cls
call %header%
Echo Super-Patcher features optional modifications.
echo.
echo The new modifications will each be discribed and then you will asked if you'd like to enable them.
echo.
echo Continue when ready...
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
pause
cls
call %header%
echo.
echo GALILEO SATELLITE RECEPTION
echo.
echo Super-Patcher can enable your aircraft to now connect to the new Galileo GPS satellite system.
echo.
echo This allows the %AC% to connect to more satellities for a more accurate, stonger, and more resiliant connection to GPS.
echo.
if "%AC%"=="MavicPro" echo Mavic Pro handles Galileo excetionally well. This is reccomended to all Mavic Pro users.
echo.
echo Galileo reception is hard-coded into the firmware. If you choose this option and decide later you would like to turn off this feature you will need to flash the stock firmware.
echo.
echo After flashing back to stock firmware you can redo Super-Patcher without the Galileo option enabled
echo.
ECHO Would you like to ENABLE Galileo reception?
echo.
echo [Y] YES
echo [N] No
echo.
choice /m "Please make selection with keyboard"
if errorlevel 2 goto gal2
if errorlevel 1 goto gal1

:gal1
set gal=1
goto askbatmod

:gal2
set gal=2
goto askbatmod

:askBatmod
call %header%
echo.
echo SMART BATTERY MODIFICATION
echo.
echo - Disable Forced Auto-Landing due to Smart Battery low battery
echo     NOTE: Aircraft will still force auto-land at emergency voltage level at 3.0v per cell (well below the safe voltage for flight)
echo.
echo - Calibrated Smart Battery "Only enough battery remaining to return to the home point" calculation to be more accurate
echo - Disabled low battery warning when using DJI Smart Battery
echo - Disabled critical low battery warning when using DJI Smart Battery
echo.
echo These are OPTIONAL
echo.
echo These options can be enabled in Assistant 2 1.1.2 OR they can be enabled by AUTOMATICALLY by indicating "YES" below.
echo   NOTTE: The Smart Battery modifications can also be disabled or tweaked to user preference in Assistant 2 1.1.2 in debug mode
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo If "YES" is indicated below the Smart Battery options will be enabled and there would be nothing additional the user needs to do to enable them
echo.
echo If "NO" is indicated below the factory defualts will remain default but can be enabled later by the user in Assistant 2 1.1.2 in debug mode
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO Would you like to ENABLE the new Smart Battery modification by default?
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
echo.
echo STEALTH
echo.
echo The new Stealth modification will disable the rear LED lights on the aircraft which will remain OFF during flight for Super Stealthy flight.
echo.
echo The Stealth modification is optional but it is hard-coded into the firmware and cannot be changed by the user in flight or with Assistant 2 1.1.2 in debug mode
echo   NOTE: To undo the Stealth mod, simply run Super-Patcher again without the Stealth mod selected or download and flash stock firmware from the main menu
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo If "YES" is indicated below the Stealth option will be enabled and there would be nothing additional the user needs to do to enable it
echo.
echo If "NO" is indicated below the factory defualt will remain and the rear LED light will function as normal
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo.
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
goto galresolve

:stealthmod2
set stealthmod=2
goto galresolve

:galresolve
if "gal"="1" gotoresolveurl1
if "gal"="2" gotoresolveurl2

:resolveurl1
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
md SP_Flight_Controllers 2>nul
cd SP_Flight_Controllers
set FCfolderpath=%cd%
if exist %fw2% goto end
%busybox% wget %varianturl%

:resolveurl2
echo %batmod%%stealthmod%
set varchoice=%batmod%%stealthmod%
echo %varchoice%
if "%varchoice%"=="22" set varianturl=%standard_NoGal% & set variant=Standard_NoGal & set "varchoice=44"
if "%varchoice%"=="12" set varianturl=%battmod_NoGal% & set variant=BattMod_NoGal & set "varchoice=34"
if "%varchoice%"=="21" set varianturl=%stealth_NoGal% & set variant=Stealth_NoGal & set "varchoice=43"
if "%varchoice%"=="11" set varianturl=%FullyLoaded_NoGal% & set variant=FullyLoaded_NoGal & set "varchoice=33"
set fw2=%AC%_SP_2.0_%variant%_%fc%_dji_system.bin
set fc=%fcbase%%varchoice%
cls
call %header%
title Super-Patcher 2.0 for %AC%
echo Wait just a moment...
echo.
cd %sppath%
md SP_Flight_Controllers 2>nul
cd SP_Flight_Controllers
set FCfolderpath=%cd%
if exist %fw2% goto end
%busybox% wget %varianturl%
:end
cd %stpath%
dd_checkprops.cmd
