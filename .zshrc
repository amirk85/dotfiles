# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n] confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### ------------ EXPORT ------------ ###
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.config/zsh:$PATH"

### ------------ THEME ------------ ###
# ZSH_THEME="awesomepanda"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git sudo history encode64 copypath zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh


bindkey -s ^f "tmux-sessionizer\n"

### ------------ Navigation ------------ ###

alias vim='nvim'
alias javarun='f() { filename=$(basename "$1" .java); javac "$filename.java" && java "$filename"; }; f'
alias c='clear'
alias e='exit'
alias cat="batcat"
alias w='nitrogen --set-zoom-fill --random ~/Pictures/Wallpapers'
alias fd='fdfind'
alias profileconf='vim ~/.profile'
alias docker='sudo docker'
alias py="python3"
alias ts="ts-node"

bindkey '^;' autosuggest-accept

# tmux aliases
alias tm='tmux'
alias tma='tmux attach'
alias tmn='tmux new-session -s'
alias tmls='tmux list-sessions'
alias tmk='tmux kill-session -t'
alias ls="colorls"

# configs
alias kittyconf='vim ~/.config/kitty/kitty.conf'
alias i3conf='vim ~/.config/i3/config'
alias vimconf='cd ~/.config/nvim && vim'
alias zshconf='vim ~/.zshrc'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias desk='cd ~/Desktop'
alias sb='cd ~/Documents/second-brain'

# Listing files
alias la='ls -A'
alias l='ls -CF'

# Git
alias gts='git status'
alias ga='git add'
alias gc='git commit -m'
alias gco='git checkout'
alias gb='git branch'
alias gl='git log'
alias pull='git pull origin'
alias push='git push origin'
alias gbare='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Package management
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'

export PATH="$HOME/.local/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH=/usr/local/node-v16.15.1/bin:$PATH

# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"
export GO111MODULE=on
export GO111MODULE=on
export GO111MODULE=on
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

