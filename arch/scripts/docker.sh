#!/usr/bin/env bash

yay -Sy docker
sudo usermod -aG docker $(whoami)

sudo systemctl enable docker
sudo systemctl start docker