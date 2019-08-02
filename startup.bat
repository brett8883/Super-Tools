@echo off
SETLOCAL EnableDelayedExpansion
set appver=2.0
cls
call header.bat
Echo Hang on a sec...
adb kill-server
cls
call header.bat
cd tools
del dumldore*
del *.bin
del *.md
cls
call header.bat
wget https://github.com/brett8883/DUMLdore/archive/master.zip
7za.exe e master.zip
del DUMLdore-*
del master.zip
del *.md
rmdir dumldore-master
cd ..
cls
call intro.cmd

