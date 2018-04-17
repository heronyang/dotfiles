# default settings
export ZSH=~/.oh-my-zsh
ZSH_THEME="refined"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# read bash settings
source ~/.bash_profile

# vim mode related
bindkey -v
export KEYTIMEOUT=1
bindkey "^R" history-incremental-search-backward

# Z
. `brew --prefix`/etc/profile.d/z.sh
