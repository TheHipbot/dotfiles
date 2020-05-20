export EDITOR=emacs
export CLICOLOR=1

# ENVIRONMENT

#---------- G0 -----------#

export GOPATH=$HOME/go
export GO111MODULE=on

#-------- ALIASES --------#

## Bash
alias gopath='cd $GOPATH'
alias lart='ls -lart'
alias repos='cd ~/repos'

#------- FUNCTIONS -------#

# mkdir and cd
function mcd() {
    mkdir $1 && cd $_
}

# INITS

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

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=0
    GIT_PROMPT_END="\n\t λ "
    GIT_PROMPT_END_USER="\n\t λ "
    GIT_PROMPT_THEME=Solarized
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f "$(brew --prefix)/opt/bash-completion/etc/bash_completion" ]; then
    . "$(brew --prefix)/opt/bash-completion/etc/bash_completion"
fi

export PATH=/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$PATH