#!/usr/bin/env bash
#
# ############################################################################
# Project: scripts (none)
# File...: labs/lin/lin-rdp-install.sh
# Created: Friday, 2026/08/14 - 14:40:03
# Author.: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Friday, 2026/08/14 - 15:02:06
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.0.1.1
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  >
# ############################################################################
# HISTORY:
#

# Atualiza os repositórios e pacotes do sistema
sudo apt update && sudo apt upgrade -y

# Instala um ambiente gráfico (caso já não tenha). O XFCE é leve e recomendado para RDP.
sudo apt install xfce4 xfce4-goodies -y

# Instala o XRDP
sudo apt install xrdp -y

# Configura o XRDP para usar o XFCE
echo "xfce4-session" > ~/.xsession

# Habilita o serviço para iniciar junto com o sistema
sudo systemctl enable --now xrdp

# Permite conexões RDP no firewall (Porta 3389)
sudo ufw allow 3389/tcp
sudo ufw reload

echo "Instalação concluída! O seu endereço IP atual é:"
hostname -I | awk '{print $1}'

