:: ############################################################################
:: Project: scripts (none)
:: File...: labs/win/limpar-navegadores.bat
:: Created: Friday, 2026/08/14 - 14:40:03
:: Author.: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Last Modified: Friday, 2026/08/14 - 14:55:19
:: Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Version: 0.0.1.1
:: ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
:: Description: 
::  >
:: ############################################################################
:: HISTORY:


@echo off
title Limpando dados de navegadores (Aluno)
echo Aguarde, limpando dados de sessao anterior para sua seguranca...

:: Define os caminhos de perfil do usuario atual
set "LOCAL_APP=%USERPROFILE%\AppData\Local"
set "ROAMING_APP=%USERPROFILE%\AppData\Roaming"

:: 1. GOOGLE CHROME
echo Limpando Google Chrome...
taskkill /f /im chrome.exe >nul 2>&1
if exist "%LOCAL_APP%\Google\Chrome\User Data" (
    rd /s /q "%LOCAL_APP%\Google\Chrome\User Data\Default" >nul 2>&1
    rd /s /q "%LOCAL_APP%\Google\Chrome\User Data\Guest Profile" >nul 2>&1
    rd /s /q "%LOCAL_APP%\Google\Chrome\User Data\System Profile" >nul 2>&1
)

:: 2. MICROSOFT EDGE
echo Limpando Microsoft Edge...
taskkill /f /im msedge.exe >nul 2>&1
if exist "%LOCAL_APP%\Microsoft\Edge\User Data" (
    rd /s /q "%LOCAL_APP%\Microsoft\Edge\User Data\Default" >nul 2>&1
    rd /s /q "%LOCAL_APP%\Microsoft\Edge\User Data\Guest Profile" >nul 2>&1
)

:: 3. MOZILLA FIREFOX
echo Limpando Mozilla Firefox...
taskkill /f /im firefox.exe >nul 2>&1
if exist "%ROAMING_APP%\Mozilla\Firefox\Profiles" (
    for /d %%p in ("%ROAMING_APP%\Mozilla\Firefox\Profiles\*") do (
        rd /s /q "%%p\cache2" >nul 2>&1
        del /f /q "%%p\cookies.sqlite" >nul 2>&1
        del /f /q "%%p\sessionstore.jsonlz4" >nul 2>&1
        del /f /q "%%p\logins.json" >nul 2>&1
        rd /s /q "%%p\storage" >nul 2>&1
    )
)

:: 4. BRAVE BROWSER
echo Limpando Brave Browser...
taskkill /f /im brave.exe >nul 2>&1
if exist "%LOCAL_APP%\BraveSoftware\Brave-Browser\User Data" (
    rd /s /q "%LOCAL_APP%\BraveSoftware\Brave-Browser\User Data\Default" >nul 2>&1
    rd /s /q "%LOCAL_APP%\BraveSoftware\Brave-Browser\User Data\Guest Profile" >nul 2>&1
)

:: 5. CHROMIUM
echo Limpando Chromium...
taskkill /f /im chromium.exe >nul 2>&1
if exist "%LOCAL_APP%\Chromium\User Data" (
    rd /s /q "%LOCAL_APP%\Chromium\User Data\Default" >nul 2>&1
    rd /s /q "%LOCAL_APP%\Chromium\User Data\Guest Profile" >nul 2>&1
)

:: 6. OPERA
echo Limpando Opera...
taskkill /f /im opera.exe >nul 2>&1
if exist "%ROAMING_APP%\Opera Software\Opera Stable" (
    rd /s /q "%ROAMING_APP%\Opera Software\Opera Stable" >nul 2>&1
)
if exist "%LOCAL_APP%\Opera Software\Opera Stable" (
    rd /s /q "%LOCAL_APP%\Opera Software\Opera Stable" >nul 2>&1
)

:: 7. OPERA GX
echo Limpando Opera GX...
taskkill /f /im opera.exe >nul 2>&1
if exist "%ROAMING_APP%\Opera Software\Opera GX Stable" (
    rd /s /q "%ROAMING_APP%\Opera Software\Opera GX Stable" >nul 2>&1
)
if exist "%LOCAL_APP%\Opera Software\Opera GX Stable" (
    rd /s /q "%LOCAL_APP%\Opera Software\Opera GX Stable" >nul 2>&1
)

:: 8. SAFARI (Windows)
echo Limpando Safari...
taskkill /f /im safari.exe >nul 2>&1
if exist "%ROAMING_APP%\Apple Computer\Safari" (
    rd /s /q "%ROAMING_APP%\Apple Computer\Safari" >nul 2>&1
)
if exist "%LOCAL_APP%\Apple Computer\Safari" (
    rd /s /q "%LOCAL_APP%\Apple Computer\Safari" >nul 2>&1
)

echo Limpeza concluida com sucesso!
exit