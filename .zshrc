# Git related shortcuts: https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet#git
export ZSH=~/.oh-my-zsh

source $ZSH/oh-my-zsh.sh
source ~/.bash_profile

plugins=(git zsh-syntax-highlighting)
plugins=(zsh-autosuggestions)

# vim mode related
bindkey -v
export KEYTIMEOUT=1
bindkey "^R" history-incremental-search-backward

# Z
. `brew --prefix`/etc/profile.d/z.sh

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/command-not-found
  # generate the init script from plugins above
  zgen save
fi

zgen load miekg/lean
