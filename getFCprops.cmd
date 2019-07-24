@echo off
cd Tools 
adb shell grep -i 'device id' /data/upgrade/backup/*.cfg.sig
adb shell grep -i 'firmware formal' /data/upgrade/backup/*.cfg.sig
adb shell grep -i '0306' /data/upgrade/backup/*.cfg.sig
adb shell cd /vendor/bin/; ls
pause
