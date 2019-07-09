@echo off
cls
SETLOCAL EnableDelayedExpansion
set appver=2.0
Echo *****************************************************************************************************
Echo Start Up
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo Thanks for using Super-Patcher! 
Echo.
Echo Give me a couple of moments to get set up. This wont take long...
Echo.
rmdir /Q /S nonemptydir patchsequence
mkdir patchsequence 
copy wget.exe 
cd patchsequence
timeout 3
cls
Echo *****************************************************************************************************
Echo Start Up
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo Thanks for using Super-Patcher! 
Echo.
Echo Give me a couple of moments to get set up. This wont take long...
ECHO.
wget https://github.com/brett8883/Super-Tools/raw/master/unzip.exe
wget https://dl.google.com/android/repository/platform-tools-latest-windows.zip
unzip platform-tools-latest-windows.zip
pause




