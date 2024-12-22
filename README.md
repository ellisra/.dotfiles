# Dotfiles
These are my personal configuration files, feel free to copy all or any part of them :). Configuration files for apps which I'm not currently using can be found on the `archive` branch of this repository. To use any of these configurations as is simply clone the repo and use `stow {program}` for the program you want to configure.

#### Requirements
- GNU-stow if you want to use it to manage dotfiles from the repository directory

##### Neovim
- Latest stable neovim release
- `make`, `unzip`, `gcc`
- `ripgrep` for telescope
- A nerd font (I use JetBrainsMono)
- Any LSPs you require installed via system package manager
- `xclip` or `wl-clipboard` depending if you are in an X11 or Wayland session

##### Zsh
- `zsh`, `eza`, `fzf`
- Oh My Zsh `sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- zsh-syntax-highlighting `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
- zsh-autosuggestions `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
- Oh My Posh `curl -s https://ohmyposh.dev/install.sh | bash -s`
