export EDITOR='emacs -nw'
export CLICOLOR=1

# SSH

ssh-add ~/.ssh/github
ssh-add ~/.ssh/gitlab

# ENVIRONMENT

#---------- G0 -----------#

export GOPATH=$HOME/go
export GO111MODULE=on

#-------- ALIASES --------#

## Bash
alias gopath='cd $GOPATH'
alias lart='ls -lart'
alias paux='ps aux'
alias repos='cd ~/repos'
alias pa=FindProcess
alias kp=KillProcess
alias la=ListToLess
alias ll=ListDetailToLess
alias lr=ListRecursively
alias h=GrepHistory
alias hl=GrepHistory
alias cl='clear'
alias clip='xclip -sel clip'

#------- FUNCTIONS -------#

function FindProcess() {
    ps -A -o 'pid,args' | grep "$@" | grep -v grep
}
function KillProcess() {
    killall -9 "$@";
}
function ListToLess() {
    ls -a "$@" | less;
}
function ListDetailToLess() {
    ls -al "$@" | less;
}
function ListRecursively() {
    ls -R "$@";
}
function GrepHistory() {
    history | grep "$@";
}
function GrepHistoryToLess() {
    history | grep "$@" | less;
}

# mkdir and cd
function mcd() {
    mkdir $1 && cd $_
}

function upgrayyedd() {
    sudo dnf update -y && sudo dnf upgrade -y
}

# thefuck
if which thefuck > /dev/null; then
    eval "$(thefuck --alias)"
fi

if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

if which hermes > /dev/null; then
    eval "$(hermes alias)"
fi

if which pyenv > /dev/null; then
    PATH=$(pyenv root)/shims:$PATH
fi

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR=$HOME/.bash-git-prompt/
    GIT_PROMPT_ONLY_IN_REPO=0
    GIT_PROMPT_END="\n\t λ "
    GIT_PROMPT_END_USER="\n\t λ "
    GIT_PROMPT_THEME=Solarized
    source "$HOME/.bash-git-prompt/gitprompt.sh"
fi

if [ -f "/usr/share/bash-completion/bash_completion" ]; then
    . "/usr/share/bash-completion/bash_completion"
fi

export PATH=$GOPATH/bin:$HOME/.cargo/bin:$HOME/.tfenv/bin:$HOME/.pyenv/bin:$PATH
source "$HOME/.cargo/env"


