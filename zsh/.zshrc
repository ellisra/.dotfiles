source ~/.dotfiles/zsh/.zsh_paths

# Only enable work settings inside WSL instances
if grep -q Microsoft /proc/version 2>/dev/null; then
    source ~/.dotfiles/zsh/.zsh_work_settings
fi

export OBSIDIAN_REST_API_KEY=API_KEY

plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Set-up icons for files/folders in terminal using eza
alias ls='eza --icons'
alias ll='eza -al --icons'
alias la='eza -a --icons'
alias lt='eza -a --tree --level=1 --icons'

eval "$(oh-my-posh init zsh --config $HOME/.dotfiles/oh-my-posh/robert-russel.toml)"
