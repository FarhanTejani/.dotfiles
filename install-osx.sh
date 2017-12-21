#!/usr/bin/env bash

# Software I need on every mac system

brew update
brew upgrade

# Basic command line utilities
brew install htop
brew install tree
brew install git
brew install the_silver_searcher
brew install tmux
brew install z
brew cask install vagrant

# Programming languages
brew install python3
pip3 install virtualenv
brew install go

# The best text editor
brew install macvim --with-override-system-vim --with-python3

# The best shell
brew install zsh

# Just fun
brew install cmatrix

# Remove outdated versions from the cellar
brew cleanup -s
brew cask cleanup
brew linkapps

echo install-osx.sh complete.
