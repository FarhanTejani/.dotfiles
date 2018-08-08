#!/usr/bin/env bash

# Software I need on every Mac

brew update
brew upgrade

# Basic command line utilities
brew install htop
brew install tree
brew install git
brew install the_silver_searcher
brew install tmux
brew install z

# Text editors
brew install macvim --with-override-system-vim 

brew tap d12frosted/emacs-plus
brew install emacs-plus
brew tap caskroom/fonts
brew cask install font-source-code-pro

# The best shell
brew install zsh

# Just fun
brew install cmatrix

# Remove outdated versions from the cellar
brew cleanup -s

echo install-osx.sh complete.
