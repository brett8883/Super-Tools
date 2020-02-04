@echo off
cls 
call %header%
echo PLEASE WAIT just a moment..
echo.
cd %tpath%

:verify
cls
echo _verify.cmd starting >> %log%
call %header%
Echo To verify Super-Patcher was successful please connect the remote controller to the %AC% and start the DJI Go 4 app.
echo.
echo In the "about" page of the settings menu in DJI Go 4, check the aircraft firmware version
echo.
echo If Super-Patcher was successful the DJI Go 4 app will report the aircraft firmware version as 00.00.0000
echo.
echo      NOTE: On some devices it may instead show N/A or could be blank altogether.
echo          Most importantly the app will NOT show the aircraft firmware is %stock%
echo.
echo This is normal and a sign that the patching process was successful.
echo.
echo.
Echo Does the DJI Go 4 app report the firmware version as %stock%
Echo(
Echo [Y] Yes 
Echo [N] no 
choice
If Errorlevel 2 Goto success
If Errorlevel 1 Goto nopatch

:nopatch
@echo off
echo User Indicated patch not successful. Showing log file >> %log%
cls 
Call %Header%
Echo If DJI Go 4 shows the firmware version on the %AC% is %stock% then Super-Patcher was not successful 
ECHO You should read the readme.md on GitHub again and restart Super-Patcher from the begining  
echo ===============================================================================================================================================================
echo I have generated a log file for you which can now be found at 
echo %logpath%
echo.
echo This file can be helpful to determine what has gone wrong
echo ===============================================================================================================================================================
Echo Some common reasons for Super-Patcher not being successful:
echo.
echo -Not starting on a completely stock version of firmware %stock%
echo.
echo -Not following the directions exactly please ONLY do what Super-Patcher says ONLY when it says to 
echo.		 
ECHO -When doing the "enable ADB" steps, not waiting until ABD has been enabled. 
echo        Usually the front lights will turn on or off to indicate ADB has been enabled
echo.
echo -Not using a Windows 10 PC. Windows 7 and 8 do not have to proper adb drivers Super-Patcher needs
echo        This can be over come by manually installing the drivers but using Windows 10 is much easier
echo ===============================================================================================================================================================
echo Continuing will take you back to the main menu
echo ===============================================================================================================================================================
pause 
cd %stpath%
goto end

:success
@echo off
cls 
call %header%
ECHO Congradulations! Super-Patcher was sucessful^!
echo ===============================================================================================================================================================
Echo You may now also modify any paramters you'd like using Assistant 2 1.1.2 in debug mode
echo ===============================================================================================================================================================
Echo You have completed the patching operation. Please note most settings and all parameters are now reset
echo.
Echo -Remember to check your RTH altitude and such.
echo ===============================================================================================================================================================
echo Would you like to return to the main menu or exit Super-Patcher?
echo.
echo [1] Take me back to the main menu
echo [2] Exit Super-Patcher
choice /c 12
if errorlevel 2 goto exitsp
if errorlevel 1 goto end
:exitsp
exit

:end
call mainmenu.cmd
