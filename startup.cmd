@echo off
::set envirnment variables and paths
title Super-Patcher 2.0
mode con: cols=160 lines=45
set appver=2.0
set stpath="%Appdata%\DJI_super-Patcher\Super-tools-%branch%"
set header="%Appdata%\DJI_super-Patcher\Super-tools-%branch%\header.bat"
call %header%
echo Hang on one more sec...
cd tools
set tpath="%Appdata%\DJI_super-Patcher\Super-tools-%branch%\tools"
%busybox% wget -q https://github.com/jezzab/DUMLdore/archive/master.zip
%busybox% unzip -o -q master.zip
del DUMLdore-*
del master.zip
cd DUMLdore-master
set ddpath="%Appdata%\DJI_super-Patcher\Super-tools-%branch%\tools\dumldore-master"
set dumldore="%Appdata%\DJI_super-Patcher\Super-tools-%branch%\tools\dumldore-master\dumldorev3.exe"
cd %tpath%
Echo. >> %log%
Echo Download NLD app >> %log%
wget https://nolimitdronez.com/downloads/nldapp.zip --no-check-certificate 2>> %log%
%busybox% unzip -o -q nldapp.zip -d %tpath%
cd NLDModClient
copy *.* %tpath%
cd %tpath%
rmdir /Q /S NLDModClient
del /f /q nldapp.zip
set NLD="%Appdata%\DJI_super-Patcher\Super-tools-%branch%\tools\nldapp.exe"
cd %stpath%
call whichac.cmd
