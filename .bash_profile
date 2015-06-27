export PS1="\u@\h \W [\$(date +%k:%M:%S)] > "

export EDITOR=vim

#---------JAVA--------#
export JAVA_VERSION=1.8
export JAVA_HOME=`/usr/libexec/java_home -v $JAVA_VERSION`

export SCALA_HOME=/usr/local/share/scala
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"

#-----------G0-------------#
export GOVERSION=$(brew list go | head -n 1 | cut -d '/' -f 6)
#export GOROOT=/usr/local/opt/go/libexec/bin
export GOROOT=$(brew --prefix)/Cellar/go/$GOVERSION/libexec
export GOPATH=/Users/jerome/go

#---------DOCKER-----------#
export DOCKER_HOST=tcp://127.0.0.1:2376
export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

#---------------- ALIASES --------------------------#

## Bash
alias lart='ls -lart'

## Docker
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias druni="docker run -t -i -P"
alias drund="docker run -d -P"

#------------ SSH COMMANDS -------------#

#---AWS---#
alias hipbot='ssh -i /Users/jerome/.aws/.keys/key-pairs/hipbot.pem ubuntu@ec2-54-243-58-232.compute-1.amazonaws.com'
alias SSH_HIPBOT='ssh -i /Users/jerome/.aws/.keys/key-pairs/hipbot.pem ubuntu@ec2-54-243-58-232.compute-1.amazonaws.com'
alias dm='ssh -i /Users/jerome/.aws/.keys/key-pairs/distantminds.pem ec2-user@ec2-54-243-61-208.compute-1.amazonaws.com'
alias testing='ssh -i /Users/jerome/.aws/.keys/key-pairs/testing.pem ubuntu@ec2-54-235-68-115.compute-1.amazonaws.com'

#--SCHOOL--#
alias riely='ssh cham@riely373.cdm.depaul.edu'
alias school='ssh JCHAMB16@ctilinux1.cstcis.cti.depaul.edu'


#---------------- AWS ENV VARIABLES ---------------------#
export AWS_HOME=/Users/jerome/.aws
export AWS_CREDENTIALS=$AWS_HOME/.keys
export AWS_KEYPAIRS=$AWS_CREDENTIALS/key-pairs

source $AWS_CREDENTIALS/aws-key-vars

#--- CREDENTIALS ---#
export EC2_PRIVATE_KEY=$AWS_CREDENTIALS/pk-T5O5D4Q37KR7AIPS3FBY2ZJQYWFWOQ3Z.pem
export EC2_CERT=$AWS_CREDENTIALS/cert-T5O5D4Q37KR7AIPS3FBY2ZJQYWFWOQ3Z.pem

#--- AUTO-SCALING ---#
export AWS_AUTO_SCALING_HOME=$AWS_HOME/autoscaling

#--- EC2 ---#
export EC2_HOME=$AWS_HOME/ec2


#----- GIT -----#

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
#    source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

#------- FUNCTIONS -------#

## Docker

# remove all containers
drma() {
    docker rm $(docker ps -q -a);
}

# remove all images
drma() {
    docker rmi $(docker iamges -q);
}

eval "$(rbenv init -)"
export PATH=/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$PATH:$HOME/.rbenv/bin:$EC2_HOME/bin
