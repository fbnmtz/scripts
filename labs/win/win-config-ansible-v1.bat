:: ############################################################################
:: Project: scripts (none)
:: File...: labs/win/win-config-ansible-v1.bat
:: Created: Friday, 2026/08/14 - 14:39:25
:: Author.: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Last Modified: Friday, 2026/08/14 - 15:18:18
:: Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Version: 0.0.1.6
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Description: 
::  >
:: ############################################################################
:: HISTORY:


:: net user suporte AAAAAAAAAAAA /add
:: cria o usuario "ansible" com a senha "ansible" 
net user ansible AAAAAAAAAAAA /add
:: adiciona aos administradores
net localgroup Administradores ansible /add

:: oculta o usuário na tela de LOGIN
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v "ansible" /t REG_DWORD /d 0 /f

# winrm quickconfig -q
# winrm enumerate winrm/config/Listener

