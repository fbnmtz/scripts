:: ############################################################################
:: Project: scripts (none)
:: File...: labs/win/dev-mode/win-dev-mode.bat
:: Created: Wednesday, 2026/08/19 - 10:40:53
:: Author.: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Last Modified: Wednesday, 2026/08/19 - 10:41:00
:: Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Version: 0.0.1.1
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Description: 
::  >
:: ############################################################################
:: HISTORY:

@echo off
:: Ativa o Modo de Desenvolvedor no Windows 11
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v AllowDevelopmentWithoutDevLicense /t REG_DWORD /d 1 /f

if %errorlevel% equ 0 (
    echo [SUCESSO] Modo de Desenvolvedor ativado com sucesso!
) else (
    echo [ERRO] Falha ao ativar. Execute o script como Administrador.
)
pause