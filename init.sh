#!/bin/bash

# Only run if zsh is not installed since we need to quit session beforehand
if ! command -v zsh &> /dev/null
then
    # Update initial system installation
    sudo apt update
    sudo apt upgrade -y

    # HTTPie
    sudo apt install -y httpie

    # Gnome Extensions
    http -dbo /tmp/arcmenu.zip https://extensions.gnome.org/extension-data/arcmenuarcmenu.com.v42.shell-extension.zip
    sudo unzip -d /usr/share/gnome-shell/extensions/arcmenu@arcmenu.com /tmp/arcmenu.zip
    sudo chmod +r /usr/share/gnome-shell/extensions/arcmenu@arcmenu.com/metadata.json

    http -dbo /tmp/mprislabel.zip https://extensions.gnome.org/extension-data/mprisLabelmoon-0xff.github.com.v7.shell-extension.zip
    sudo unzip -d /usr/share/gnome-shell/extensions/mprisLabel@moon-0xff.github.com /tmp/mprislabel.zip
    sudo chmod +r /usr/share/gnome-shell/extensions/mprisLabel@moon-0xff.github.com/metadata.json

    http -dbo /tmp/justperfection.zip https://extensions.gnome.org/extension-data/just-perfection-desktopjust-perfection.v22.shell-extension.zip
    sudo unzip -d /usr/share/gnome-shell/extensions/just-perfection-desktop@just-perfection /tmp/justperfection.zip
    sudo chmod +r /usr/share/gnome-shell/extensions/just-perfection-desktop@just-perfection/metadata.json

    # zsh
    sudo apt install -y zsh
    cp ./files/.zshrc ~/.zshrc
    chsh -s $(which zsh)
    gnome-session-quit --no-prompt
fi

# Victor Mono Nerd Font
VICTOR_INSTALL_DIR=/tmp/victormono.zip
VICTOR_DOWNLOAD_URL=https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/VictorMono.zip
http -dbo ${VICTOR_INSTALL_DIR} ${VICTOR_DOWNLOAD_URL}
mkdir ~/.fonts
unzip -d ~/.fonts/victormono ${VICTOR_INSTALL_DIR}
fc-cache -f -v

# Starship theme
curl -sS https://starship.rs/install.sh | sh
cp ${FILES_DIR}starship.toml ~/.config/starship.toml