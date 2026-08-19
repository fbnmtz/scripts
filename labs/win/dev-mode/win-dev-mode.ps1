#
# ############################################################################
# Project: scripts (none)
# File...: labs/win/dev-mode/win-dev-mode.ps1
# Created: Wednesday, 2026/08/19 - 10:41:20
# Author.: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Wednesday, 2026/08/19 - 10:41:23
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.0.1.1
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  >
# ############################################################################
# HISTORY:
#

# Verifica e força privilégios de Administrador
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Este script precisa ser executado como Administrador!"
    exit
}

# Caminho da chave de registro
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
$valueName = "AllowDevelopmentWithoutDevLicense"

# Cria a chave/pasta caso não exista
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Define o valor para 1 (Ativado)
Set-ItemProperty -Path $regPath -Name $valueName -Value 1 -Type DWord

Write-Host "Modo de Desenvolvedor ativado com sucesso!" -ForegroundColor Green