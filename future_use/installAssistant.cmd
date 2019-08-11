@echo off
cls
call header.bat 
ECHO Please wait while I download Assistant 2 1.1.2 ...
cd tools 
copy wget.exe Assistant_2_files
copy 7za.exe Assistant_2_files
cd Assistant_2_files
wget https://www.sekidorc.com/press/DJI_Assistant2_Installer_v1.1.2_20170527.zip
pause
