@echo off
::set envirnment variables and paths
title Super-Patcher 2.0
mode con: cols=160 lines=45
set appver=2.0
set stpath="%Appdata%\DJI_super-Patcher\Super-tools-%branch%"
set header="%Appdata%\DJI_super-Patcher\Super-tools-%branch%\header.bat"
call %header%
echo Downloading the latest version of DUMLdore. Please wait...
cd tools
set tpath="%Appdata%\DJI_super-Patcher\Super-tools-%branch%\tools"
set PATH=%path%;%tpath%
wget https://github.com/jezzab/DUMLdore/raw/master/DUMLdoreV3.exe && echo downloaded DUMLdore sucessfully >> %log%
set dumldore="%Appdata%\DJI_super-Patcher\Super-tools-%branch%\tools\DUMLdoreV3.exe"
Echo. >> %log%
call whichac.cmd
