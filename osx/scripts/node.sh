#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source $HOME/.bash_profile
source $HOME/.profile
nvm install --lts