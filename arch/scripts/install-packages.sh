#!/usr/bin/env bash

$SCRIPT_PATH = $(dirname $0)

# Update and install yay
sudo pacman -Syy --noconfirm
sudo pacman -Syy --noconfirm yay

sudo yay -Sy --noconfirm --needed "$(cat $SCRIPT_PATH/package-list.txt)"