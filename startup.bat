@echo off
mode con: cols=92 lines=40
echo %date%_%time% > %sp%\logs\errorlog.txt
echo %date%_%time% > 2> %sp%\logs\log.txt
cls
SETLOCAL EnableDelayedExpansion
set appver=1.7.4
set st=%cd%
cd ..
set sp=%cd%
cd %st%
cd tools
set tools=%cd%
cd %st%
echo %date%_%time% > %sp%\logs\errorlog.txt
echo %date%_%time% > %sp%\logs\log.txt
call whichAC.bat
