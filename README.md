# dotfiles

These are my dotfiles much of which was inspired by [Zach Holman's dotfiles](https://github.com/holman/dotfiles).
Running the dotfiles requires Ruby to be installed. Any version should do as all the code is pretty vanilla.

At the time of writing, these dotfiles primarily do 2 things. All files with the .symlink extension will be 
symlinked to the users home directory and all scripts in the scripts folder will be run. One thing to note is that
both the root symlinks and scripts as well as the platform specific symlinks and scripts will be included. 

One script for OS X particular will install homebrew and then brew install everything listing in the Brewfile using
homebrew/bundle.

To begin, clone the repo and once you've made your personal edits run the setup script.

```sh
git clone https://github.com/TheHipbot/dotfiles.git
cd dotfiles
./setup <arguments>
```

# Setup Script
Setup takes 2 arguments. 

The first is the platform you are installing them onto which is specified by `--p` or `--platform` followed by the platform 
(which should relate directly to a subdirectory in your repo). At the time of writing, these are all really geared towards OS X, 
but this is all determined by the file structure. When you specify a platform the setup script will take all symlinks and run
all scripts in the root directory (/scripts for scripts). The script will also do the same for the directory whose name matches
the platform specified.

The second argument could be `-l` or `--links-only` which will only run the symlinking task or `f` or `--full-monty` to 
run both tasks.