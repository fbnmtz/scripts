#!/usr/bin/env bash
#
# ############################################################################
# Project: scripts (none)
# File...: labs/lin/lin-config-ansible.sh
# Created: Friday, 2026/08/14 - 14:40:03
# Author.: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Friday, 2026/08/14 - 15:01:30
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.0.1.1
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  >
# ############################################################################
# HISTORY:
#

# Create the user
sudo adduser ansible

# Grant sudo privileges (allows the user to run any command as root without a password)
sudo usermod -aG sudo ansible # (Use 'wheel' instead of 'sudo' if on CentOS/RHEL/Rocky Linux)
echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible

#
#Step 2: Configure SSH Key-Based Authentication (from the Control Node)From your Ansible server, generate an SSH key and copy it to the Linux client so it can authenticate without typing a password:bash# Generate SSH key on the Ansible Control Node (if you don't already have one)
#ssh-keygen -t ed25519
#
# Copy the key to your client (Replace 192.168.1.50 with your Linux client's actual IP)
#ssh-copy-id ansible@192.168.1.50
#Use o código com cuidado.Step 3: Test the connectionOnce the SSH key is copied, verify you can connect and run commands from the Ansible server:bash# Test basic ping connection using the ansible user
#ansible all -i '192.168.1.50,' -u ansible -m ping

