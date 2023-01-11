#!/bin/bash

# kitty terminal emulator
sudo apt install -y kitty
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty
DRACULA_KITTY_INSTALL_DIR=/tmp/kitty_dracula.zip
DRACULA_KITTY_DOWNLOAD_URL=https://github.com/dracula/kitty/archive/master.zip
http -dbo ${DRACULA_KITTY_INSTALL_DIR} ${DRACULA_KITTY_DOWNLOAD_URL}
unzip -d /tmp/kitty_dracula ${DRACULA_KITTY_INSTALL_DIR}
mkdir -p ~/.config/kitty
cp /tmp/kitty_dracula/kitty-master/dracula.conf /tmp/kitty_dracula/kitty-master/diff.conf ~/.config/kitty
echo "include dracula.conf" >> ~/.config/kitty/kitty.conf 
cp ./files/kitty.conf ~/.config/kitty/kitty.conf

# Visual Studio Code
VSCODE_INSTALL_DIR=/tmp/vscode.deb
VSCODE_DOWNLOAD_URL=https://code.visualstudio.com/sha/download
VSCODE_BUILD=stable

http -dbo ${VSCODE_INSTALL_DIR} ${VSCODE_DOWNLOAD_URL} build==${VSCODE_BUILD} os==linux-deb-x64
sudo apt install -y ${VSCODE_INSTALL_DIR}

# Discord
DISCORD_INSTALL_DIR=/tmp/discord.deb
DISCORD_DOWNLOAD_URL=https://discord.com/api/download
http -dbo ${DISCORD_INSTALL_DIR} ${DISCORD_DOWNLOAD_URL} platform==linux format==deb
sudo apt install -y ${DISCORD_INSTALL_DIR}

# Postman
http -dbo /tmp/postman.tar.gz https://dl.pstmn.io/download/latest/linux64
sudo tar xvf /tmp/postman.tar.gz -C /opt/
sudo ln -sf /opt/Postman/app/Postman /usr/bin/postman
cp ./files/postman.desktop ~/.local/share/applications/postman.desktop

# Chrome
http -dbo /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y /tmp/chrome.deb

# Planner
flatpak install -y flathub com.github.alainm23.planner

# JetBrains Toolbox
http -dbo /tmp/jetbrains-toolbox.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.27.2.13801.tar.gz
sudo tar -xzf /tmp/jetbrains-toolbox.tar.gz -C /opt

# DBeaver
flatpak install -y flathub io.dbeaver.DBeaverCommunity

# Amberol
flatpak install flathub io.bassi.Amberol

# Trilium
flatpak install flathub com.github.zadam.trilium