#!/bin/bash

# Docker preflight
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# zsh syntax highlighting preflight
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-syntax-highlighting/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-syntax-highlighting.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-syntax-highlighting.gpg > /dev/null

# zsh autosuggestions preflight
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-autosuggestions/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-autosuggestions.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-autosuggestions.gpg > /dev/null

# yq preflight
sudo add-apt-repository ppa:rmescandon/yq

# diff-so-fancy preflight
sudo add-apt-repository ppa:aos1/diff-so-fancy

# HashiCorp preflight
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

CMD_TOOLS=(
  "bat" "exa" "neofetch" "yank" "yq" "cmake" "cloc" "mlocate" "diff-so-fancy"
  "zsh-syntax-highlighting" "zsh-autosuggestions"
  "docker-ce" "docker-ce-cli" "containerd.io" "docker-compose-plugin"
  "terraform" "vagrant" "packer"
  "virtualbox"
  "git-flow"
  "golang"
  "gnome-shell-extensions"
)
sudo apt install -y ${CMD_TOOLS[*]}

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install --lts

# bashmarks
git clone https://github.com/huyng/bashmarks.git /tmp/bashmarks
(cd /tmp/bashmarks && make install)

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# SDKMan
curl -s "https://get.sdkman.io" | bash
