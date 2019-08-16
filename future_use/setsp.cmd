@echo off
title DJI Super-Patcher 2.0
mode con: cols=160 lines=45
set busybox=%cd%\busybox.exe
rmdir /Q /S nonemptydir logs 2>>nul
del logs 2>>nul
md logs 2>>nul
md Stock_Firmware 2>>nul
md Flight_Controllers 2>>nul
set sppath=%cd%
cd logs
set lpath=%cd%
echo Start Super-Patcher > log.txt
set log=%cd%\log.txt
echo %date%_%time% >> %log%
cd %sppath%
cd Stock_Firmware
set sfpath=%cd%
cd %sppath%
cd Flight_Controllers
set fcpath=%cd%
cd %sppath%
call start.exe