# Used to patch system files into this repository

FILES_DIR=./files/

cp ~/.zshrc ${FILES_DIR}
cp ~/.config/starship.toml ${FILES_DIR}
dconf dump /org/gnome/ > ${FILES_DIR}gnome.dconf
cp ~/.config/neofetch/config.conf ${FILES_DIR}/neofetch.conf
cp ~/.config/kitty/kitty.conf ${FILES_DIR}