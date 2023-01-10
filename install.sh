#!/bin/bash

FILES_DIR=./files/

# Initial installation steps and dependencies
./init.sh

# Install command line tools
./cmd.sh

# Install applications
./apps.sh

# Additional configuration
mkdir ~/Pictures/wallpaper
http -dbo ~/Pictures/wallpaper/neofetch.jpg https://w.wallhaven.cc/full/rr/wallhaven-rrdgp1.jpg
http -dbo ~/Pictures/wallpaper/wallpaper.jpg https://w.wallhaven.cc/full/rr/wallhaven-rrdgp1.jpg
# http -dbo ~/Pictures/wallpaper/wallpaper.png https://w.wallhaven.cc/full/d6/wallhaven-d66gq3.png
cp ${FILES_DIR}/neofetch.conf ~/.config/neofetch/config.conf

git config --global init.defaultBranch master

dconf load /org/gnome/ < ${FILES_DIR}gnome.dconf
cat files/background.dconf | sed 's,~,'"$HOME"',' | dconf load /org/gnome/desktop/background/

gnome-extensions enable arcmenu@arcmenu.com
gnome-extensions disable pop-cosmic@system76.com

gnome-extensions enable mprisLabel@moon-0xff.github.com

gnome-extensions enable just-perfection-desktop@just-perfection