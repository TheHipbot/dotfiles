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

# TheHipbot's dotfiles

## OS X

### Setup

Requires that you have XCode installed along with the cli tools.

After cloning, you can install the dotfiles by running the following:

    make

### Ubuntu

    OS=ubuntu make

## Arch Linux

    OS=arch make

### Usage

Most of the configurations provided in these dotfiles will work automatically if you follow the steps above.

Here is what the dotfiles will do to or install on your system:
- create symlinks of the dotfiles in this repo to your home folder. these provide config to tools you use on your system, here's the rundown:
  * git - will create a .gitconfig file and a global gitignore to ignore common file types that shouldn't be included in the repos
  * .profile - a bash script that runs at the start of every terminal session for the user, it includes helper functions for bash, aliases, environment variables and more
  * tmux.conf - a base configuration for tmux if you use it
  * emacs - symlink the .emacs.d folder containing an init.el file, this will install a bunch of emacs packages and configuration if you ever start up emacs
  * .bin - a folder container binaries and other executables which are added to your PATH
- run scripts to do additional config and installations, here are the scripts (run in this order):
  * homebrew.sh - installs homebrew if it is not already installed, taps the cardotcom homebrew tap, and runs homebrew bundle which installs all brew packages in the file Brewfile in this repo
  * node.sh - installs the node version manager n and uses n to install the latest LTS version of node
  * bitcar.sh - installs [bitcar](https://github.com/carsdotcom/bitcar) and runs bitcar setup (this requires user input)
  * bash.sh - sets up bash 4 for the system
