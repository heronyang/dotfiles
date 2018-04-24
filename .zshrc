# Profiling: http://jb-blog.readthedocs.io/en/latest/posts/0032-debugging-zsh-startup-time.html
# zmodload zsh/zprof

### Specific zshrc ###

# oh-my-zsh
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

plugins=(git zsh-syntax-highlighting)
plugins=(zsh-autosuggestions)

# vim mode related
bindkey -v
export KEYTIMEOUT=1
bindkey "^R" history-incremental-search-backward

# load zgen (lazily: https://github.com/tarjoilija/zgen/issues/92)
zgen () {
    if [[ ! -s ${HOME}/.zgen/zgen.zsh ]]; then
        git clone --recursive https://github.com/tarjoilija/zgen.git \
            ${HOME}/.zgen
    fi
    source ${HOME}/.zgen/zgen.zsh
    zgen "$@"
}

if [[ ! -s ${HOME}/.zgen/init.zsh ]]; then
    echo "Creating a zgen save"
    # specify plugins here
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/vagrant
    zgen oh-my-zsh plugins/bundler
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/python
    zgen oh-my-zsh plugins/virtualenv
    zgen oh-my-zsh plugins/history-substring-search

    zgen load miekg/lean
    zgen save
    zcompile ${HOME}/.zgen/init.zsh
else
    source ${HOME}/.zgen/init.zsh
fi

### Normal bashrc ###

# Defines the include function
include () {
    [[ -f "$1" ]] && source "$1"
}

# Vi mode
set -o vi

# Bash history with timestamp
export HISTTIMEFORMAT="%d/%m/%y %T "

# Go
export GOPATH=~/program/go
export PATH=$PATH:$GOPATH/bin

# Python
export PATH=/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH
alias ipython="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()' --TerminalInteractiveShell.editing_mode=vi"

# Java
[[ -f "/usr/libexec/java_home" ]] && export JAVA_HOME="/usr/libexec/java_home"
export PATH=$JAVA_HOME/bin:$PATH

# Maven
export PATH=/Users/heron/program/java/libs/apache-maven-3.3.9/bin:$PATH

# Custom Binary
export PATH=~/bin:$PATH

# Git alias
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gau='git add --update'
alias ga='git add -A'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'

# PTT
alias ptt="ssh bbsu@ptt.cc"

#
export HISTFILESIZE=100000

# screen
alias s="screen -RR"

# eclimd
alias eclimd="~/.p2/pool/plugins/org.eclim_2.6.0/bin/eclimd"

# spark
export SPARK_LOCAL_IP=127.0.0.1

# IPython
alias py="python -m IPython --TerminalInteractiveShell.editing_mode=vi"
alias py3="python3 -m IPython --TerminalInteractiveShell.editing_mode=vi"

# Links vim as vi
alias vim="vi"

# added by Anaconda3 5.0.1 installer
export PATH="/Users/heron/anaconda3/bin:$PATH"

# pipenv
export PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
export PATH="$PATH:$PYTHON_BIN_PATH"

#
# Private Part
#

# Andrew
alias andrew='ssh hsiangyy@unix.andrew.cmu.edu'
