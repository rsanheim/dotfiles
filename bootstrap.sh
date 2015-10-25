#!/usr/bin/env bash

ln -sf ~/src/dotfiles/.bash_profile ~
ln -sf ~/src/dotfiles/.vimrc ~
source ~/.bash_profile
brew bundle
# setup Vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# install plugins via vim + vundle
vim +PluginInstall +qall
echo "==> All done!"
