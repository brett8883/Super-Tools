@echo off
::set envirnment variables and paths
title Super-Patcher 2.0
mode con: cols=160 lines=45
set appver=2.0
set stpath=%sppath%\Super-tools-%branch%
set header=%sppath%\Super-tools-%branch%\header.bat
call %header%
set mainmenu=%sppath%\Super-tools-%branch%\MainMenu.cmd
echo Hang on one more sec...
cd tools
set tpath=%sppath%\Super-tools-%branch%\tools
set jksonbat=%sppath%\Super-tools-%branch%\tools\jkson.bat
set adb=%sppath%\Super-tools-%branch%\tools\adb.exe
cd tools
%busybox% wget -q https://github.com/jezzab/DUMLdore/archive/master.zip
%busybox% unzip -o -q master.zip
del DUMLdore-*
del master.zip
cd DUMLdore-master
set ddpath=%sppath%\Super-tools-%branch%\tools\DUMLdore-master\
set "dumldore=%sppath%\Super-tools-%branch%\tools\DUMLdore-master\dumldorev3.exe"
cd %tpath%
wget https://nolimitdronez.com/downloads/nldapp.zip && echo Downloaded NLD successfully >> %log% & echo Downloaded NLD successfully || echo ERROR could not download NLD & echo ERROR could not download NLD >> %log%
%busybox% unzip -o -q nldapp.zip -d %tpath% && echo NLD unzipped successfully & echo NLD unzipped successfully >> %log%
cd NLDModClient
copy *.* %tpath%
del /f /q *.exe
cd %tpath%
rmdir /Q /S NLDModClient
del /f /q nldapp.zip
set "NLD=%sppath%\Super-tools-%branch%\tools\nldapp.exe"
cd %stpath%
goto skip

:skipthis
cls
cd %sppath%
Echo intro has been read, don't show again > DontShowIntro
echo %DATE%_%TIME% >> DontShowIntro
goto skip

:skip
cd %stpath%
call whichac.cmd
