source ~/.dotfiles/zsh/.zsh_paths
source ~/.secrets

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
alias mvim='NVIM_APPNAME=nvim-mini nvim'
alias nnvim='~/.local/nvim-nightly/bin/nvim'

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
alias suws='cd ~/suws-scalability && source .venv/bin/activate'
alias claims='cd ~/claims-ai && source .venv/bin/activate'

alias lg='lazygit'

alias gsp='git add . && git stash save temp && git pull && git stash pop && git reset'

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

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

export PATH="$PATH:$HOME/bin"

# Created by `pipx` on 2025-07-14 08:20:40
export PATH="$PATH:/Users/roel99/.local/bin"

export CLAUDE_CODE_USE_VERTEX=1
export ANTHROPIC_VERTEX_PROJECT_ID=prj-t-vertex-ai-04bc
export CLOUD_ML_REGION=europe-west1

export PATH="$HOME/.roslyn-ls/content/LanguageServer/linux-x64:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
