#!/bin/bash
##############################
# .make.sh
# This script creates symlinks from the home directory
# to any desired dotfiles in ~/.dotfiles and sets up vim and zsh
##############################

########## Variables

dir=~/.dotfiles # dotfiles directory
olddir=~/.dotfiles_old # old dotfiles backup directory
files="zshrc zshenv tmux.conf vimrc" # list of files to symlink in homedir

##########

# Install vundle
echo "##### Installing vundle #####"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install oh-my-zsh
echo "##### Installing oh-my-zsh #####"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Create dotfiles_old in homedir
echo "##### Creating $olddir for backup of any existing dotfiles #####"
mkdir -p $olddir

# Move any existing dotfiles in homedir to ~/.dotfiles_old directory, then create
# symlinks from the homedir to any files in the ~/.dotfiles directory specified in $files
cd $dir
for file in $files; do
    echo "##### Moving any existing dotfiles to $olddir #####"
    mv ~/.$file $olddir
    echo "##### Creating symlink to $file in home directory #####"
    ln -s $dir/$file ~/.$file
done

# Create vim swap directories, install vundle plugins, and compile YCM
echo "##### Installing vim plugins #####"
cd ~/.vim
mkdir backup swap undo
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer --tern-completer

# Set zsh as default shell
echo "##### Setting zsh as default shell #####"
echo "##### NOTE: THIS REQUIRES SUDO ACCESS #####"
echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)

echo "##### Setup Complete! Please restart the shell #####"
