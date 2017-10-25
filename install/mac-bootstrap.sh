#!/bin/bash

# Ensure user has edited config.yaml and the dotfiles for proper installation
read response

if [ "$response" -eq "y" ]; then
  echo "Please type \'yes\' to proceed. Terminating this script."
  exit 0
elif [ "$response" -ne "yes" ]; then
  echo 'Please make those changes before running this script again to ensure that everything runs smoothly.'
  exit 0
fi

echo 'Installing xcode cli tools'
/usr/bin/xcode-select --install

# Creating directory for config files
# Note that this is important since macOS does not generate one
# by itself
CONFIG=$HOME/.config

if [ -d $CONFIG ]; then
  echo 'Creating $CONFIG'
  mkdir -p ~/.config/vim ~/.config/mpd ~/.config/ncmpcpp ~/.config/w3m
fi

# Symlink common directories for cleaner configs
echo 'Creating Symlinks'
. $HOME/dotfiles/install/mac-symlinks.sh

# Installing Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Installing Homebrew packages
. $HOME/dotfiles/install/brew-install.sh
