#!/usr/bin/env bash

SCRIPT_PATH=$(dirname $0)

set -ex

xargs -a $SCRIPT_PATH/package-list.txt sudo apt-get install -y

git clone https://github.com/tfutils/tfenv.git ~/.tfenv
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

curl https://pyenv.run | bash
