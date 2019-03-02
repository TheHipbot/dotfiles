export EDITOR='emacs -nw'
export CLICOLOR=1

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

# INITS

export PATH=$GOPATH/bin:$HOME/.cargo/bin:$PATH

# thefuck
if which thefuck > /dev/null; then
    eval "$(thefuck --alias)"
fi

if which hermes > /dev/null; then
    eval "$(hermes alias)"
fi

if which pyenv > /dev/null; then
    PATH=$(pyenv root)/shims:$PATH
fi

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

if [ -f "/usr/lib/bash-git-prompt/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR=/usr/lib/bash-git-prompt/
    GIT_PROMPT_ONLY_IN_REPO=0
    GIT_PROMPT_END="\n\t λ "
    GIT_PROMPT_END_USER="\n\t λ "
    GIT_PROMPT_THEME=Solarized
    source "/usr/lib/bash-git-prompt/gitprompt.sh"
fi

if [ -f "/usr/share/bash-completion/bash_completion" ]; then
    . "/usr/share/bash-completion/bash_completion"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
