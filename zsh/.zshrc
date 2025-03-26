# Initialization code that may require console input (password prompts, [y/n] confirmations, etc.) must go above this block; everything else may go below.

### ------------ EXPORT ------------ ###
export PATH="$HOME/.local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.config/zsh:$PATH"
export NVM_DIR="$HOME/.nvm"
export TERMINAL="ghostty"

### ------------ THEME ------------ ###
ZSH_THEME="robbyrussell"

plugins=(git sudo history encode64 copypath zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh


bindkey -s ^f "tmux-sessionizer\n"

### ------------ Navigation ------------ ###

alias vim='nvim'
alias nano="nvim"
# alias c='clear'
# alias e='exit'
alias bat="batcat"
alias w='nitrogen --set-zoom-fill --random ~/Pictures/wallpapers'
alias fd='fdfind'
alias profileconf='vim ~/.profile'
alias docker='sudo docker'
alias py="python3"
alias ts="ts-node"

# # tmux aliases
alias tm='tmux'
alias tma='tmux attach'
alias tmn='tmux new-session -s'
alias tmls='tmux list-sessions'
alias tmk='tmux kill-session -t'

# configs
alias kittyconf='vim ~/.config/kitty/kitty.conf'
alias ghosttyconf='vim ~/.config/ghostty/config'
alias i3conf='vim ~/.config/i3/config'
alias vimconf='cd ~/.config/nvim && vim'
alias zshconf='vim ~/.zshrc'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# # Listing files
alias la='ls -A'
alias l='ls -CF'
#
# # Git
# alias gbare='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
#
# Package management
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'


alias books="~/Documents/books"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init zsh)"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"
