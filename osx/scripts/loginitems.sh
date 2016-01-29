#!/usr/bin/env bash

osascript -e "tell application \"System Events\" to make new login item with properties { path: \"/Applications/iTerm.app\", hidden:false } at end"
osascript -e "tell application \"System Events\" to make new login item with properties { path: \"/Applications/Google Chrome.app\", hidden:false } at end"