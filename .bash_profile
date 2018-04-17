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

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/heron/Downloads/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/heron/Downloads/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/heron/Downloads/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/heron/Downloads/google-cloud-sdk/completion.bash.inc'
fi

# Java
export JAVA_HOME=$(/usr/libexec/java_home)
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

# GCP
source ~/program/lib/google-cloud-sdk/path.zsh.inc
source ~/program/lib/google-cloud-sdk/completion.zsh.inc

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
