ZSH=$HOME/.dotfiles/zsh/oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git bundler brew gem docker docker-compose)

export PATH="/usr/local/bin:$HOME/.rbenv/bin:$PATH"
export EDITOR=vim

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
