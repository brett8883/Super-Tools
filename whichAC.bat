@echo off
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
ECHO.
ECHO  Please choose your Aircraft
ECHO.
ECHO -------------------------------------------------------------------------------------------
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
@Echo off
cls
set AC=MavicPro
set fc=3.02.44.10
set stock=01.04.0300
set vt=1
set whichverify=mpspk_verify.bat
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/MavicPro_MPP_super_patcher_03.02.44.10_dji_system.bin
set fw2=MavicPro_MPP_super_patcher_03.02.44.10_dji_system.bin
goto download

:SPK
@echo off
cls
set AC=Spark
set fc=3.02.43.09
set stock=1.00.0900
set vt=1
set whichverify=mpspk_verify.bat
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/Spark_Super_Patcher_FC/Spark_Super-Patcher_306_03.02.43.09_dji_system.bin
set fw2=Spark_Super-Patcher_306_03.02.43.09_dji_system.bin
goto download

:p4p
@echo off
cls
set AC=P4P
set fc=3.02.44.32
set stock=1.05.0600
set vt=2
set whichverify=phantom_verify.bat
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4P_Super-Patcher_FC/P4P_SP_2.0_03.02.44.32_dji_system.bin
set fw2=P4P_SP_2.0_03.02.44.32_dji_system.bin
goto download

:p4a
@echo off
cls
set AC=P4A
set fc=3.02.35.32
set stock=01.00.0128
set vt=2
set whichverify=phantom_verify.bat
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4Advanced_Super_Patcher_FC/P4Advanced_wm332_Super_Patcher_FC_0306_03.02.35.32_dji_system.bin
set fw2=P4Advanced_wm332_Super_Patcher_FC_0306_03.02.35.32_dji_system.bin
goto download

:p4s
@echo off
cls
set AC=P4Standard
set fc=3.02.44.33
set stock=2.00.0700
set vt=2
set whichverify=phantom_verify.bat
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4Standard_Super_Patcher_FC/P4Standard_wm330_0306_03.02.44.33_Super_Patcher_dji_system.bin
set fw2=P4Standard_wm330_0306_03.02.44.33_Super_Patcher_dji_system_.bin
goto download

:P4Pv2
cls
set AC=P4Pv2
set fc=3.03.04.36
set stock=1.00.1500
set vt=1
set whichverify=mpspk_verify.bat
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/master/P4Pv2/P4PV2_V01.00.1500_Super_Patcher_FC/P4Pv2_V01.00.1500_SP_SBA_SRA_fly_limit_9000_03.03.04.36_dji_system.bin
set fw2=P4Pv2_V01.00.1500_SP_SBA_SRA_fly_limit_9000_03.03.04.36_dji_system.bin
goto download

:I2
set AC=I2
set fc=03.03.11.11
set stock=1.02.0200
set vt=2
set whichverify=mpspk_verify.bat
set fw=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/I2/I2_SP_2.0/I2_SP_2.0_03.03.11.11_dji_system.bin
set fw2=I2_SP_2.0_03.03.11.11_dji_system.bin
goto download

:download
cls
ECHO -------------------------------------------------------------------------------------------
ECHO Super Patcher %appver%
ECHO By Brett8883
ECHO -------------------------------------------------------------------------------------------
echo Hold on just a sec...
wget %fw%
copy *.bin ..
del *.bin
cd ..
echo %vt%
echo %AC%
echo %stock%
echo %fc%
cd Super-Tools-%branch%
call %whichverify%
