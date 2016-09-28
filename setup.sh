#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="zshrc zshenv tmux.conf vimrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "##### Creating $olddir for backup of any existing dotfiles #####"
mkdir -p $olddir

# change to the dotfiles directory
echo "##### Changing to the $dir directory #####"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "##### Moving any existing dotfiles to $olddir #####"
    mv ~/.$file $olddir
    echo "##### Creating symlink to $file in home directory #####"
    ln -s $dir/$file ~/.$file
done

# Set up oh-my-zsh
echo "##### Installing oh-my-zsh #####"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Set up vundle and compile YCM
echo "##### Installing vim packages #####"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py --all

# Set zsh as default shell
echo "##### Setting zsh as default shell #####"
echo "##### NOTE: THIS REQUIRES SUDO ACCESS #####"
sudo -s
(which zsh) >> /etc/shells
chsh -s (which zsh)

echo "##### Setup Complete! Please restart the shell #####"