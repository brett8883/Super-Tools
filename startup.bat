@echo off
mode con: cols=100 lines=40
adb kill-server
cls
SETLOCAL EnableDelayedExpansion
set appver=1.7.1
call whichAC.bat
