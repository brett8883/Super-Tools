@echo off
cls
title Super-Patcher 2.0 DownloadFC
call header.bat
echo Wait just a moment...
echo.
wget %fw%
copy *.bin ..
del *.bin
if "%vt%"=="1" goto mpspk
if "%vt%"=="2" goto phantom

:mpspk
cls
call mpspk_verify.cmd

:phantom
cls
call phantom_verify.cmd

