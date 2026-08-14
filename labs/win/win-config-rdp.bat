:: ############################################################################
:: Project: scripts (none)
:: File...: labs/win/win-config-rdp.bat
:: Created: Friday, 2026/08/14 - 14:39:25
:: Author.: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Last Modified: Friday, 2026/08/14 - 14:53:32
:: Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Version: 0.0.1.1
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Description: 
::  >
:: ############################################################################
:: HISTORY:

:: Edite o registro para permitir conexões RDP digitando:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

:: Configure o firewall para aceitar conexões RDP:
netsh advfirewall firewall set rule group="Área de Trabalho Remota" new enable=Yes

:: Confirme que o serviço TermService está em execução:
net start termservice
sc config termservice start=auto
