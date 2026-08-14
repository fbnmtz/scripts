:: ############################################################################
:: Project: scripts (none)
:: File...: labs/win/win-config-ssh.bat
:: Created: Friday, 2026/08/14 - 14:39:25
:: Author.: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Last Modified: Friday, 2026/08/14 - 14:53:43
:: Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Version: 0.0.1.1
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Description: 
::  >
:: ############################################################################
:: HISTORY:

:: instala o ssh server
dism /Online /Add-Capability /CapabilityName:OpenSSH.Server~~~~0.0.1.0
:: inicia o servidor
net start sshd
:: habilita a inicializacao automatica
sc config sshd start=auto
:: cria regra de firewall liberando a porta
netsh advfirewall firewall add rule name="SSH" dir=in action=allow protocol=TCP localport=22
