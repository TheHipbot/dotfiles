#!/usr/bin/env bash

# Update and install yay
sudo pacman -Syy --noconfirm
sudo pacman -Syy --noconfirm yay

sudo yay -Sy --noconfirm --needed "$(cat ./package-list.txt)"