@echo off
title Super-Patcher 2.0
cls 
call header.bat
ECHO. 
ECHO  Please choose your Aircraft
ECHO.
ECHO ----------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO	1) Mavic Pro 1 / Mavic Platinum / Mavic Artic White
ECHO	2) Spark
ECHO	3) Phantom 4 Pro
ECHO	4) Phantom 4 Standard
ECHO	5) Phantom 4 Advanced
ECHO	6) Phantom 4 Pro V2
ECHO	7) Inspire 2
ECHO.
choice /C 1234567 /D 1 /T 99 /M "Please select connected device"
If Errorlevel 7 goto I2
If Errorlevel 6 goto P4Pv2
If Errorlevel 5 goto p4a
If Errorlevel 4 goto p4s
If Errorlevel 3 goto p4p
If Errorlevel 2 goto SPK
If Errorlevel 1 goto MP

:MP
set AC=MavicPro
set fcbase=03.02.44.
set stock=01.04.0300
set vt=1
set stockfw=V01.04.0300_Mavic_dji_system.bin
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Mavic%%20Pro%%201%%20-%%20Incl%%20Platinum%%20and%%20Alpine/V01.04.0300_Mavic_dji_system.bin
set standard=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/MavicPro/FC_bin/MavicPro_SP_2.0_standard_03.02.44.22_dji_system.bin
set battmod=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/MavicPro/FC_bin/MavicPro_SP_2.0_batt-mod_03.02.44.12_dji_system.bin
set stealth=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/MavicPro/FC_bin/MavicPro_SP_2.0_Stealth_03.02.44.21_dji_system.bin
set battmodstealth=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/MavicPro/FC_bin/MavicPro_SP_2.0_Fully-Loaded_03.02.44.11_dji_system.bin

goto mainmenu

:SPK
set AC=Spark
set fc=03.02.43.09
set stock=1.00.0900
set vt=1
set stockfw=V01.00.0900_Spark_dji_system.bin
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Spark/V01.00.0900_Spark_dji_system.bin
set standard=
set battmod=
set stealth=
set loaded=
goto mainmenu

:p4p
set AC=P4P
set fc=3.02.44.31
set stock=1.05.0600
set vt=2
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4P_Super-Patcher_FC/P4P_wm331_Super_Patcher_0306_03.02.44.31_dji_system.bin
set fw2=P4P_wm331_Super_Patcher_0306_03.02.44.31_dji_system.bin
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Phantom%%204%%20Professional/V01.05.0600_P4P_dji_system.tar
set stockfw=V01.05.0600_P4P_dji_system.tar
set stockdl=
set standard=
set battmod=
set stealth=
set loaded=
goto mainmenu

:p4a
set AC=P4A
set fc=3.02.35.32
set stock=01.00.0128
set vt=2
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4Advanced_Super_Patcher_FC/P4Advanced_wm332_Super_Patcher_FC_0306_03.02.35.32_dji_system.bin
set fw2=P4Advanced_wm332_Super_Patcher_FC_0306_03.02.35.32_dji_system.bin
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Phantom%%204%%20Advanced/V01.00.0128_P4A_dji_system.bin
set stockfw=V01.00.0128_P4A_dji_system.bin
set stockdl=
set standard=
set battmod=
set stealth=
set loaded=
goto mainmenu

:p4s
set AC=P4Standard
set fc=3.02.44.33
set stock=2.00.0700 
set vt=2
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4Standard_Super_Patcher_FC/P4Standard_wm330_0306_03.02.44.33_Super_Patcher_dji_system.bin
set fw2=P4Standard_wm330_0306_03.02.44.33_Super_Patcher_dji_system_.bin
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Phantom%%204%%20Standard/V02.00.0700_P4_dji_system.bin
set stockfw=V02.00.0700_P4_dji_system.bin
set stockdl=
set standard=
set battmod=
set stealth=
set loaded=
goto mainmenu

:P4Pv2
set AC=P4Pv2
set fc=3.03.04.35
set stock=1.00.1500
set vt=2
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4Pv2_FLIGHT_CONTROLLERS/P4PV2_Super_Patcher_FC/P4PV2_wm335_Super_Patcher_0306_03.03.04.35_dji_system.bin
set fw2=P4PV2_wm335_Super_Patcher_0306_03.03.04.35_dji_system.bin
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Phantom%%204%%20Pro%%202.0/V01.00.1500_P4PV2_dji_system.bin
set stockfw=V01.00.1500_P4PV2_dji_system.bin
set stockdl=
set standard=
set battmod=
set stealth=
set loaded=
goto mainmenu

:I2
set AC=I2
set fc=03.03.11.11
set stock=V01.02.0200
set vt=1
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/I2/I2_SP_2.0/I2_SP_2.0_03.03.11.11_dji_system.bin
set fw2=I2_SP_2.0_03.03.11.11_dji_system.bin
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Inspire%%202/V01.02.0200_I2_dji_system.bin
set stockfw=V01.02.0200_I2_dji_system.bin
set stockdl=
set standard=
set battmod=
set stealth=
set loaded=
goto mainmenu

:mainmenu
call MainMenu.cmd

