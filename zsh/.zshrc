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

# Aliases
alias ls='eza --icons'
alias ll='eza -al --icons'
alias la='eza -a --icons'
alias lt='eza -a --tree --level=1 --icons'

alias sb='cd ~/second-brain'
alias df='cd ~/.dotfiles'

alias lg='lazygit'

alias ga='git add'
alias gc='git commit -m'
alias gu='git pull'
alias gp='git push'
alias gi='git init'
alias gs='git switch'
alias gcl='git clone'
alias gss='git stash save temp'
alias gsp='git stash pop'

# Other aliases
# Make and cd into new directory
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Make new file and open in vscode
toad() {
    touch "$1" && code "$1"
}

eval "$(oh-my-posh init zsh --config $HOME/.dotfiles/oh-my-posh/robert-russel.toml)"

PATH=/home/rob/bin:$PATH

# Created by `pipx` on 2025-07-14 08:20:40
export PATH="$PATH:/Users/roel99/.local/bin"
