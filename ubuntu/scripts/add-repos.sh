#!/usr/bin/env bash

set -ex

sudo apt update -y

sudo apt-get install \
   apt-transport-https \
   build-essential \
   ca-certificates \
   curl \
   gnupg-agent \
   software-properties-common -y

# guake
sudo add-apt-repository ppa:linuxuprising/guake

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# hashicorp
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"