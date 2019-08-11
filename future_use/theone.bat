@echo off
adb shell grep -i 'device id' /data/upgrade/backup/*.cfg.sig > devicetmp.txt
for /f "tokens=1-3" %%A in (devicetmp.txt) do echo Device%%B
set "Device=%%B"
echo %device%
adb shell grep -i 'firmware formal' /data/upgrade/backup/*.cfg.sig > firmwaretmp.txt
for /f "tokens=1-2 delims==" %%A in (firmwaretmp.txt) do echo firmwareVersion=%%B
adb shell grep -i '0306' /data/upgrade/backup/*.cfg.sig > FCtmp.txt
for /f "tokens=2-3" %%A in (fctmp.txt) do echo FC#%%B
del *tmp.txt
pause
