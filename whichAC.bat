@echo off 
cls 
SET APPVER=2.0
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %version% %appver%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
ECHO. 
ECHO  Please choose your Aircraft
ECHO.
ECHO -------------------------------------------------------------------------------------------
ECHO	1) Mavic Pro 1 / Mavic Platinum / Mavic Artic White
ECHO	2) Spark
ECHO	3) Phantom 4 Standard
ECHO	4) Phantom 4 Advanced
ECHO	5) Phantom 4 Pro
ECHO	6) Phantom 4 Pro v2
ECHO	7) Inspire 2
ECHO.
choice /C 1234567 /D 1 /T 99 /M "Please select connected device"
If Errorlevel 7 goto Sorry
If Errorlevel 6 goto Sorry
If Errorlevel 5 goto Sorry
If Errorlevel 4 goto Sorry
If Errorlevel 3 goto Sorry
If Errorlevel 2 goto SPK
If Errorlevel 1 goto MP

:sorry
cls
Echo So Sorry! :(
Echo.
ECHO Super-Patcher does not support your aircraft just yet but check back soon becasue it is almost ready!
ECHO.
ECHO See you soon! 
timeout 10 
exit 

:MP 
@Echo off
set AC=MavicPro
set verify_type=MPSPK
call CheckJAVA.bat

:SPK
@echo off
set AC=Spark
set verify_type=MPSPK
call CheckJAVA.bat
