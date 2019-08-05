@echo off
adb shell grep -i 'device id' /data/upgrade/backup/*.cfg.sig > devicetmp.txt
for /f "tokens=1-3 delims==>" %%A in (devicetmp.txt) do (set device=%%B)
Echo Device=%device%
adb shell grep -i 'firmware formal' /data/upgrade/backup/*.cfg.sig > firmwaretmp.txt
for /f "tokens=1-2 delims==>" %%A in (firmwaretmp.txt) do (set cfw=%%B)
echo Firmware=%cfw%
adb shell grep -i '0306' /data/upgrade/backup/*.cfg.sig > FCtmp.txt
for /f "tokens=2-4" %%A in (fctmp.txt) do (set curFC=%%B)
echo FC %curFC%
del /f /q *tmp.txt
pause
