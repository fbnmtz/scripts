#!/usr/bin/env bash
#
# ############################################################################
# Project: scripts (none)
# File...: labs/lin/lin-config-limpar-navegadores.sh
# Created: Friday, 2026/08/14 - 14:40:03
# Author.: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Friday, 2026/08/14 - 15:01:38
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.0.1.1
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  >
# ############################################################################
# HISTORY:
#

# Garante que o script está sendo rodado como Root/Sudo
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute este script como root ou usando sudo."
  exit 1
fi

echo "1/4 - Movendo o script de limpeza para o sistema..."
cp /media/aluno/Ventoy/lin-limpar-navegadores.sh /usr/local/bin/limpar_navegadores.sh
chmod +x /usr/local/bin/limpar_navegadores.sh

echo "2/4 - Criando o diretório autostart para o usuário aluno..."
mkdir -p /home/aluno/.config/autostart

echo "3/4 - Gerando o arquivo de inicialização .desktop..."
cat << 'EOF' > /home/aluno/.config/autostart/limpar_navegadores.desktop
[Desktop Entry]
Type=Application
Exec=/usr/local/bin/limpar_navegadores.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Limpar Navegadores
Comment=Apaga dados de navegação no login
EOF

echo "4/4 - Ajustando as permissões para o usuário aluno..."
chown -R aluno:aluno /home/aluno/.config

echo "Configuração concluída com sucesso! O script rodará no próximo login do aluno."

