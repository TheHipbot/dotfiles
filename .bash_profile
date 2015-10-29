export PS1="\u@\h \W [\$(date +%k:%M:%S)] > "

export EDITOR=emacs

#---------JAVA--------#

export JAVA_VERSION=1.8
export JAVA_HOME=`/usr/libexec/java_home -v $JAVA_VERSION`

export SCALA_HOME=/usr/local/share/scala
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"

#-----------G0-------------#

export GOVERSION=$(brew list go | head -n 1 | cut -d '/' -f 6)
export GOROOT=$(brew --prefix)/Cellar/go/$GOVERSION/libexec
export GOPATH=/Users/jerome/go

#--------DOCKER--------#

export DOCKER_MACHINE_ENV=local

#---------------- ALIASES --------------------------#

## Bash
alias lart='ls -lart'
alias paux='ps -aux'
alias repos='cd ~/repos'

## Docker
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias druni="docker run -t -i -P"
alias drund="docker run -d -P"

#------------ SSH COMMANDS -------------#

#----- INCLUDES -----#

if [ -f ~/.github-creds ]; then
    source ~/.github-creds
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

if [ -f /Users/jerome/.google-cloud-sdk/path.bash.inc ]; then
    # The next line updates PATH for the Google Cloud SDK.
    source ~/.google-cloud-sdk/path.bash.inc
fi

if [ -f /Users/jerome/.google-cloud-sdk/completion.bash.inc ]; then
    # The next line enables shell command completion for gcloud.
    source ~/.google-cloud-sdk/completion.bash.inc
fi

if [ -f ~/.creds ]; then
    source ~/.creds
fi

#------- FUNCTIONS -------#

## SSH

# ssh to instance with keypair
# @var keypair name (with ext)
# @var user@host
sshk() {
    ssh -i "$HOME/.ssh/$1" $2
}

## Docker

# remove all containers
drmca() {
    docker rm $(docker ps -q -a);
}

# remove all images
drmia() {
    docker rmi $(docker images -q);
}

# enter shell of container
dent() {
    docker exec -i -t $1 /bin/bash;
}

# shutdown all containers
ddown() {
    docker stop $(docker ps -q -a);
}

# Machine

# start env
dmstart() {
    docker-machine start $1
}

# stop env
dmstop() {
    docker-machine stop $1
}

# connect env
dmenv() {
    eval "$(docker-machine env $1)"
}

## Java

# change java version
jchg() {
    export JAVA_HOME=`/usr/libexec/java_home -v $1`;
}

## Bash

# mkdir and cd
mcd() {
    mkdir $1 && cd $_
}

#---INITS---#

# rbenv
if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# docker
if [ "$(docker-machine status $DOCKER_MACHINE_ENV)" == "Running" ]; then
    eval "$(docker-machine env $DOCKER_MACHINE_ENV)"
fi

export PATH=/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$HOME/.rbenv/bin:$PATH
