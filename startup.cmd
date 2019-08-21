@echo off
::set envirnment variables and paths
title Super-Patcher 2.0
mode con: cols=160 lines=45
set appver=2.0
set stpath="%cd%"
set header="%cd%\header.bat"
call %header%
set mainmenu="%cd%\MainMenu.cmd"
echo Hang on one more sec...
cd tools
set tpath="%cd%"
%busybox% wget -q https://github.com/jezzab/DUMLdore/archive/master.zip
%busybox% unzip -o -q master.zip
del DUMLdore-*
del master.zip
cd DUMLdore-master
set ddpath=%cd%
set dumldore="%ddpath%"\dumldore.exe
cd %tpath%
wget https://nolimitdronez.com/downloads/nldapp.zip
%busybox% unzip -o -q nldapp.zip -d %tpath%
cd NLDModClient
copy *.* %tpath%
del /f /q *.exe
cd %tpath%
rmdir /Q /S NLDModClient
del /f /q nldapp.zip
set NLD=%tpath%\nldapp.exe
cd %stpath%
call whichac.cmd
