@echo off
adb kill-server
cls
SETLOCAL EnableDelayedExpansion
set appver=2.0
cd tools
del dumldore*
del *.bin
del *.md
wget https://github.com/brett8883/DUMLdore/archive/master.zip
7za.exe e master.zip
del DUMLdore-*
del master.zip
rmdir dumldore-master
cd ..
call whichAC.bat

