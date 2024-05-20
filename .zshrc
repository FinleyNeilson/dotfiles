export ZSH="$HOME/.oh-my-zsh"

export EDITOR=nvim

export TERMINAL='kitty'

ZSH_THEME="spaceship"

plugins=(git you-should-use spaceship-vi-mode zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi


export EDITOR='nvim'

alias ll='ls -l'
alias la='ls -la'
alias a='ls -a'
alias r='ranger'
alias vim='nvim'
alias tor='transmission-cli'
alias tr='transmission-remote'

eval "$(zoxide init zsh)"

export PATH=~/.bin:$PATH
