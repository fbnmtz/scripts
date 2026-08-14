#!/usr/bin/env bash
#
# ############################################################################
# Project: scripts (none)
# File...: labs/lin/lin-limpar-navegadores.sh
# Created: Friday, 2026/08/14 - 14:40:03
# Author.: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Friday, 2026/08/14 - 15:01:47
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.0.1.1
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  >
# ############################################################################
# HISTORY:
#

# Define a variável do usuário
USUARIO="aluno"
DIRETORIO="/home/$USUARIO"

echo "Iniciando a limpeza dos dados do usuário: $USUARIO..."

# 1. Google Chrome
rm -rf "$DIRETORIO/.config/google-chrome"
rm -rf "$DIRETORIO/.cache/google-chrome"

# 2. Chromium
rm -rf "$DIRETORIO/.config/chromium"
rm -rf "$DIRETORIO/.cache/chromium"

# 3. Microsoft Edge
rm -rf "$DIRETORIO/.config/microsoft-edge"
rm -rf "$DIRETORIO/.cache/microsoft-edge"

# 4. Brave Browser
rm -rf "$DIRETORIO/.config/BraveSoftware"
rm -rf "$DIRETORIO/.cache/BraveSoftware"

# 5. Opera e Opera GX
rm -rf "$DIRETORIO/.config/opera"
rm -rf "$DIRETORIO/.cache/opera"
rm -rf "$DIRETORIO/.config/opera-gx"
rm -rf "$DIRETORIO/.cache/opera-gx"

# 6. Mozilla Firefox
rm -rf "$DIRETORIO/.mozilla/firefox"
rm -rf "$DIRETORIO/.cache/mozilla/firefox"

# 7. Safari e genéricos
rm -rf "$DIRETORIO/.config/safari"
rm -rf "$DIRETORIO/.cache/safari"

echo "Limpeza concluída com sucesso!"

