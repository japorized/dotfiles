#!/bin/sh

echo " === Setting up your macOS installation to be somewhat great. === "

# Register taps
echo " 🚰 Registering taps..."
cat ./brewTaps.txt | xargs brew tap

# brew installations
echo " 🍺 Installing packages..."
cat ./brewPackages.txt | xargs brew install

# brew casks installations
echo " 🍺 Installing casks..."
brew cask
cat ./brewCask.txt | xargs brew install --cask

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
