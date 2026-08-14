:: ############################################################################
:: Project: scripts (none)
:: File...: labs/win/win-logon-no-splash-msg.bat
:: Created: Friday, 2026/08/14 - 15:16:08
:: Author.: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Last Modified: Friday, 2026/08/14 - 15:16:11
:: Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Version: 0.0.1.2
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Description: 
::  >
:: ############################################################################
:: HISTORY:

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v ScoobeSystemSettingEnabled /t REG_DWORD /d 0 /f