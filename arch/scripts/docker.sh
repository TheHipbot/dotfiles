#!/usr/bin/env bash

sudo yay -Sy docker
if [ -z "$1" ]; then
    sudo usermod -aG docker $1
fi
sudo systemctl enable docker
sudo systemctl start docker