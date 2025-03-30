source ~/.dotfiles/zsh/.zsh_paths

if [ -f /proc/version ] && grep -q Microsoft /proc/version; then
    source ~/.dotfiles/zsh/.zsh_work_settings
else
    export OBSIDIAN_REST_API_KEY="d963040f65b48167c66eb822e7699064e14b016aabc3245e432cc4b50376746c"
fi

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim

PROMPT_EOL_MARK=''
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Set-up icons for files/folders in terminal using eza
alias ls='eza --icons'
alias ll='eza -al --icons'
alias la='eza -a --icons'
alias lt='eza -a --tree --level=1 --icons'

# Other aliases
# Make and cd into new directory
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Make new file and open in vscode
toad() {
    touch "$1" && code "$1"
}

alias lg='lazygit'
# alias e='nvim'

eval "$(oh-my-posh init zsh --config $HOME/.dotfiles/oh-my-posh/robert-russel.toml)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
#
# . "$HOME/.local/bin/env"
