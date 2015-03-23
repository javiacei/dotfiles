ZSH=$HOME/.dotfiles/zsh/oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git bundler brew gem)

export PATH="/usr/local/bin:$HOME/.rbenv/bin:$PATH"
export EDITOR=vim

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"
