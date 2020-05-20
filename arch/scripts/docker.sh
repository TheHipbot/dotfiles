#!/usr/bin/env bash

yay -Sy --noconfirm docker
sudo usermod -aG docker $(whoami)

sudo systemctl enable docker
sudo systemctl start docker