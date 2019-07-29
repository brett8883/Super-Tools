@echo off
IF EXIST "*dji_system.*" (
ECHO IT worked
CLS
) ELSE (
  GOTO MAIN1
)
CLS
ECHO.
ECHO -------------------------------------------------------------------------------------------
ECHO  FC chooser %version% %appver%
ECHO -------------------------------------------------------------------------------------------
ECHO. 
ECHO  Pick the firmware file you want to use ...
ECHO.
ECHO -------------------------------------------------------------------------------------------
ECHO.
SET index=1
SETLOCAL ENABLEDELAYEDEXPANSION
FOR %%f IN (*dji_system.*) DO (
   SET file!index!=%%f
   ECHO   !index! - %%f
   SET /A index=!index!+1
)
SETLOCAL DISABLEDELAYEDEXPANSION
ECHO.
SET /P selection="Select the proper file: "
SET file%selection% >nul 2>&1
IF ERRORLEVEL 1 (
   ECHO.
   ECHO Invalid number selected
   TIMEOUT 2   
   GOTO MAIN1
)
CALL :RESOLVE %%file%selection%%%
ECHO Selected file name: %filename%
TIMEOUT 2 >nul
pause