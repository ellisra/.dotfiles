#!/usr/bin/env bash

sudo dnf copr enable che/nerd-fonts

sudo dnf install git curl nerd-fonts zsh eza fzf kitty neovim make unzip gcc ripgrep xclip wl-clipboard cargo

cargo install pfetch

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

curl -s https://ohmyposh.dev/install.sh | bash -s
