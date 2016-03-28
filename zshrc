ZSH=$HOME/.dotfiles/zsh/oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git bundler brew gem docker docker-compose)

export PATH="/usr/local/bin:$HOME/.rbenv/bin:$PATH"
export EDITOR=vim

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
