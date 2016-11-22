#!/usr/bin/env bash

# Software I need on every mac system

brew update
brew upgrade

# Basic command line utilities
brew install tree
brew install cmake
brew install git
brew install ngrok
brew install the_silver_searcher
brew install tmux
brew install z

# Programming languages
brew install gradle
brew install node
brew install python
brew install python3
brew install go

# The best text editor
brew install macvim --with-override-system-vim

# The best shell
brew install zsh

# Just fun
brew install cmatrix

# Remove outdated versions from the cellar
brew cleanup
brew linkapps

echo install-osx.sh complete.
