@echo off
mode con: cols=101 lines=40
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
adb kill-server
cls
SETLOCAL EnableDelayedExpansion
set appver=1.7.1
call whichAC.bat
