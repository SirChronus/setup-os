# Used to patch system files into this repository

FILES_DIR=./files/

cp ~/.zshrc ${FILES_DIR}
cp ~/.config/starship.toml ${FILES_DIR}
dconf dump /org/gnome/terminal/legacy/profiles:/ > ${FILES_DIR}gnome-terminal-profiles.dconf
cp ~/.config/neofetch/config.conf ${FILES_DIR}/neofetch.conf
cp ~/.config/kitty/kitty.conf ${FILES_DIR}