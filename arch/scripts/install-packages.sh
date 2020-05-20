#!/usr/bin/env bash

SCRIPT_PATH=$(dirname $0)

# Update and install yay
sudo pacman -Syy --noconfirm yay

yay -Sy --noconfirm --needed - < "$SCRIPT_PATH/package-list.txt"

sudo archlinux-java set java-8-openjdk