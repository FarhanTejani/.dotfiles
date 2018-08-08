#!/bin/bash
##############################
# This script creates symlinks from the home directory to any desired
# dotfiles in ~/.dotfiles and sets up conda, spacemacs, vim, and zsh
##############################

########## Variables

dir=~/.dotfiles # dotfiles directory
olddir=~/.dotfiles_old # old dotfiles backup directory
files="spacemacs tmux.conf vimrc zshenv zshrc" # list of files to symlink
conda_link="https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh"

##########

# Install Miniconda
echo "##### Installing Miniconda #####"
set +e
curl $conda_link -o Miniconda_Install.sh
if [ $? -ne 0 ]; then
    curl $conda_link -o Miniconda_Install.sh
fi
set -e

bash Miniconda_Install.sh -b -f
rm Miniconda_Install.sh

# Install spacemacs
echo "##### Installing spacemacs #####"
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -s /usr/local/Cellar/emacs-plus/*/Emacs.app/ /Applications/

# Install vundle
echo "##### Installing vundle #####"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install oh-my-zsh
echo "##### Installing oh-my-zsh #####"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Create dotfiles_old in homedir
echo "##### Creating $olddir to backup any existing dotfiles #####"
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
./install.py --clang-completer --java-completer

# Set zsh as default shell
echo "##### Setting zsh as the default shell #####"
echo "##### NOTE: THIS REQUIRES SUDO ACCESS #####"
echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)

echo "##### Setup Complete! Please restart the shell #####"
