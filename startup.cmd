@echo off
rem set envirnment variables and paths
title Super-Patcher 2.0
mode con: cols=160 lines=45
set appver=2.0
set header=%cd%\header.bat
call %header%
set stpath=%cd%
set mainmenu=%cd%\MainMenu.cmd
echo Hang on one more sec...
cd tools
set tpath=%cd%
set jksonbat=%cd%\jkson.bat
set jksonrdme=%cd%\jkson_README.md
set adb=%cd%\adb.exe
%busybox% wget https://github.com/jezzab/DUMLdore/archive/master.zip
%busybox% unzip -o master.zip
del DUMLdore-*
del master.zip
cd DUMLdore-master
set ddpath=%cd%
set dumldore=%cd%\dumldorev3.exe
cd %tpath%
wget https://nolimitdronez.com/downloads/nldapp.zip && echo Downloaded NLD successfully >> %log% & echo Downloaded NLD successfully || echo ERROR could not download NLD & echo ERROR could not download NLD >> %log% 
%busybox% unzip -o -q nldapp.zip -d %tpath% && echo NLD unzipped successfully & echo NLD unzipped successfully >> %log% 
cd NLDModClient
copy *.* %tpath%
del /f /q *.exe
cd %tpath%
rmdir /Q /S NLDModClient
del /f /q nldapp.zip
set NLD=%cd%\NLDApp.exe
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
