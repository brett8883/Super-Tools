@echo off
adb kill-server
cls
SETLOCAL EnableDelayedExpansion
set appver=1.7.2
cd tools
wget https://github.com/jezzab/DUMLdore/archive/master.zip
7za.exe e master.zip
call whichAC.bat
