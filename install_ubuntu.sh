#!/bin/bash
sudo apt-get update
sudo apt-get install -y zsh
sudo apt-get install -y git-core

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zgen
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# Downloads the dotfiles
git clone https://github.com/heronyang/dotfiles /tmp/dotfiles/
cd /tmp/dotfiles/
source config
cp ${dotfiles[@]} ~/

# Bridge .bashrc to .bash_profile
echo "~/.bash_profile" >> ~/.bashrc
