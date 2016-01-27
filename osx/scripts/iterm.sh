#!/bin/sh
#
# copy iterm plist and read in settings

open -a iTerm
osascript -e 'quit app "iTerm"'
defaults delete com.googlecode.iterm2
cp osx/com.googlecode.iterm2.plist $HOME/Library/Preferences/com.googlecode.iterm2.plist
defaults read -app iTerm
