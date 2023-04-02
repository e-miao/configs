#!/bin/bash
mkdir -p ~/tmp
mkdir -p ~/.vim/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp .vimrc ~/

git clone https://github.com/sonph/onehalf.git ~/tmp/onehalf

cd ~/tmp/onehalf && cp -r vim/autoload ~/.vim/ && cp -r vim/colors ~/.vim/

vim +PluginInstall +qall