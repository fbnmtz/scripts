:: ############################################################################
:: Project: scripts (none)
:: File...: labs/win/win-create-task-shutdown.bat
:: Created: Tuesday, 2026/08/18 - 15:59:10
:: Author.: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Last Modified: Tuesday, 2026/08/18 - 16:01:43
:: Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Version: 0.0.1.2
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Description: 
::  > create a daily task to shutdown the computer
:: ############################################################################
:: HISTORY:

:: CMD
schtasks /create /tn "CTI-SHUTDOWN" /tr "shutdown.exe /s /f" /sc daily /st 23:59   