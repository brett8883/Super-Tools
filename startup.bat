@echo off
mode con: cols=92 lines=40
SETLOCAL EnableDelayedExpansion
set appver=1.9
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
SET count=1
FOR /F "tokens=* USEBACKQ" %%F IN (`wmic os get version`) DO (
  SET var!count!=%%F
  SET /a count=!count!+1
)
set _string=%var2%
for /f "tokens=1 delims=." %%a in ("%_string%") do (
  set /a winver=%%a
  )
if "%winver%"=="10" (goto windows10) ELSE (goto windowsver)

:windows10
::Windows version is 10 notice
Echo Windows 10 is detected
PING -n 3 127.0.0.1>nul
goto end

:windowsver
::not windows 10 notice
Echo I have detected that your Windows version is Windows %winver% ...
echo.
echo Super-Patcher works best with Windows 10.
echo.
echo Some people have experienced an issue where Windows 7 and 8
echo  do not recognize the DJI ADB driver's certificate not allowing Super-Patcher to
echo comunicate 
echo.
echo.
echo If you have any issues running Super-Patcher please try again on a Windows 10 PC.
echo.
ECHO Please continue when ready
echo
pause
:end
call whichAC.bat
