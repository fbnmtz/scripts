#!/usr/bin/env bash
#
# ############################################################################
# Project: scripts (none)
# File...: labs/lin/lin-ssh-server-install.sh
# Created: Friday, 2026/08/14 - 14:40:03
# Author.: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Friday, 2026/08/14 - 15:01:54
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.0.1.1
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  >
# ############################################################################
# HISTORY:
#

# Atualiza a lista de pacotes e o sistema
sudo apt update && sudo apt upgrade -y

# Instala o servidor OpenSSH
sudo apt install openssh-server -y

# Inicia o serviço e garante que ele rode ao ligar o sistema
sudo systemctl start ssh
sudo systemctl enable ssh

# Habilita o firewall e libera a porta padrão do SSH (22)
sudo ufw enable
sudo ufw allow ssh

# Exibe o status atual do serviço SSH para confirmar a instalação
sudo systemctl status ssh

