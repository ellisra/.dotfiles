# Dotfiles
## Installation
### Requirements
#### General
- `git`
- `curl`
- nerd font (e.g. JetBrains Mono)
- `cargo`

#### Shell
##### Zsh
- `zsh`
- `eza`
- `fzf`
- pfetch-rs `cargo install pfetch`

##### Oh-My-Zsh
- Oh My Zsh `sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- zsh-syntax-highlighting `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
- zsh-autosuggestions `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

##### Oh-My-Posh
- `curl -s https://ohmyposh.dev/install.sh | bash -s`

#### Kitty
- `kitty`

#### Neovim
- Latest stable `neovim` release
- `make`, `unzip`, `gcc`, `ripgrep`, `xclip`, `wl-clipboard`

#### Window Managers
##### Wayland WM
###### General
- `waybar`

###### Sway
- `sway` or [SwayFX](https://github.com/WillPower3309/swayfx)

##### X11 WM
###### General
- `picom`

###### Qtile
- `qtile`

### Install Scripts
Installation scripts can be found for Arch based distros, Fedora, and Void in the `scripts/install/` directory. These install the general requirements as well as the shell requirements. Window manager requirements are left to be installed manually depending on the choice of WM you make.
