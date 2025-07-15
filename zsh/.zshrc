# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/.local/share/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/.local/share/amazon-q/shell/zshrc.pre.zsh"
# ------------------------------------------
# Initialization (before sourcing anything)
# ------------------------------------------
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/zsh:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
export ANDROID_HOME="/opt/android-sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin"
export TERMINAL="ghostty"
export ZSH="$HOME/.oh-my-zsh"

# ------------------------------------------
# Oh My Zsh + Theme + Plugins
# ------------------------------------------
ZSH_THEME="robbyrussell"
plugins=(git sudo history encode64 copypath zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ------------------------------------------
# NVM initialization
# ------------------------------------------
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
[ -s "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"

# ------------------------------------------
# FZF (fuzzy finder)
# ------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/fzf/key-bindings.zsh

# ------------------------------------------
# Zoxide (directory jumper)
# ------------------------------------------
eval "$(zoxide init zsh)"

# ------------------------------------------
# Key bindings
# ------------------------------------------
bindkey -s ^f "tmux-sessionizer\n"

# ------------------------------------------
# Aliases
# ------------------------------------------

# General tools
alias vim='nvim'
alias nano='nvim'
alias py='python3'
alias ts='ts-node'
alias fd='fdfind'

# File and directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias la='ls -A'
alias l='ls -CF'

# Wallpaper
alias w='feh --bg-scale --randomize ~/Pictures/wallpapers/*'

# Config editing
alias profileconf='vim ~/.profile'
alias zshconf='vim ~/.zshrc'
alias vimconf='cd ~/.config/nvim && vim'
alias i3conf='vim ~/.config/i3/config'
alias kittyconf='vim ~/.config/kitty/kitty.conf'
alias ghosttyconf='vim ~/.config/ghostty/config'

# Package management
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'

# Tmux
alias tm='tmux'
alias tma='tmux attach'
alias tmn='tmux new-session -s'
alias tmls='tmux list-sessions'
alias tmk='tmux kill-session -t'

# ------------------------------------------
# Functions
# ------------------------------------------
runcpp() {
    filename="${1:-main.cpp}"  # Default to main.cpp if no argument is given
    output="${filename%.cpp}"  # Remove .cpp extension for output file name
    g++ "$filename" -o "$output" && ./"$output"
}

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/.local/share/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/.local/share/amazon-q/shell/zshrc.post.zsh"
